ALTER TABLE academical_exp
ADD
CONSTRAINT fk_academical_exp FOREIGN KEY (experience_id) REFERENCES experiences (experience_id);