--
-- create table experiences by AGUEKENG
--

CREATE TABLE experiences
(
    experience_id INT PRIMARY KEY NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    begin_date DATE,
    end_date DATE,
    instituled VARCHAR (255)
);
