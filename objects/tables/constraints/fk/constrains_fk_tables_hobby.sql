----------------------------------hobby contraints------------------------------------
ALTER TABLE hobby
    ADD 
    CONSTRAINT fk_hobby_media FOREIGN KEY (media_id) REFERENCES medias (media_id);


ALTER TABLE hobby
    ADD
    CONSTRAINT fk_hobby_user FOREIGN KEY (user_id) REFERENCES users (user_id);


ALTER TABLE hobby
    ADD
    CONSTRAINT fk_hobby_type_id FOREIGN KEY (hobby_type_id) REFERENCES hobby_type (hobby_type_id);
----------------------------------------------------------------------------------------