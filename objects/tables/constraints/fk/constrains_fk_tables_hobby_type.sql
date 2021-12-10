----------------------------------hobby_type contraints------------------------------------
ALTER TABLE hobby_type
    ADD 
    CONSTRAINT fk_type_hobby FOREIGN KEY (hobby_id) REFERENCES hobby (hobby_id);
----------------------------------------------------------------------------------------