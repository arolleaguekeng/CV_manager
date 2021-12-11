 --
 --  create table experience/academical experience by AGUEKENG
 --
 CREATE TABLE academical_exp
 (
    academical_exp INT PRIMARY KEY NOT NULL,
    intitule varchar(30), 
    diplome varchar(30), 
    begin_date DATE,
    end_date DATE,
    experience_id INT NOT NULL
);