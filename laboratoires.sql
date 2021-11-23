    CREATE TABLE laboratoires 
    (
         id_laboratoire INT PRIMARY KEY NOT NULL,
         type_laboratoire VARCHAR (100),
         max_nombre_etudiant INT, 
         min_nombre_etudiant INT,
         salle_de_cours INT 
    );