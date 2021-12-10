--
-- create table languages by AGUEKENG
--

CREATE TABLE languages
(
    language_id INT PRIMARY KEY NOT NULL,
    language_level VARCHAR(30) NOT NULL,
    language_name VARCHAR(30) NOT NULL,
    user_id INT NOT NULL,
	CONSTRAINT fk_language_user FOREIGN KEY (user_id) REFERENCES users (user_id)
);