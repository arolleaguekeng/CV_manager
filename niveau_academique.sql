CREATE TABLE niveau_academique
(
    id_niveau INT PRIMARY KEY NOT NULL,
    nom_niveau VARCHAR (100),
    Ddepartementid_departement INT,
    coursfiliereid_filiere INT,
    coursniveau_academique_niveau INT,
    coursid_cours INT
);