--
-- create table experience/community experience by AGUEKENG
--

 CREATE TABLE community_exp 
 (
    community_exp_id INT  PRIMARY KEY,
    experience_id INT NOT NULL,
    begin_date DATE,
    end_date DATE
 );