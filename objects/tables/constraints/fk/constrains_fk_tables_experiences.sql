----------------------------------experiences contraints------------------------------------
ALTER TABLE experiences
    ADD
    CONSTRAINT fk_exp_user FOREIGN KEY (user_id) REFERENCES users (user_id);



ALTER TABLE experiences
    ADD
    CONSTRAINT fk_exp_structure FOREIGN KEY (structure_id) REFERENCES structures (structure_id);
--------------------------------------------------------------------------------------------