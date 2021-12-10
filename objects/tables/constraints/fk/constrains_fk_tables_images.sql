----------------------------------images contraints------------------------------------
ALTER TABLE images
    ADD 
    CONSTRAINT fk_image_media FOREIGN KEY (media_id) REFERENCES medias (media_id);
----------------------------------------------------------------------------------------