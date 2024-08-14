# exercice 16 :
SELECT  nom, emploi, salaire, employe.no_serv
FROM employe
WHERE no_serv=5 AND salaire > 20000;

# exercice 17 :
SELECT nom,prenom
FROM employe
WHERE emploi="VENDEUR" AND no_serv=6 AND salaire >= 9500;

# exercice 18 :
SELECT *
FROM employe
WHERE emploi = "DIRECTEUR" or emploi="PRESIDENT";

# exercice 19 :
select nom, no_serv
FROM employe
WHERE emploi="DIRECTEUR" AND no_serv <> 3;

# exercice 20 : tous les directeurs + technicien du service 1
SELECT nom, prenom, emploi, no_serv
FROM employe
WHERE emploi='DIRECTEUR'
    OR (emploi='TECHNICIEN' AND no_serv=1);

# exercice 21 : tous les directeurs et technicien du service 1
SELECT *
FROM employe
WHERE emploi IN ('DIRECTEUR','TECHNICIEN') AND no_serv=1;

# exercice 22 : Sélectionner les employés du service 1 qui sont directeurs ou techniciens.
# tous les directeurs du service 1 + tous les techniciens (d'autre service)
select nom, emploi,no_serv
FROM employe
WHERE (emploi="directeur" AND no_serv=1)  OR emploi="technicien" ;

# exercice 23 : Sélectionner les employés qui ne sont ni directeur,
# ni technicien et travaillant dans le service 1.
SELECT nom,prenom,emploi,no_serv
FROM employe
WHERE no_serv = 1 AND emploi NOT IN ('DIRECTEUR','TECHNICIEN');

# 24 : Sélectionner les employés qui sont techniciens, comptables ou vendeurs.
SELECT nom,emploi
FROM employe
WHERE emploi IN ('TECHNICIEN','COMPTABLE','VENDEUR');

# 25 : Sélectionner les employés qui ne sont ni technicien, ni comptable, ni vendeur.
SELECT *
FROM employe
WHERE emploi NOT IN('technicien', 'comptable','vendeur');

# 26 : Sélectionner les directeurs des services 2, 4 et 5.
SELECT nom
FROM employe
WHERE emploi= "directeur" AND no_serv IN (2,4,5);

# 27 : Sélectionner les subalternes qui ne sont pas dans les services 1, 3, 5.
select nom, no_serv, emploi
FROM employe
WHERE emploi NOT IN('directeur','president') AND no_serv NOT IN(1,3,5);

# 28 : Sélectionner les employés qui gagnent entre 20000 et 40000 euros,
# bornes comprises.
SELECT *
FROM employe
WHERE salaire BETWEEN '20000' AND '40000';

# 29 : Sélectionner les employés qui gagnent moins de 20000 et plus de 40000 euros.
SELECT *
FROM employe
WHERE salaire NOT BETWEEN 20000 AND 40000;

# 43 : Trier les employés (nom, prénom, n° de service, salaire, emploi)
# par emploi, et pour chaque emploi par ordre décroissant de salaire.
SELECT nom, prenom, no_serv, salaire, emploi
FROM employe
ORDER BY salaire, emploi DESC;

# 44 : Idem en indiquant les numéros de colonnes.
SELECT nom, prenom, no_serv, salaire, emploi
FROM employe
ORDER BY 5 , 4 DESC;

#45 : Trier les employés (nom, prénom, n° de service, commission) du service 3 par
#ordre croissant de commission.
SELECT nom, prenom, no_serv, IFNULL(commission,0) as commission
FROM employe
WHERE no_serv = 3
ORDER BY commission;

# 46 : Trier les employés (nom, prénom, n° de service, commission) du service 3 par
# ordre décroissant de commission, en considérant que celui dont la commission est
# nulle ne touche pas de commission.
SELECT nom, prenom, no_serv, commission
FROM employe
WHERE no_serv=3 AND commission is not null
ORDER BY commission DESC;

# 47 : Sélectionner le nom, le prénom, l'emploi, le nom du service de l'employé pour tous les
# employés.
SELECT nom,prenom,emploi,nom_service
FROM employe as e
INNER JOIN service as s ON e.no_serv = s.no_serv;

# 48 : Sélectionner le nom, l'emploi, le numéro de service, le nom du service
# pour tous les employés.
SELECT nom, emploi, e.no_serv, nom_service
FROM employe AS e
INNER JOIN service AS s ON e.no_serv=s.no_serv;

#49 : Idem en utilisant des alias pour les noms de tables.
SELECT nom, emploi, e.no_serv, nom_service
FROM employe AS e
INNER JOIN service AS s ON e.no_serv=s.no_serv;

#50 :  Sélectionner le nom, l'emploi, suivis de toutes les colonnes de la table
#SERV pour tous les employés
SELECT e.nom,e.emploi, s.*
FROM employe AS e
INNER JOIN service AS s ON e.no_serv=s.no_serv;

#51 : Sélectionner les noms et date d'embauche des employés suivi des noms et
#date d'embauche de leur supérieur si et seulement si les employés sont plus ancien
# que leur supérieur, dans l'ordre nom employés, noms supérieurs
SELECT employes.nom,employes.embauche, superieur.nom, superieur.embauche
FROM employe as employes
INNER JOIN employe as superieur ON employes.superieur = superieur.no_emp
WHERE employes.embauche < superieur.embauche
ORDER BY employes.nom, superieur.nom;

#52: Sélectionner sans doublon les prénoms des directeurs et « les prénoms des
#techniciens du service 1 » avec un UNION.
SELECT prenom
FROM employe
WHERE emploi='DIRECTEUR'
UNION
SELECT prenom
FROM employe
WHERE
    no_serv=1
    AND emploi='TECHNICIEN';

# Vous êtes responsable RH
# vous désirez mettre en place un mecanisme qui permet de calculer une prime
# de performance pour les employés en fonction de leurs anciennetés.
# On veux que ce calcul se fasse automatiquement chaque année
# -> si l'employe a moins de 5 ans : il recoit une prime de 5% de son salaire actuel (hors commission)
# -> si l'employe a entre 5 et 10 ans (inclus) => 10%
# -> si l'employe a plus de 10 ans => 15%
  
CREATE PROCEDURE calculPrimeAnciennete(p_noemp INT)
BEGIN

        DECLARE p_anciennete INT;
        DECLARE p_prime FLOAT;
        DECLARE p_salaire FLOAT;

    #1. calcul de la prime d'ancienneté
        # je prend embauche = je convertie en miliseconde, je prend la date actuelle
                # => je convertie en miliseconde
        # => je compare : j'ai le nombre de milisecond entre les deux dates
            # je converti en année
        SELECT TIMESTAMPDIFF(YEAR,embauche, CURDATE())
        INTO p_anciennete #36
        FROM employe
        WHERE employe.no_emp = p_noemp;

        IF p_anciennete < 5 THEN
            SET p_prime = 1.05;
        ELSEIF p_anciennete BETWEEN  5 AND 10 THEN
            SET p_prime = 1.10;
        ELSE
            SET p_prime = 1.15;
        END IF;

    #2. recuperer le salaire actuel du no_emp
        SELECT employe.salaire
        INTO p_salaire
        FROM employe
        WHERE employe.no_emp = p_noemp;

    #3. calculer le nouveau salaire (salaire * prime)
        SET p_salaire = p_salaire * p_prime;

    #4. mettre à jour le salaire
        UPDATE employe SET salaire = p_salaire WHERE no_emp = p_noemp;
END;
