ALTER TABLE pdf
    ADD 
    CONSTRAINT fk_pdf_ofile FOREIGN KEY (file_id) REFERENCES files (file_id) ;
--------------------------------------------------------------------------------------------