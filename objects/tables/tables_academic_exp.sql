 --
 --  create table experience/academical experience by AGUEKENG
 --
CREATE TABLE academical_exp
 (
	academical_exp_id INT PRIMARY KEY NOT NULL,
    intitule varchar(255), 
    diplome varchar(255), 
    begening_date date,
    end_date date,
	experience_id INT NOT NULL
);