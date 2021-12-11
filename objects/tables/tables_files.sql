--
-- create table files by AGUEKENG
--
CREATE TABLE files
(
    file_id int  PRIMARY KEY NOT NULL,
    file_name VARCHAR(30) NOT NULL, 
    media_id  INT  NOT NULL,
    experience_id INT NOT NULL 
);