--
--  create table experience/other experience by AGUEKENG
--
CREATE TABLE other_exp(
    other_exp int PRIMARY KEY, 
    experience_id INT NOT NULL,
    begin_date DATE,
    end_date DATE
 );