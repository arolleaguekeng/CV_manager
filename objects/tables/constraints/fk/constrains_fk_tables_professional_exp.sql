ALTER TABLE professional_exp
ADD
CONSTRAINT fk_professional_exp FOREIGN KEY (experience_id) REFERENCES experiences (experience_id);