--
-- create table experience/community experience by AGUEKENG
--

CREATE TABLE community_exp 
 (
    community_exp_id INT  PRIMARY KEY,
	beginig_date date,
	end_date date,
    experience_id INT NOT NULL
 );