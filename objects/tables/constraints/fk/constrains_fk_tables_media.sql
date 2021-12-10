 ----------------------------------medias contraints------------------------------------
ALTER TABLE medias
    ADD 
    CONSTRAINT fk_media_project FOREIGN KEY (project_id) REFERENCES projects (project_id);
--------------------------------------------------------------------------------------------