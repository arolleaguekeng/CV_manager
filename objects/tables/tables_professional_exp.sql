--
-- create table experience/professional experience by AGUEKENG
--

CREATE TABLE professional_exp
(
    professional_exp_id int primary key,
    experience_id INT NOT NULL,
    begin_date DATE,
    end_date DATE
);