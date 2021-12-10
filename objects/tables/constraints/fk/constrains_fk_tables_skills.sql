-----------------------------------------skills contraints------------------------------------
ALTER TABLE skills
    ADD 
    CONSTRAINT fk_skills FOREIGN KEY (skill_id) REFERENCES skills (skill_id);
ALTER TABLE skills
    ADD
    CONSTRAINT fk_skills_user FOREIGN KEY (user_id) REFERENCES users (user_id);
----------------------------------------------------------------------------------------------