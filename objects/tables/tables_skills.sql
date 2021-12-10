--
-- create table skills by AGUEKENG
--
CREATE TABLE skills      
(                
    skill_id varchar(255) PRIMARY KEY NOT NULL,
    user_id INT NOT NULL,
    under_skill varchar(255),
	title varchar(255)
);