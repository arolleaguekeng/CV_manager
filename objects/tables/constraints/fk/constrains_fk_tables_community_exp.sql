ALTER TABLE community_exp
ADD
CONSTRAINT fk_community_exp FOREIGN KEY (experience_id) REFERENCES experiences (experience_id);