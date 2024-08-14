create table emp
(
noemp int not null,
nom varchar(20),
prenom varchar(20),
emploi varchar(20),
sup int,
embauche date,
sal float,
comm float,
noserv int
);

alter table emp
add constraint PK_EMP primary key (noemp);


create table serv
(
noserv int not null,
service varchar(20),
ville varchar(20)
);

alter table serv
add constraint PK_SERV primary key(noserv);

insert into emp values (1000,'LEROY','PAUL','PRESIDENT',null,'1987-10-25',55005.5,null,1);
insert into emp values (1100,'DELPIERRE','DOROTHEE','SECRETAIRE',1000,'1987-10-25',12351.24,null,1);
insert into emp values (1101,'DUMONT','LOUIS','VENDEUR',1300,'1987-10-25',9047.9,0,1);
insert into emp values (1102,'MINET','MARC','VENDEUR',1300,'1987-10-25',8085.81,17230,1);
insert into emp values (1104,'NYS','ETIENNE','TECHNICIEN',1200,'1987-10-25',12342.23,null,1);
insert into emp values (1105,'DENIMAL','JEROME','COMPTABLE',1600,'1987-10-25',15746.57,null,1);
insert into emp values (1200,'LEMAIRE','GUY','DIRECTEUR',1000,'1987-03-11',36303.63,null,2);
insert into emp values (1201,'MARTIN','JEAN','TECHNICIEN',1200,'1987-06-25',11235.12,null,2);
insert into emp values (1202,'DUPONT','JACQUES','TECHNICIEN',1200,'1988-10-30',10313.03,null,2);
insert into emp values (1300,'LENOIR','GERARD','DIRECTEUR',1000,'1987-04-02',31353.14,13071,3);
insert into emp values (1301,'GERARD','ROBERT','VENDEUR',1300,'1999-04-16',7694.77,12430,3);
insert into emp values (1303,'MASURE','EMILE','TECHNICIEN',1200,'1988-06-17',10451.05,null,3);
insert into emp values (1500,'DUPONT','JEAN','DIRECTEUR',1000,'1987-10-23',28434.84,null,5);
insert into emp values (1501,'DUPIRE','PIERRE','ANALYSTE',1500,'1984-10-24',23102.31,null,5);
insert into emp values (1502,'DURAND','BERNARD','PROGRAMMEUR',1500,'1987-07-30',13201.32,null,5);
insert into emp values (1503,'DELNATTE','LUC','PUPITREUR',1500,'1999-01-15',8801.01,null,5);
insert into emp values (1600,'LAVARE','PAUL','DIRECTEUR',1000,'1991-12-13',31238.12,null,6);
insert into emp values (1601,'CARON','ALAIN','COMPTABLE',1600,'1985-09-16',33003.3,null,6);
insert into emp values (1602,'DUBOIS','JULES','VENDEUR',1300,'1990-12-20',9520.95,35535,6);
insert into emp values (1603,'MOREL','ROBERT','COMPTABLE',1600,'1985-07-18',33003.3,null,6);
insert into emp values (1604,'HAVET','ALAIN','VENDEUR',1300,'1991-01-01',9388.94,33415,6);
insert into emp values (1605,'RICHARD','JULES','COMPTABLE',1600,'1985-10-22',33503.35,null,5);
insert into emp values (1615,'DUPREZ','JEAN','BALAYEUR',1000,'1998-10-22',6000.6,null,5);

commit;


insert into serv values (1,'DIRECTION','PARIS');
insert into serv values (2,'LOGISTIQUE','SECLIN');
insert into serv values (3,'VENTES','ROUBAIX');
insert into serv values (4,'FORMATION','VILLENEUVE D''ASCQ');
insert into serv values (5,'INFORMATIQUE','LILLE');
insert into serv values (6,'COMPTABILITE','LILLE');
insert into serv values (7,'TECHNIQUE','ROUBAIX');


commit;

 /* Correction des exercices */

/*1:Sélectionner toutes les colonnes de la table SERV.*/
select * 
from serv;
/*2:Sélectionner d’une autre manière ces colonnes.*/
select noserv, service, ville
from serv;
/*3:Sélectionner les colonnes SERVICE et NOSERV de la table SERV.*/
select service,noserv
from serv;
/*4:Sélectionner toutes les colonnes de la table EMP.*/
select * 
from emp;
/*5:Sélectionner les emplois de la table EMP.*/
select emploi
from emp;
/*6:Sélectionner les différents emplois de la table EMP.*/
select DISTINCT emploi
from emp;
/*7 : Sélectionner les employés du service N°3.*/
select nom, prenom
from emp
where NOSERV=3;
/*8 : Sélectionner les noms, prénoms, numéro d’employé, numéro
de service de tous les techniciens.*/
select nom,prenom,noemp,noserv
from emp
where emploi='TECHNICIEN';
/*9 : Sélectionner les noms, numéros de service de tous les services
dont le numéro est supérieur à 2.*/
select service,noserv
from serv
where noserv>2;
/*10 : Sélectionner les noms, numéros de service de tous les
services dont le numéro est inférieur ou égal à 2.*/
select service,noserv
from serv
where noserv<=2;
/*11 : Sélectionner les employés dont la commission est inférieure
au salaire. Vérifiez le résultat jusqu’à obtenir la bonne réponse.*/
select nom,prenom, sal,comm
from emp
where comm < sal;
/*ou*/
select nom,prenom, sal,comm
from emp
where IFNULL(COMM,0)<SAL;

/*12 : Sélectionner les employés qui ne touchent jamais de
commission.*/
select nom,prenom,comm
from emp
where comm is null;
/*13 : Sélectionner les employés qui touchent éventuellement une
commission et dans l’ordre croissant des commissions.*/
select nom,prenom,comm
from emp
where comm is not null
order by comm;
/*14 : Sélectionner les employés qui ont un chef.*/
select nom,prenom,sup
from emp
where sup is not null;
/*15 : Sélectionner les employés qui n’ont pas de chef.*/
select nom,prenom,sup
from emp
where sup is null;
/*16 : Sélectionner les noms, emploi, salaire, numéro de service de tous les
employés du service 5 qui gagnent plus de 20000 €.*/
select nom,emploi,sal,noserv
from emp
where noserv=5
and SAL>20000;
/* 17 : Sélectionner les vendeurs du service 6 qui ont un revenu mensuel
supérieur ou égal à 9500 €.*/
select nom, sal+comm as revenu, noserv, emploi 
from emp
where emploi='VENDEUR'
and noserv=6
and sal+IFNULL(comm,0)>=9500;
/*18 : Sélectionner dans les employés tous les présidents et directeurs.
Attention, le français et la logique sont parfois contradictoires.*/
select * 
from emp
where emploi IN ('PRESIDENT','DIRECTEUR');
/* 19 : Sélectionner les directeurs qui ne sont pas dans le service 3.*/
select *
from emp
where emploi='DIRECTEUR'
and not noserv=3;
/* 20 : Sélectionner les directeurs et « les techniciens du service 1 ».*/
select * 
from emp
where EMPLOI='DIRECTEUR'
or (emploi='TECHNICIEN' and noserv=1); 
/*21 : Sélectionner les « directeurs et les techniciens » du service 1.*/
select *
from emp
where noserv=1
and emploi in ('DIRECTEUR','TECHNICIEN');
/* 22 : Sélectionner les employés du service 1 qui sont directeurs ou techniciens.*/
select *
from emp
where noserv=1
and (emploi='DIRECTEUR' or emploi='TECHNICIEN');
/*23 : Sélectionner les employés qui ne sont ni directeur, ni technicien et
travaillant dans le service 1.*/
select *
from emp
where emploi not in ('DIRECTEUR','TECHNICIEN')
and noserv=1;

/*24 : Sélectionner les employés qui sont techniciens, comptables ou vendeurs.*/
select *
from emp
where emploi in('TECHNICIEN','COMPTABLE','VENDEUR');
/* 25 : Sélectionner les employés qui ne sont ni technicien, ni comptable, ni vendeur.*/
select *
from emp
where emploi not in('TECHNICIEN','COMPTABLE','VENDEUR');
/* 26 : Sélectionner les directeurs des services 2, 4 et 5.*/
select *
from emp
where emploi='DIRECTEUR'
and noserv in(2,4,5);

/*27 : Sélectionner les subalternes qui ne sont pas dans les services 1, 3, 5.*/
select * 
from emp
where sup is not null
and noserv not in(1,3,5);
/* 28 : Sélectionner les employés qui gagnent entre 20000 et 40000 euros, bornes comprises.*/
select nom, emploi, sal+IFNULL(comm,0) as revenu
from emp
where sal+IFNULL(comm,0) BETWEEN 20000 and 40000;
/*29 : Sélectionner les employés qui gagnent moins de 20000 et plus de 40000 euros.*/
select nom, emploi,sal+IFNULL(comm,0) as revenu
from emp
where sal+IFNULL(comm,0) not BETWEEN 20000 and 40000;

/* 30 : Sélectionner les employés qui ne sont pas directeur et qui ont été embauchés en 88.*/
select * 
from emp
where emploi<>'DIRECTEUR'
and embauche like '%88%';

/*ou*/
select * 
from emp
where not emploi='DIRECTEUR'
and embauche between '1988-01-01' and '1988-12-31';

/*ou
-- and embauche like '1988-%-%';

*/

/* 31 : Sélectionner les directeurs des services 2 ,3 , 4, 5 sans le IN.*/
select *
from emp
where emploi='DIRECTEUR'
and noserv between 2 and 5;

/*32 :Sélectionner les employés dont le nom commence par la lettre M.*/
select nom, prenom, emploi, noserv
from emp
where nom like 'M%';
/*33 : Sélectionner les employés dont le nom se termine par T.*/
select nom, prenom, emploi, noserv
from emp
where nom like '%T';
/* 34 : Sélectionner les employés ayant au moins deux E dans leur nom.*/
select nom, prenom, emploi, noserv
from emp
where nom like '%E%E%';

/*35 : Sélectionner les employés ayant exactement un E dans leur nom.*/
select nom, prenom, emploi, noserv
from emp
where nom like '%E%'
and nom not like '%E%E%';

/*36 : Sélectionner les employés ayant au moins un N et un O dans leur nom.*/
select nom, prenom, emploi, noserv
from emp
where nom like '%N%'
and nom like '%O%';

/* ou */
select *
from emp
where nom like '%O%N%'
or nom like '%N%O%';

/*37 : Sélectionner les employés dont le nom s'écrit avec 6 caractères et qui se termine par N.*/
select nom, prenom, emploi, noserv
from emp
where nom like '%N'
and nom like '%______%';
/*ou*/
select nom, prenom, emploi, noserv
from emp
where nom like '_____N'
/*38 : Sélectionner les employés dont la troisième lettre du nom est un R.*/
select nom, prenom, emploi, noserv
from emp
where nom like '__R%';

/* 39 : Sélectionner les employés dont le nom ne s'écrit pas avec 5 caractères.*/
select nom, prenom, emploi, noserv
from emp
where nom not like '_____';

/*ou*/
select *
from emp
where length(nom) <> 5;

/*40 : Trier les employés (nom, prénom, n° de service, salaire) du service 3 par
ordre de salaire croissant.*/
select nom,prenom, noserv, sal
from emp
where noserv=3
order by sal asc;
/*41 : Trier les employés (nom, prénom, n° de service , salaire) du service 3
par ordre de salaire décroissant.*/
select nom,prenom, noserv, sal
from emp
where noserv=3
order by  sal desc;
/*42 : Idem en indiquant le numéro de colonne à la place du nom colonne.*/
select nom,prenom, noserv, sal
from emp
where noserv=3
order by  4 desc;
/*43 : Trier les employés (nom, prénom, n° de service, salaire, emploi) par
emploi, et pour chaque emploi par ordre décroissant de salaire.*/
select nom,prenom, noserv, sal,emploi
from emp
order by  emploi,sal desc;
/*44 : Idem en indiquant les numéros de colonnes.*/
select nom,prenom, noserv, sal,emploi
from emp
order by  5,4 desc;
/*45 : Trier les employés (nom, prénom, n° de service, commission) du service
3 par ordre croissant de commission.*/
select nom,prenom, noserv, comm
from emp
where noserv=3
order by  comm;
/*46 : Trier les employés (nom, prénom, n° de service, commission) du service
3 par ordre décroissant de commission, en considérant que celui dont la
commission est nulle ne touche pas de commission.*/
select nom,prenom, noserv, comm
from emp
where noserv=3 
and comm is not null
order by  comm desc;

/*47 : Sélectionner le nom, le prénom, l'emploi, le nom du service de l'employé
pour tous les employés.*/
select nom, prenom, emploi, service
from emp, serv
where emp.noserv= serv.noserv;
/*48 : Sélectionner le nom, l'emploi, le numéro de service, le nom du service
pour tous les employés.*/
select emp.nom, emp.emploi, emp.noserv, serv.service
from emp, serv
where emp.noserv= serv.noserv;
/*49 : Idem en utilisant des alias pour les noms de tables.*/
select e.nom, e.emploi, e.noserv, s.service
from emp e, serv s
where e.noserv= s.noserv;
/*50 : Sélectionner le nom, l'emploi, suivis de toutes les colonnes de la table
SERV pour tous les employés.*/
select e.nom, e.emploi, s.noserv, s.service, s.ville
from emp e, serv s
where e.noserv= s.noserv;

/*ou*/
select nom, emploi, s.*
from emp e, serv s
where e.noserv = s.noserv;
/*51 : Sélectionner les nom et date d'embauche des employés suivi des nom et
date d'embauche de leur supérieur pour les employés plus ancien que leur
supérieur, dans l'ordre nom employés, noms supérieurs.*/

select employe.nom, employe.embauche, superieur.nom, superieur.embauche
from emp employe, emp superieur
where employe.sup= superieur.noemp
and employe.embauche<superieur.embauche
order by employe.nom, superieur.nom;

/*52 : Sélectionner sans doublon les prénoms des directeurs et « les prénoms des
techniciens du service 1 » avec un UNION.*/
select prenom
from emp
where emploi='DIRECTEUR'
union
select prenom 
from emp
where emploi='TECHNICIEN'
and noserv=1;
/*53 : Sélectionner les numéros de services n’ayant pas d’employés sans une
jointure externe.*/

select noserv
from serv 
where noserv not in (select distinct noserv from emp);

/*54 : Sélectionner les services ayant au moins un employé.*/


select noserv
from serv 
where noserv in (select distinct noserv from emp);

/*54 bis : Sélectionner les numéros de services ayant des employés sans une
jointure externe*/
SELECT distinct noserv
FROM emp;

/*55 : Sélectionner les employés qui travaillent à LILLE.*/
select nom, prenom, emp.noserv, service, ville
from emp, serv
where emp.noserv=serv.noserv
and ville='LILLE';

/*ou*/
select nom, prenom
from emp
where noserv in (select noserv
                from serv
                where ville = 'LILLE');
/*56 : Sélectionner les employés qui ont le même chef que DUBOIS, DUBOIS exclu.*/
select nom, prenom, noserv, emploi, sup
from emp
where nom<>'DUBOIS'
and sup=(select sup 
           from emp
           where nom='DUBOIS')
           ;
/*57 : Sélectionner les employés embauchés le même jour que DUMONT.*/
select nom, prenom, noserv, emploi, embauche
from emp
where embauche=(select embauche 
           from emp
           where nom='DUMONT')
           ;
/*58 : Sélectionner les nom et date d'embauche des employés plus anciens que MINET,
dans l’ordre des embauches.*/
select nom, prenom, emploi, embauche
from emp
where embauche<(select embauche 
           from emp
           where nom='MINET')
order by embauche;
/*59 : Sélectionner le nom, le prénom, la date d’embauche des employés plus anciens
que tous les employés du service N°6. (Attention MIN)*/
select nom, prenom, emploi, embauche
from emp
where embauche<(select min(embauche) 
           from emp
           where noserv=6)
order by embauche;
/*60 : Sélectionner le nom, le prénom, le revenu mensuel des employés qui gagnent
plus qu'au moins un employé du service N°3, trier le résultat dans l'ordre croissant
des revenus mensuels.*/
select nom, prenom, emploi, embauche, (sal+IFNULL(comm,0)) as revenu
from emp
where (sal+IFNULL(comm,0))>=(select min(sal+IFNULL(comm,0))
           from emp
           where noserv=3)
order by (sal+IFNULL(comm,0));
/*61 : Sélectionner les noms, le numéro de service, l’emplois et le salaires des
personnes travaillant dans la même ville que HAVET.*/
select nom, prenom, emp.noserv, emploi, sal, ville 
from emp, serv
where emp.noserv=serv.noserv
and ville=(select ville
                from serv,emp
                where emp.noserv=serv.noserv
                and nom='HAVET');
                
                /*ou mieux*/
                
select nom, e.noserv, emploi, sal
from emp e, serv s
where e.noserv = s.noserv
and s.ville = (select ville
               from serv s1, emp e1
               where e1.noserv = s1.noserv
               and nom = 'HAVET');                
/*62 : Sélectionner les employés du service 1, ayant le même emploi qu'un employé du
service N°3.*/
select *
from emp
where noserv=1
and emploi in (select emploi
                from emp
                where noserv=3);
/*63 : Sélectionner les employés du service 1 dont l'emploi n'existe pas dans le service
3.*/
select *
from emp
where noserv=1
and emploi not in (select emploi
                from emp
                where noserv=3);

/*64 : Sélectionner nom, prénom, emploi, salaire pour les employés ayant même emploi
et un salaire supérieur à celui de CARON.*/
select nom, prenom, emploi, sal
from emp
where emploi=(select emploi
                from emp
                where nom='CARON')
and sal>(select sal
                from emp
                where nom='CARON');
                
                /*ou*/
select nom, prenom, emploi, sal
from emp e
where sal > (select sal
             from emp e1
             where nom = 'CARON'
             and e.emploi = e1.emploi);
/*65 : Sélectionner les employés du service N°1 ayant le même emploi qu'un employé du
service des VENTES.*/
select nom, prenom, emploi, sal
from emp
where noserv=1
and emploi in (select emploi
                from emp, serv
                where emp.noserv=serv.noserv
                and service='VENTES');
/*66 : Sélectionner les employés de LILLE ayant le même emploi que RICHARD, trier
le résultat dans l'ordre alphabétique des noms.*/
select nom, prenom, ville
from emp e, serv s
where e.noserv = s.noserv
and ville = 'LILLE'
and emploi = (select emploi
              from emp
              where nom = 'RICHARD')
order by nom; 
/*67 : Sélectionner les employés dont le salaire est plus élevé que le salaire moyen de leur
service (moyenne des salaires = avg(sal)), résultats triés par numéros de service.*/
select nom, prenom, sal, noserv
from emp e
where sal > (select avg(sal)
                from emp m
                where e.noserv=m.noserv)
order by noserv;
/*68 : Sélectionner les employés du service INFORMATIQUE embauchés la même
année qu'un employé du service VENTES.( année : DATE_FORMAT(embauche,'%Y') )*/

select nom, prenom, service, embauche
from emp e, serv s
where e.noserv = s.noserv
and service = 'INFORMATIQUE'
and DATE_FORMAT(embauche,'%Y') in (select DATE_FORMAT(embauche,'%Y')
                                 from emp e1, serv s1
                                 where e1.noserv = s1.noserv
                                 and service = 'VENTES');
/*69 : Sélectionner le nom, l’emploi, la ville pour les employés qui ne travaillent pas dans
le même service que leur supérieur hiérarchique direct.*/
select nom, prenom, emploi, ville, e.noserv
from emp e, serv s
where e.noserv = s.noserv
and ville <> (select ville
            from emp e1, serv s1
            where e1.noserv = s1.noserv
            and e.sup = e1.noemp);

select nom, emploi, ville
from emp e, serv s
where e.noserv = s.noserv
and e.noserv <> (select noserv
                 from emp e1
                 where e1.noemp = e.sup);

/*70 : Sélectionner le nom, le prénom, le service, le revenu des employés qui ont des
subalternes, trier le résultat suivant le revenu décroissant.*/
select nom, prenom, emploi, (sal+IFNULL(comm,0)) as revenu , noserv
from emp
where noemp in (select sup
                from emp)
order by (sal+IFNULL(comm,0)) desc;

/*71 :Sélectionner le nom, l’emploi, le revenu mensuel (nommé Revenu) avec deux décimales
pour tous les employés, dans l’ordre des revenus décroissants.*/
select nom, emploi, ROUND ((sal+IFNULL(comm,0)),2) as revenu
from emp
order by revenu desc;
/*72 : Sélectionner le nom, le salaire, commission des employés dont la commission représente
plus que le double du salaire.*/
select nom, emploi, sal, comm
from emp
where comm>sal*2;
/*73 : Sélectionner nom, prénom, emploi, le pourcentage de commission (deux décimales) par
rapport au revenu mensuel ( renommé "% Commissions") , pour tous les vendeurs dans
l'ordre décroissant de ce pourcentage.*/
select nom, prenom, emploi, round(IFNULL(comm,0)/(sal+IFNULL(comm,0))*100,2) as "%commissions"
from emp
where emploi='VENDEUR'
order by "%commissions" desc;
/*74 : Sélectionner le nom, l’emploi, le service et le revenu annuel ( à l’euro près) de tous les
vendeurs.*/
select nom, emploi, service,round((sal+IFNULL(comm,0))*12,0) as revenu
from emp, serv
where emploi='VENDEUR'
and emp.noserv=serv.noserv;
/*75 : Sélectionner nom, prénom, emploi, salaire,commissions, revenu mensuel pour les employés
du service dont le numéro sera saisi au clavier.*/
select nom, prenom, emploi, sal, comm, sal+IFNULL(comm,0) as revenu
from emp
where noserv in (3,5,6);
/*76 : Idem en remplaçant les noms des colonnes : SAL par SALAIRE, COMM par
COMMISSIONS, SAL+IFNULL(COMM,0) par GAIN_MENSUEL.*/
select nom, prenom, emploi, sal as salaire, comm as commissions, sal+IFNULL(comm,0) as GAIN_MENSUEL
from emp
where noserv in (3,5,6);

/*77 : Idem en remplaçant GAIN_ MENSUEL par GAIN MENSUEL*/
select nom, prenom, emploi, sal as salaire, comm as commissions, sal+IFNULL(comm,0) as 'GAIN MENSUEL'
from emp
where noserv in (3,5,6);
/*78 : Afficher le nom, l'emploi, les salaires journalier et horaire pour les employés du service
dont le numéro sera saisi au clavier (22 jours/mois et 8 heures/jour), sans arrondi, arrondi au
centime près.*/
select nom, emploi, round((sal/22),2) as 'salaire journalier', round((sal/22/8),2) as 'salaire horaire'
from emp
where noserv in (3,5,6);
/*79 : Idem sans arrondir mais en tronquant.*/
select nom, emploi, truncate((sal/22),2) as 'salaire journalier', truncate((sal/21/8),2) as 'salaire horaire'
from emp
where noserv in (3,5,6);

/*80 : Concaténer les colonnes Service et Ville en les reliant par " ----> ", les premières lettres des
noms de villes doivent se trouver sur une même verticale.*/
select service, ville, rpad(service,(select max(length(service)) from serv),'-')|| '--->' || ville as 'service-->ville'
from serv;

alter table serv
modify service varchar(30);
insert into serv
values (8, 'DEPARTEMENT DES LANGUES', 'ROUBAIX');

/*81 : Sélectionner nom, emploi pour les employés en ajoutant une colonne "CODE EMPLOI",
trier le résultat sur ce code.**** 0 signifie que le code emploi n’existe pas.*/
select nom, emploi, (case when emploi='PRESIDENT' then 1
                          when emploi='DIRECTEUR' then 2 
                          when emploi='COMPTABLE' then 3
                          when emploi='VENDEUR' then 4
                          when emploi='TECHNICIEN' then 5
                          else 0
                    end) as 'code emploi'
from emp
order by 3;


/* 82 : Sélectionner les employés en remplaçant les noms par '*****' dans le service n°1, trier le
résultat suivant le N° de service.*/
select (case when noserv=1 then '**********'        
             else nom
        end) as nom, prenom, noserv
from emp
order by 3;
/*83 : Sélectionner les noms des services en affichant que les 5 premiers caractères.*/
select substr(service,1,5)
from serv;
/*84 : Sélectionner les employés embauchés en 1988.*/
select *
from emp
where embauche>='1988-01-01'
and embauche<'1989-01-01'
order by embauche;

/*ou*/
select *
from emp
where DATE_FORMAT(embauche,'%Y')=1988
order by embauche;

/*ou*/
select *
from emp
where embauche like '%88%'
order by embauche;

/* 85 : Sélectionner les noms des employés sur 3 colonnes la première en majuscules, la seconde
avec l'initiale en majuscule et le reste en minuscules, la troisième en minuscules.*/
select upper(nom) as 'Nom en Maj', concat(upper(substring(nom,1,1)),lower(substring(nom,2,length(nom)))) 'Nom en Cap', lower(nom) 'Nom en Min'
from emp;
/*86 : Sélectionner les positions des premiers M et E dans les noms des employés*/
select nom,instr(nom,'M') as "position du 1er M", instr(nom,'E') as "position du 1er E"
from emp;

/*ou*/

select nom,(case when locate('M',nom)=0 then 'Pas de M'
               else locate('M',nom)
            end) as "position du 1er M", (case when locate('E',nom)=0 then 'Pas de E'
                               else locate('E',nom)
                                          end) as "position du 1er E"
from emp

/*87 : Afficher le nombre de lettres qui sert à écrire le nom de chaque service.*/
select service, length(service) as "nb de  lettres pour écrire"
from serv;
/*88 : Tracer un Histogramme des salaires avec nom, emploi, salaire triés dans l'ordre décroissant
(max de l’histogramme avec 30 caractères).*/
select nom, emploi,sal, rpad('#',sal/2000,'#') as Histo_SAL
from emp;
/*89 : Sélectionner nom, emploi, date d'embauche des employés d’un service dont le numéro sera
saisi au clavier.*/
select nom, emploi, embauche, noserv
from emp
where noserv=6;

/*90 : Même chose en écrivant la colonne embauche sous la forme ‘dd-mm-yy’, renommée
embauche.*/
select nom, emploi, DATE_FORMAT(embauche,'%d-%m-%y') as embauche, noserv
from emp
where noserv=6;
/*91 : Même chose en écrivant la colonne embauche sous la forme ‘day dd month yyyy'*/
select nom, emploi, DATE_FORMAT(embauche,'%a %d %M %Y') as embauche, noserv
from emp
where noserv=6;
/*92 : Même chose en écrivant la colonne embauche sous la forme ‘day dd month(abv) yy'*/
select nom, emploi, DATE_FORMAT(embauche,'%a %d %b %y') as embauche, noserv
from emp
where noserv=6
/*93 : Même chose en écrivant la colonne embauche sous la forme 'yy month(abv) dd'*/
select nom, emploi, DATE_FORMAT(embauche,'%y %b %d') as embauche, noserv
from emp
where noserv=6;
/*94 : Même chose en écrivant la colonne embauche sous la forme ‘Day-dd-Month-yyyy'*/
select nom, emploi, DATE_FORMAT(embauche,'%a-%d-%M-%Y') as embauche, noserv
from emp
where noserv=6;
/*95 : Sélectionner les employés avec leur ancienneté en jours dans l'entreprise.*/
select nom, prenom, emploi, noserv, embauche, datediff(sysdate(),embauche) as anciennete
from emp
order by anciennete desc;

/*96 : Sélectionner les employés avec leur ancienneté en mois dans l'entreprise.*/
select nom, prenom, emploi, noserv, embauche, timestampdiff(month,embauche,sysdate()) as anciente
from emp
order by anciente desc;
/*97 : Sélectionner toutes les dates d’embauche majorées de 12 ans.(en rajoutant 12 ans à leurs anciennetés)*/
select nom, prenom, emploi, embauche,concat(date_format(embauche,'%Y')+12,date_format(embauche,'-%m-%d')) as 'embauche majorée de 12 ans'
from emp
order by 5 desc;
/*98 : Sélectionner les employés ayant plus de 12 ans d’ancienneté.*/
select nom, prenom, emploi, embauche, timestampdiff(year,embauche,sysdate()) as anciennete
from emp
where timestampdiff(year,embauche,sysdate()) >12
order by 5;

select nom, prenom, emploi, embauche, timestampdiff(month,embauche,sysdate()) as anciennete
from emp
where timestampdiff(month,embauche,sysdate()) >144
order by 5;

/*99 : Depuis combien de jours êtes-vous nés ?*/
select  timestampdiff(day,'1980-12-24',sysdate()) as 'Mon age en jours'

/*100 : Depuis combien de mois êtes-vous nés ?*/
select  timestampdiff(month,'1980-12-24',sysdate()) as 'Mon age en jours'

/*101 : Afficher la moyenne des revenus (avec commission) des vendeurs.*/
select avg(sal+IFNULL(comm,0)) as "moyenne salaire"
from emp
where emploi='VENDEUR';

/* 102 : Paramétrer la requête qui précède sur l’emploi.*/
select emploi,avg(sal+IFNULL(comm,0)) as "moyenne salaire"
from emp
group by  emploi;


/* 103 : Afficher la somme des salaires et la somme des commissions des
vendeurs.*/
select sum(sal) as "Total des salaires", sum(IFNULL(comm,0)) as "total des commissions"
from emp 
where emploi='VENDEUR';

/* 104 : Afficher le plus haut salaire, le plus bas salaire, la différence entre les
deux.*/

select max(sal) as "Salaire max", min(sal) as "Salaire Min", (max(sal)-min(sal)) as "ecart des salaires", STDDEV(sal) as x1, variance(sal) as x2
from emp;

/* 105 : Compter les employés embauchés chaque trimestre.*/
select count(noemp) as 'Nombre de recrues', DATE_FORMAT(embauche,'%Y')
from emp
group by DATE_FORMAT(embauche,'%Y')
order by 2;

/*106 : Afficher le nombre de lettres du service dont le nom est le plus court.*/
select min(length(service))
from serv;

/*107 : Sélectionner nom, emploi, revenu mensuel de l'employé qui gagne le
plus.*/
select nom, emploi, (sal+IFNULL(comm,0)) as Revenu
from emp
where (sal+IFNULL(comm,0)) = (select max(sal+IFNULL(comm,0))
                           from emp);
           

/*108 : Déterminer le nombre d'employés du service 3 qui reçoivent
éventuellement une commission.*/

select count(noemp)
from emp
where noserv = 3
and comm is not null;

/* 109 : Déterminer le nombre d'emploi différents du service N°1.*/
select count(distinct emploi)
from emp
where noserv=1;

/*110 : Déterminer le nombre d'employés du service N°3.*/
select count(noemp)
from emp
where noserv=3;

/*111 : Pour chaque service, afficher son N° et le salaire moyen des employés du service
arrondi l’euro près.*/
select noserv,round(avg(sal),0) as "Salaire Moyen"
from emp
group by noserv
order by noserv;
/*112 : Pour chaque service donner le salaire annuel moyen de tous les employés qui ne
sont ni président, ni directeur.*/
select noserv,round(avg(sal*12),0) as "Salaire Annuel Moyen"
from emp
where emploi not in('PRESIDENT','DIRECTEUR')
group by noserv
order by noserv;
/*113 : Grouper les employés par service et par emploi à l'intérieur de chaque service,
pour chaque groupe afficher l'effectif et le salaire moyen.*/
select noserv, emploi, round(avg(sal),0) as "Salaire moyen", count(noemp) as effectif
from emp
group by noserv, emploi
order by noserv, emploi;

select noserv, emploi, 
count(noemp)as EFF, round(avg(sal),0) as SALMOY
from emp
group by noserv, emploi
order by noserv, emploi;
/*114 : Idem en remplaçant le numéro de service par le nom du service.*/

select service, emploi, 
count(noemp)as EFF, round(avg(sal),0) as SALMOY
from serv, emp
where serv.noserv=emp.noserv
group by service, emploi
order by service, emploi;

/*115 : Afficher l'emploi, l'effectif, le salaire moyen pour tout type d'emploi ayant plus
de deux représentants.*/
select emploi, count(noemp) as effectif, round(avg(sal+IFNULL(comm,0))) as Salaire_Moyenne
from emp
group by emploi
having count(noemp)>2

/* 116 : Sélectionner les services ayant au mois deux vendeurs.*/
select service , count(noemp) as effectif
from emp, serv
where emploi='VENDEUR'
and emp.noserv=serv.noserv
group by service
having count(noemp)>=2;

/*ou*/

select noserv, count(noemp) as effectif
from emp
where emploi = 'VENDEUR'
group by noserv
having count(noemp) >= 2;

/*117 : Sélectionner les services ayant une commission moyenne supérieure au quart du
salaire moyen.*/

select service , round(avg(IFNULL(comm,0)),0) as MOY_COMM, round(avg(sal)/4,0) as SAL_MOY
from emp, serv
where emp.noserv=serv.noserv
group by service
having avg(IFNULL(comm,0))> avg(sal)/4;

/*118 : Sélectionner les emplois ayant un salaire moyen supérieur au salaire moyen des
directeurs.*/

select emploi ,round(avg(sal),0) as SAL_MOY
from emp
group by emploi
having avg(sal)> (select avg(sal) 
                    from emp
                    where emploi='DIRECTEUR');

/* 119 : Afficher, sur la même ligne, pour chaque service, le nombre d'employés ne
touchant pas de commission et le nombre d'employés touchant une commission.*/

select service, count(comm) as commOk, count(*)-count(comm)as commPasOk
from emp, serv
where emp.noserv=serv.noserv
group by service;
/*120 : Afficher l'effectif, la moyenne et le total pour les salaires et les commissions par
emploi.*/

select emploi,count(emploi) as effectif, avg(sal) as salMoy, sum(sal) as SalTotal, avg(comm) as commisMoy, sum(comm) as commisTotal
from emp
group by emploi;
/*Pour ces exercices, vous devez vous connecter sous votre identifiant et faire une copie
des tables EMP et SERV.*/
create table emp2
(
noemp int(4) not null,
nom varchar(20),
prenom varchar(20),
emploi varchar(20),
sup int(4),
embauche date,
sal float(9,2),
comm float(9,2),
noserv int(2)
);

alter table emp2
add constraint PK_EMP2 primary key (noemp);


create table serv2
(
noserv int(2) not null,
service varchar(20),
ville varchar(20)
);

alter table serv2
add constraint PK_SERV2 primary key(noserv);



insert into emp2 values (1000,'LEROY','PAUL','PRESIDENT',null,'1987-10-25',55005.5,null,1);
insert into emp2 values (1100,'DELPIERRE','DOROTHEE','SECRETAIRE',1000,'1987-10-25',12351.24,null,1);
insert into emp2 values (1101,'DUMONT','LOUIS','VENDEUR',1300,'1987-10-25',9047.9,0,1);
insert into emp2 values (1102,'MINET','MARC','VENDEUR',1300,'1987-10-25',8085.81,17230,1);
insert into emp2 values (1104,'NYS','ETIENNE','TECHNICIEN',1200,'1987-10-25',12342.23,null,1);
insert into emp2 values (1105,'DENIMAL','JEROME','COMPTABLE',1600,'1987-10-25',15746.57,null,1);
insert into emp2 values (1200,'LEMAIRE','GUY','DIRECTEUR',1000,'1987-03-11',36303.63,null,2);
insert into emp2 values (1201,'MARTIN','JEAN','TECHNICIEN',1200,'1987-06-25',11235.12,null,2);
insert into emp2 values (1202,'DUPONT','JACQUES','TECHNICIEN',1200,'1988-10-30',10313.03,null,2);
insert into emp2 values (1300,'LENOIR','GERARD','DIRECTEUR',1000,'1987-04-02',31353.14,13071,3);
insert into emp2 values (1301,'GERARD','ROBERT','VENDEUR',1300,'1999-04-16',7694.77,12430,3);
insert into emp2 values (1303,'MASURE','EMILE','TECHNICIEN',1200,'1988-06-17',10451.05,null,3);
insert into emp2 values (1500,'DUPONT','JEAN','DIRECTEUR',1000,'1987-10-23',28434.84,null,5);
insert into emp2 values (1501,'DUPIRE','PIERRE','ANALYSTE',1500,'1984-10-24',23102.31,null,5);
insert into emp2 values (1502,'DURAND','BERNARD','PROGRAMMEUR',1500,'1987-07-30',13201.32,null,5);
insert into emp2 values (1503,'DELNATTE','LUC','PUPITREUR',1500,'1999-01-15',8801.01,null,5);
insert into emp2 values (1600,'LAVARE','PAUL','DIRECTEUR',1000,'1991-12-13',31238.12,null,6);
insert into emp2 values (1601,'CARON','ALAIN','COMPTABLE',1600,'1985-09-16',33003.3,null,6);
insert into emp2 values (1602,'DUBOIS','JULES','VENDEUR',1300,'1990-12-20',9520.95,35535,6);
insert into emp2 values (1603,'MOREL','ROBERT','COMPTABLE',1600,'1985-07-18',33003.3,null,6);
insert into emp2 values (1604,'HAVET','ALAIN','VENDEUR',1300,'1991-01-01',9388.94,33415,6);
insert into emp2 values (1605,'RICHARD','JULES','COMPTABLE',1600,'1985-10-22',33503.35,null,5);
insert into emp2 values (1615,'DUPREZ','JEAN','BALAYEUR',1000,'1998-10-22',6000.6,null,5);

commit;


insert into serv2 values (1,'DIRECTION','PARIS');
insert into serv2 values (2,'LOGISTIQUE','SECLIN');
insert into serv2 values (3,'VENTES','ROUBAIX');
insert into serv2 values (4,'FORMATION','VILLENEUVE D''ASCQ');
insert into serv2 values (5,'INFORMATIQUE','LILLE');
insert into serv2 values (6,'COMPTABILITE','LILLE');
insert into serv2 values (7,'TECHNIQUE','ROUBAIX');


commit;

/*121 : Augmenter de 10% ceux qui ont une salaire inférieur au salaire moyen. Valider.*/
UPDATE emp2
SET sal = 1.1*(sal)
where sal<(select avg(sal)
            from emp);

/*122 : Insérez vous comme nouvel employé embauché aujourd’hui au salaire que vous
désirez. Valider.*/
insert into emp2 (noemp, nom, prenom, sal, embauche, emploi) 
values ( (select max(noemp)+1 from emp2),'SACI','MOHAMED-ELHADI',3000,'21/12/2017','DEVELOPPEUR');

insert into emp2 (noemp, nom, prenom, sal, embauche, emploi)
values ((select max(noemp)+1 from emp), 'DELSART', 'THIBAULT', (select avg(sal) from emp), '10/11/2005', 'PUPITREUR');
/*123 : Effacer les employés ayant le métier de SECRETAIRE. Valider.*/
DELETE FROM emp2 
WHERE emploi='SECRETAIRE';
commit;
/*124 : Insérer le salarié dont le nom est MOYEN, prénom Toto, no 1010, embauché le
12/12/99, supérieur 1000, pas de comm, service no 1, salaire vaut le salaire moyen des
employés. Valider.*/
insert into emp2 (noemp, nom, prenom, sal, embauche, emploi, sup, noserv) 
values ( 1010,'MOYEN','Toto',(select avg(sal) from emp2),'1999-12-12','DEVELOPPEUR',1000,1);
commit;

/*125 : Supprimer tous les employés ayant un A dans leur nom. Faire un SELECT sur
votre table pour vérifier cela. Annuler les modifications et vérifier que cette action
s’est bien déroulée.*/
delete from emp2
where nom like '%A%';

select *
from emp2;

rollback;

select *
from emp2;

/*126 : Les verrous. Supprimer l’employé créé à l’exercice 122 de votre voisin. Ne pas
valider. Vérifiez tous les deux le contenu de la table. Demander à votre voisin
d’augmenter son propre salaire de 1000 €. Valider la suppression. Chacun vérifie
l’action. Refaire l’exercice en échangeant les rôles.*/
/*127 : Créer les tables EMP et SERV comme copie des tables EMP et SERV.*/
CREATE TABLE EMP1  (SELECT * FROM EMP);
CREATE TABLE SERV1  (SELECT * FROM SERV);

/* 128 : Vérifier que la table PROJ n’existe pas.*/
drop table if EXISTS proj;

/* ou */
use emploi;
show tables;

/* ou */

select * 
from proj;

/*129 :
Créer une table PROJET avec les colonnes suivantes:
numéro de projet (noproj), type numérique 3 chiffres, doit contenir une valeur.  nom de projet (nomproj), type caractère, longueur = 10
budget du projet (budget), type numérique, 6 chiffres significatifs et 2 décimales.
Vérifier l'existence de la table PROJET.
Faire afficher la description de la table PROJET.
C’était une erreur!!! Renommez la table PROJET en PROJ
.*/
create table projet
(
noproj int(3) not null,
nomproj varchar(10),
budget float(6,2)
);

alter table projet
add constraint PK_proj primary key (noproj);

DESCRIBE projet;

rename table projet to proj;
/*130 :
 Insérer trois lignes de données dans la table PROJ:
numéros des projets = 101, 102, 103
noms des projets = alpha, beta, gamma
budgets = 250000, 175000, 950000
 Afficher le contenu de la table PROJ.
 Valider les insertions faites dans la table PROJ.*/
insert into proj (nomproj,noproj,budget) values ('ALPHA', 101,250000);
insert into proj (nomproj,noproj,budget) values ('BETA', 102,175000);
insert into proj (nomproj,noproj,budget) values ('GAMMA', 103,950000);
commit;
select * from proj;

/*131 :
 Modifier la table PROJ en donnant un budget de 1.500.000 Euros au projet 103.
 Modifier la colonne budget afin d'accepter des projets jusque 10.000.000.000 d’Euros
 Retenter la modification demandée 2 lignes au dessus.*/
update proj 
set budget=1500000
where noproj=103;

alter table proj
modify budget float(13,2);

update proj 
set budget=1500000
where noproj=103;
commit;

select *
from proj;

/*132 :
 Ajouter une colonne NOPROJ (type numérique) à la table EMP.
 Afficher le contenu de la table EMP.*/
 alter table emp
 add noproj int(3);

 select *
 from emp;

/*133 : Affecter les employés du service 2 et les directeurs au projet 101.*/
update emp
set noproj=101
where noserv=2
or emploi='DIRECTEUR';
commit;
 select *
 from emp;
/* 134 : Affecter les employés dont le numéro est supérieur à 1350 au projet 102, sauf
ceux qui sont déjà affectés à un projet.*/
update emp
set noproj=102 
where noemp>1350
and noproj is null;
commit;


commit;
/*135 : Affecter les employés n'ayant pas de projet au projet 103.*/
update emp
set noproj=103 
where noproj is null;
commit;
/*136 : Sélectionner les noms d'employés avec le nom de leur projet et le nom de leur
service.*/
select emp.nom,emp.prenom,emp.emploi, proj.nomproj, serv.service
from emp, serv, proj
where emp.noserv=serv.noserv
and emp.noproj=proj.noproj;

/*137 : La liste des tables de l’utilisateur se trouve dans la table système user_tables.
Ecrire une requête qui affiche les noms de toutes vos tables.*/
use emploi;
show tables;

/*138 : Créer la vue EMP1 de la table EMP contenant les colonnes: numéro
d'employé, nom et emploi et limitée aux employés du service numéro 1,*/
create or replace view emp3
as select noserv, nom, emploi
from emp
where noserv=1;
/* 139 : Sélectionner cette vue EMP1 entièrement,*/
select * 
from emp3;
/*140 : Sélectionner les vendeurs de la vue emp1.*/
select *
from emp3
where emploi='VENDEUR';

/* 141 : Modifier la table EMP en transformant l'emploi de NYS en comptable.*/
update emp3
set emploi='COMPTABLE'
where nom = 'NYS';
commit;
/* 142 : Sélectionner la vue EMP1.*/
select *
from emp3;

/* Exercice sur les contraintes */
--Contrainte d'unicité de la table proj (NOPROJ)
alter table proj
add constraint pk_proj primary key (noproj);

--Contrainte clé étrangère table EMP (numéro de service)
alter table emp
add constraint fk_proj foreign key (noproj) references proj(noproj);

alter table emp
add constraint fk_noserv foreign key (noserv) references SERV(NOSERV);
--Contrainte de domaine table PROJ (budget > 20 000) 
alter table proj
add constraint ck_budget check (budget>20000);

--Contrainte clé étrangère table EMP (numéro de supérieur)

alter table emp
add constraint fk_sup foreign key (sup) references emp(noemp);
--Contrainte de domaine table EMP (numéro de supérieur entre 0 et 9999

alter table emp
add constraint ck_sup check (sup between 0 and 9999);


--Contrainte de domaine table SERV (numéro de service < 10) 
alter table serv
add constraint ck_noserv check (noserv<10);

-------------------------- Fin -------------------------------------------
