----------------------------------profiles contraints------------------------------------
ALTER TABLE profiles
    ADD 
    CONSTRAINT fk_profile_user FOREIGN KEY (user_id) REFERENCES users (user_id);
----------------------------------------------------------------------------------------