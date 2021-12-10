 ----------------------------------projects contraints------------------------------------
ALTER TABLE projects
    ADD 
    CONSTRAINT fk_project_exp FOREIGN KEY (experience_id) REFERENCES experiences ( experience_id);
--------------------------------------------------------------------------------------------