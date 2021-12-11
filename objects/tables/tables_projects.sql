--
-- create table projects by AGUEKENG
--

CREATE TABLE projects
(
    project_id INT PRIMARY KEY NOT NULL,
    experience_id INT NOT NULL,
    intitule VARCHAR(255),
    begin_date DATE,
    end_date DATE,
    structure_id INT NOT NULL
);