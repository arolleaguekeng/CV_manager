----------------------------------files contraints------------------------------------
ALTER TABLE files
    ADD 
    CONSTRAINT fk_file_media FOREIGN KEY (media_id) REFERENCES medias (media_id);

ALTER TABLE files
    ADD 
    CONSTRAINT fk_file_experiences FOREIGN KEY (experience_id) REFERENCES  experiences (experience_id);
--------------------------------------------------------------------------------------------