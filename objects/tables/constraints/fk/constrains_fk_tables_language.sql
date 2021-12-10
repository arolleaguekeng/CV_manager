----------------------------------language contraints------------------------------------
ALTER TABLE languages
    ADD 
    CONSTRAINT fk_language_user FOREIGN KEY (user_id) REFERENCES users (user_id);
----------------------------------------------------------------------------------------