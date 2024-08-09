-- Active: 1723219687360@@mysql-nathand59.alwaysdata.net@3306@nathand59_bootcamp

#Suppression d'une table
DROP TABLE `Commander`;
DROP TABLE Personne;

# création de la table personne
CREATE TABLE Personne(
    id INT PRIMARY KEY AUTO_INCREMENT,
    taille FLOAT,
    age INT,
    nom varchar(50),
    prenom VARCHAR(50),
    nationalite VARCHAR(50) NOT NULL DEFAULT("Francais")
);

#création de la table produit
CREATE TABLE Produit(
    id INT PRIMARY KEY AUTO_INCREMENT,
    libelle VARCHAR(50),
    prix FLOAT
);

#1. créer les champs des ids des tables environnantes
#2. en faire une cles primaire
#3. les champs des ids doivent POINTER vers les tables "source"
CREATE TABLE Commander(
    idProduit INT,
    idPersonne INT,
    FOREIGN KEY (idProduit) REFERENCES Produit(id),
    FOREIGN KEY (idPersonne) REFERENCES Personne(id),
    PRIMARY KEY(idProduit, idPersonne)
);

#insertion d'une donnée
INSERT INTO Personne(taille,age,nom,prenom,nationalite) VALUE (1.05,15,"dupont","lionel","belge");
INSERT INTO Personne(taille,age,nom,prenom,nationalite) VALUE (1.05,15,"Jose","Thibaut","France");

INSERT INTO Personne(taille,age,nom,prenom) VALUE (1.05,15,"Jose","Thibaut");

#visualisation des données = projection
SELECT *
FROM Personne;

# afficher les informations de l'id 2
# where = filtrage
SELECT *
FROM Personne
WHERE id=2;

# afficher toutes les personnes qui ont un prenom different de lionel
SELECT id,taille
FROM Personne
WHERE prenom <> "lionel"  ;

# afficher toutes les personnes n'ayant pas de nationalite
SELECT *
FROM Personne
WHERE nationalite = "Belge" AND prenom = "Lionel" ;