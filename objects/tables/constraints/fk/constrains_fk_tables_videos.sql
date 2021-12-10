----------------------------------videos contraints------------------------------------
ALTER TABLE videos
    ADD 
    CONSTRAINT fk_video_media FOREIGN KEY (media_id) REFERENCES medias (media_id);
----------------------------------------------------------------------------------------------