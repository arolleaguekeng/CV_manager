--------------------------------------------------------------------------------------------
ALTER TABLE other_files
    ADD 
    CONSTRAINT fk_other_file FOREIGN KEY (file_id) REFERENCES files (file_id) ;
--------------------------------------------------------------------------------------------