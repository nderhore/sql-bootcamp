/* 2024-08-09 18:19:44 [20 ms] */ 
DROP TABLE Personne;
/* 2024-08-09 18:19:53 [18 ms] */ 
CREATE TABLE Personne(
    id INT PRIMARY KEY AUTO_INCREMENT,
    taille FLOAT,
    age INT,
    nom varchar(50),
    prenom VARCHAR(50),
    nationalite VARCHAR(50)
);
/* 2024-08-09 18:21:31 [19 ms] */ 
CREATE TABLE Produit(
    id INT PRIMARY KEY AUTO_INCREMENT,
    libelle VARCHAR(50),
    prix FLOAT
);
/* 2024-08-09 18:38:54 [14 ms] */ 
INSERT INTO Personne(taille,age,nom,prenom,nationalite) VALUE (1.05,15,"dupont","lionel","belge");
/* 2024-08-09 18:39:45 [13 ms] */ 
SELECT *
FROM Personne LIMIT 100;
/* 2024-08-09 18:42:22 [14 ms] */ 
SELECT *
FROM Personne
WHERE id=2 LIMIT 100;
/* 2024-08-09 18:43:08 [15 ms] */ 
INSERT INTO Personne(taille,age,nom,prenom,nationalite) VALUE (1.05,15,"Jose","Thibaut","France");
/* 2024-08-09 18:43:11 [13 ms] */ 
SELECT *
FROM Personne LIMIT 100;
/* 2024-08-09 18:43:17 [13 ms] */ 
SELECT *
FROM Personne
WHERE id=2 LIMIT 100;
/* 2024-08-09 18:44:47 [13 ms] */ 
SELECT *
FROM Personne
WHERE prenom != "lionel" LIMIT 100;
/* 2024-08-09 18:45:17 [10 ms] */ 
SELECT *
FROM Personne
WHERE prenom <> "lionel" LIMIT 100;
/* 2024-08-09 18:45:53 [11 ms] */ 
SELECT id,taille
FROM Personne
WHERE prenom <> "lionel" LIMIT 100;
/* 2024-08-09 18:47:48 [13 ms] */ 
INSERT INTO Personne(taille,age,nom,prenom) VALUE (1.05,15,"Jose","Thibaut");
/* 2024-08-09 18:48:00 [14 ms] */ 
SELECT *
FROM Personne LIMIT 100;
/* 2024-08-09 18:49:41 [14 ms] */ 
SELECT *
FROM Personne
WHERE nationalite is null LIMIT 100;
/* 2024-08-09 18:49:58 [12 ms] */ 
SELECT *
FROM Personne
WHERE nationalite = null LIMIT 100;
/* 2024-08-09 18:50:21 [13 ms] */ 
SELECT *
FROM Personne
WHERE nationalite is null LIMIT 100;
/* 2024-08-09 18:50:38 [13 ms] */ 
SELECT *
FROM Personne
WHERE nationalite is not null LIMIT 100;
/* 2024-08-09 18:50:51 [13 ms] */ 
SELECT *
FROM Personne
WHERE nationalite is null LIMIT 100;
/* 2024-08-09 18:52:32 [18 ms] */ 
DROP TABLE `Commander`;
/* 2024-08-09 18:52:33 [18 ms] */ 
DROP TABLE Personne;
/* 2024-08-09 18:52:37 [18 ms] */ 
CREATE TABLE Personne(
    id INT PRIMARY KEY AUTO_INCREMENT,
    taille FLOAT,
    age INT,
    nom varchar(50),
    prenom VARCHAR(50),
    nationalite VARCHAR(50) NOT NULL
);
/* 2024-08-09 18:52:40 [17 ms] */ 
CREATE TABLE Commander(
    idProduit INT,
    idPersonne INT,
    FOREIGN KEY (idProduit) REFERENCES Produit(id),
    FOREIGN KEY (idPersonne) REFERENCES Personne(id),
    PRIMARY KEY(idProduit, idPersonne)
);
/* 2024-08-09 18:52:43 [12 ms] */ 
INSERT INTO Personne(taille,age,nom,prenom) VALUE (1.05,15,"Jose","Thibaut");
/* 2024-08-09 18:52:54 [19 ms] */ 
SELECT *
FROM Personne
WHERE nationalite is null LIMIT 100;
/* 2024-08-09 18:53:19 [264 ms] */ 
SELECT *
FROM Personne LIMIT 100;
/* 2024-08-09 18:53:45 [12 ms] */ 
SELECT *
FROM Personne
WHERE nationalite = null LIMIT 100;
/* 2024-08-09 18:53:54 [11 ms] */ 
SELECT *
FROM Personne
WHERE nationalite = "" LIMIT 100;
/* 2024-08-09 18:55:52 [17 ms] */ 
DROP TABLE `Commander`;
/* 2024-08-09 18:55:53 [23 ms] */ 
DROP TABLE Personne;
/* 2024-08-09 18:55:54 [17 ms] */ 
CREATE TABLE Personne(
    id INT PRIMARY KEY AUTO_INCREMENT,
    taille FLOAT,
    age INT,
    nom varchar(50),
    prenom VARCHAR(50),
    nationalite VARCHAR(50) NOT NULL DEFAULT("Francais")
);
/* 2024-08-09 18:55:57 [19 ms] */ 
CREATE TABLE Commander(
    idProduit INT,
    idPersonne INT,
    FOREIGN KEY (idProduit) REFERENCES Produit(id),
    FOREIGN KEY (idPersonne) REFERENCES Personne(id),
    PRIMARY KEY(idProduit, idPersonne)
);
/* 2024-08-09 18:55:59 [12 ms] */ 
INSERT INTO Personne(taille,age,nom,prenom) VALUE (1.05,15,"Jose","Thibaut");
/* 2024-08-09 18:56:02 [12 ms] */ 
SELECT *
FROM Personne LIMIT 100;
/* 2024-08-09 18:59:52 [15 ms] */ 
SELECT *
FROM Personne
WHERE nationalite = "Francais" AND prenom <> "lionel" LIMIT 100;
/* 2024-08-09 19:00:17 [14 ms] */ 
SELECT *
FROM Personne
WHERE nationalite = "Belge" OR prenom <> "Thibaut" LIMIT 100;
/* 2024-08-09 19:00:25 [13 ms] */ 
SELECT *
FROM Personne
WHERE nationalite = "Belge" OR prenom = "Thibaut" LIMIT 100;
/* 2024-08-09 19:00:42 [12 ms] */ 
SELECT *
FROM Personne
WHERE nationalite = "Belge" AND prenom = "Thibaut" LIMIT 100;
/* 2024-08-09 19:00:48 [12 ms] */ 
SELECT *
FROM Personne
WHERE nationalite = "Belge" OR prenom = "Thibaut" LIMIT 100;
/* 2024-08-09 19:01:20 [12 ms] */ 
SELECT *
FROM Personne LIMIT 100;
/* 2024-08-09 19:01:26 [18 ms] */ 
INSERT INTO Personne(taille,age,nom,prenom,nationalite) VALUE (1.05,15,"dupont","lionel","belge");
/* 2024-08-09 19:01:28 [11 ms] */ 
SELECT *
FROM Personne LIMIT 100;
/* 2024-08-09 19:01:31 [12 ms] */ 
SELECT *
FROM Personne
WHERE nationalite = "Belge" OR prenom = "Thibaut" LIMIT 100;
/* 2024-08-09 19:01:45 [13 ms] */ 
SELECT *
FROM Personne
WHERE nationalite = "Belge" AND prenom = "Thibaut" LIMIT 100;
/* 2024-08-09 19:01:50 [13 ms] */ 
SELECT *
FROM Personne
WHERE nationalite = "Belge" AND prenom = "Lionel" LIMIT 100;
