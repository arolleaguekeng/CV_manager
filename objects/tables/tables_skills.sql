--
-- create table skills by AGUEKENG
--
CREATE TABLE skills      
(                
    skill_id int PRIMARY KEY NOT NULL,
    user_id int NOT NULL,
    under_skill varchar(30),
    title VARCHAR(30)
);