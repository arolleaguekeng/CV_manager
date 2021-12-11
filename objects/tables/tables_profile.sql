--
-- create table profiles by AGUEKENG
--

CREATE TABLE profiles
(
    profile_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    born_date DATE,
    phone_number INT,
    user_id INT NOT NULL
);