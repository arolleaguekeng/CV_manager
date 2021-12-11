--
-- create table languages by AGUEKENG
--

CREATE TABLE languages
(
    language_id INT PRIMARY KEY NOT NULL, --langue
    language_level varchar(30),
    language_name varchar(30),
    user_id int NOT NULL
);