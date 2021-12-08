
--
-- create table users by AGUEKENG
--

CREATE TABLE users
(
    user_id INT PRIMARY KEY NOT NULL,
    user_name VARCHAR (255),
    user_password VARCHAR (255)
);






--
-- create table projects by AGUEKENG
--

CREATE TABLE projects
(
    project_id INT PRIMARY KEY NOT NULL,
    experience_id INT NOT NULL,
   
);






--
-- create table medias by AGUEKENG
--

CREATE TABLE medias
(
    media_id INT PRIMARY KEY NOT NULL,
    project_id  INT  NOT NULL
);





--
-- create table files by AGUEKENG
--
CREATE TABLE files
(
    file_id int  PRIMARY KEY NOT NULL, 
    media_id  INT  NOT NULL,
    experience_id INT NOT NULL 

);





--
-- create table experiences by AGUEKENG
--

CREATE TABLE experiences
(
    experience_id INT PRIMARY KEY NOT NULL,
    user_id INT NOT NULL
);



--
-- create table profiles by AGUEKENG
--

CREATE TABLE profiles
(
    profile_id INT PRIMARY KEY NOT NULL,
    user_id INT NOT NULL
);

-- create table hobby
CREATE TABLE hobby 
(
    hobby_id  INT PRIMARY KEY NOT NULL,
    user_id INT NOT NULL,
    media_id  INT  NOT NULL
);



-- create table hobby_type by AGUEKENG
CREATE TABLE hobby_type --type de passe-temps
(
    hobby_type_id  int PRIMARY KEY,
    hobby_id  INT  NOT NULL
);


--
-- create table languages by AGUEKENG
--

CREATE TABLE languages
(
    language_id INT PRIMARY KEY NOT NULL, --langue
    user_id INT NOT NULL
);





--
-- create table file/images by AGUEKENG
--

CREATE TABLE images
(
    image_id INT PRIMARY KEY NOT NULL,
    media_id  INT  NOT NULL
);





--
-- creation de la table media/videos  by AGUEKENG
--
CREATE TABLE videos(
    video_id INT PRIMARY KEY NOT NULL,
    media_id  INT  NOT NULL
);




--
-- create table level of project  by AGUEKENG
--
CREATE TABLE level_project  --niveau de competence pour le projet
(
    level_projest_id int PRIMARY KEY NOT NULL,
    project_id  INT  NOT NULL
);






--
-- create table skills by AGUEKENG
--
CREATE TABLE skills      
(                
    skill_id varchar(255) PRIMARY KEY NOT NULL,
    user_id INT NOT NULL,
    under_skill varchar(255) --Sous compétenses
);



--
-- create table file/pdf by AGUEKENG
--

CREATE TABLE pdf(
    pdf_id int   PRIMARY KEY,
    file_id  INT  NOT NULL
);

--
-- create table file/added date by AGUEKENG
--
/*
CREATE TABLE info_add  
(
    info_add_id int  PRIMARY KEY,
    file_id  INT  NOT NULL
);*/




--
-- create table other files/files by AGUEKENG
--
CREATE TABLE other_files
(
    other_files_id int PRIMARY KEY,
    file_id  INT  NOT NULL
);
    --




--
-- create table experience/professional experience by AGUEKENG
--

CREATE TABLE professional_exp
(
    professional_exp_id int primary key,
    experience_id INT NOT NULL
);




--
-- create table experience/community experience by AGUEKENG
--

 CREATE TABLE community_exp 
 (
    community_exp_id INT  PRIMARY KEY,
    experience_id INT NOT NULL
 );




--
--  create table experience/other experience by AGUEKENG
--
CREATE TABLE other_exp(
    other_exp int PRIMARY KEY, 
    experience_id INT NOT NULL
 );
 

 --
 --  create table experience/academical experience by AGUEKENG
 --
 CREATE TABLE academical_exp
 (
   academical_exp INT PRIMARY KEY NOT NULL,
    experience_id INT NOT NULL
);


















--------------------
--------------------
--------------------
--------------------

----------------------------CONTRAINS OF THE TABLES by AGUEKENG
 
--------------------
--------------------
--------------------
--------------------




ALTER TABLE community_exp
ADD
CONSTRAINT fk_community_exp FOREIGN KEY (experience_id) REFERENCES experiences (experience_id);
-------------------------------------------------------------------------------------------

ALTER TABLE other_exp
     ADD
     CONSTRAINT fk_other_exp
     FOREIGN KEY (experience_id) REFERENCES experiences (experience_id);
------------------------------------------------------------------------------------------
ALTER TABLE academical_exp
ADD
CONSTRAINT fk_academical_exp FOREIGN KEY (experience_id) REFERENCES experiences (experience_id);
------------------------------------------------------------------------------------------
ALTER TABLE professional_exp
ADD
CONSTRAINT fk_professional_exp FOREIGN KEY (experience_id) REFERENCES experiences (experience_id);
------------------------------------------------------------------------------------------








--------------------------------------------------------------------------------------------
ALTER TABLE other_files
    ADD 
    CONSTRAINT fk_other_file FOREIGN KEY (file_id) REFERENCES files (file_id) ;
--------------------------------------------------------------------------------------------
ALTER TABLE info_add
    ADD 
    CONSTRAINT fk_info_add_file FOREIGN KEY (file_id) REFERENCES files (file_id) ;
--------------------------------------------------------------------------------------------
ALTER TABLE pdf
    ADD 
    CONSTRAINT fk_pdf_ofile FOREIGN KEY (file_id) REFERENCES files (file_id) ;
--------------------------------------------------------------------------------------------








-----------------------------------------skills contraints------------------------------------
ALTER TABLE skills
    ADD 
    CONSTRAINT fk_skills FOREIGN KEY (skill_id) REFERENCES skills (skill_id);
ALTER TABLE skills
    ADD
    CONSTRAINT fk_skills_user FOREIGN KEY (user_id) REFERENCES users (user_id);
----------------------------------------------------------------------------------------------





----------------------------------competences level contraints------------------------------------
ALTER TABLE level_project
    ADD 
    CONSTRAINT fk_level_project FOREIGN KEY (project_id) REFERENCES projects (project_id);
----------------------------------------------------------------------------------------------




----------------------------------videos contraints------------------------------------
ALTER TABLE videos
    ADD 
    CONSTRAINT fk_video_media FOREIGN KEY (media_id) REFERENCES medias (media_id);
----------------------------------------------------------------------------------------------




----------------------------------images contraints------------------------------------
ALTER TABLE images
    ADD 
    CONSTRAINT fk_image_media FOREIGN KEY (media_id) REFERENCES medias (media_id);
----------------------------------------------------------------------------------------



----------------------------------language contraints------------------------------------
ALTER TABLE languages
    ADD 
    CONSTRAINT fk_language_user FOREIGN KEY (user_id) REFERENCES users (user_id);
----------------------------------------------------------------------------------------



----------------------------------hobby_type contraints------------------------------------
ALTER TABLE hobby_type
    ADD 
    CONSTRAINT fk_type_hobby FOREIGN KEY (hobby_id) REFERENCES hobby (hobby_id);
----------------------------------------------------------------------------------------



----------------------------------hobby contraints------------------------------------
ALTER TABLE hobby
    ADD 
    CONSTRAINT fk_hobby_media FOREIGN KEY (media_id) REFERENCES medias (media_id);


ALTER TABLE hobby
    ADD
    CONSTRAINT fk_hobby_user FOREIGN KEY (user_id) REFERENCES users (user_id);
----------------------------------------------------------------------------------------



----------------------------------profiles contraints------------------------------------
ALTER TABLE profiles
    ADD 
    CONSTRAINT fk_profile_user FOREIGN KEY (user_id) REFERENCES users (user_id);
----------------------------------------------------------------------------------------



----------------------------------experiences contraints------------------------------------
ALTER TABLE experiences
    ADD
    CONSTRAINT fk_exp_user FOREIGN KEY (user_id) REFERENCES users (user_id);
--------------------------------------------------------------------------------------------







----------------------------------files contraints------------------------------------
ALTER TABLE files
    ADD 
    CONSTRAINT fk_file_media FOREIGN KEY (media_id) REFERENCES medias (media_id);

ALTER TABLE files
    ADD 
    CONSTRAINT fk_file_experiences FOREIGN KEY (experience_id) REFERENCES  experiences (experience_id);
--------------------------------------------------------------------------------------------


 





 ----------------------------------medias contraints------------------------------------
ALTER TABLE medias
    ADD 
    CONSTRAINT fk_media_project FOREIGN KEY (project_id) REFERENCES projects (project_id);
--------------------------------------------------------------------------------------------







 ----------------------------------projects contraints------------------------------------
ALTER TABLE projects
    ADD 
    CONSTRAINT fk_project_exp FOREIGN KEY (experience_id) REFERENCES experiences ( experience_id);
--------------------------------------------------------------------------------------------








