-- create table hobby
CREATE TABLE hobby 
(
    hobby_id  INT PRIMARY KEY NOT NULL,
    hobby_name VARCHAR(30),
    hobby_type_id int,
    user_id int NOT NULL,
    media_id  INT  NOT NULL
);