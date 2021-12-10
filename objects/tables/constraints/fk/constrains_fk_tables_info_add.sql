ALTER TABLE info_add
    ADD 
    CONSTRAINT fk_info_add_file FOREIGN KEY (file_id) REFERENCES files (file_id) ;
--------------------------------------------------------------------------------------------