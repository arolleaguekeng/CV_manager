ALTER TABLE other_exp
     ADD
     CONSTRAINT fk_other_exp
     FOREIGN KEY (experience_id) REFERENCES experiences (experience_id);