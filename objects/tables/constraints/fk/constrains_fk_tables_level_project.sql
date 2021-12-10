----------------------------------competences level contraints------------------------------------
ALTER TABLE level_project
    ADD 
    CONSTRAINT fk_level_project FOREIGN KEY (project_id) REFERENCES projects (project_id);
----------------------------------------------------------------------------------------------