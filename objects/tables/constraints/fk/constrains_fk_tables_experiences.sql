----------------------------------experiences contraints------------------------------------
ALTER TABLE experiences
    ADD
    CONSTRAINT fk_exp_user FOREIGN KEY (user_id) REFERENCES users (user_id);
--------------------------------------------------------------------------------------------