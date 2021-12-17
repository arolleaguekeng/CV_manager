ALTER session set NLS_DATE_FORMAT='DD/MM/YYYY';
PROMPT *******************************************************CREATE USER**********************************************
@features\users\add_user
PROMPT *******************************************************LOGIN**********************************************
select * from users WHERE user_name = '&&user_name' AND user_password = '&&user_password';
PROMPT*************** insert into  tables_profile********************
@features/profiles/add_profile


SELECT * FROM structures;

PROMPT*************** insert into  tables_experiences********************
@features/experiences/add_experiences


PROMPT *******************************************************EXPERIENCES INFORMATION**********************************************
SELECT * 
FROM experiences ex
JOIN users u ON(u.user_id = ex.user_id)
WHERE u.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');

PROMPT*************** insert into  tables_projects********************
@features/projects/add_project

PROMPT *************************************************************PROJECT INFORMATION*******************************************

SELECT *
FROM projects pj
JOIN experiences ex ON (pj.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');


PROMPT*************** insert into  tables_media********************
@features/medias/add_media


PROMPT *************************************************ACADEMICAL EXPERIENCE INFORMATION****************************************
SELECT * FROM hobby_type

PROMPT*************** insert into  tables_hobbys********************
@features/hobbys/add_hobby




PROMPT *************************************************ACADEMICAL EXPERIENCE INFORMATION****************************************
SELECT *
FROM academical_exp pe
JOIN experiences ex ON (pe.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');



PROMPT*************** insert into  tables_academic_exp********************
@features/add_academic_exp


PROMPT ******************************************************************************************************MEDIA INFORMATION*******************

SELECT media_id ,pj.intitule
FROM medias m 
JOIN projects pj ON (pj.project_id = m.project_id )
JOIN experiences ex ON (ex.experience_id = pj.experience_id)
WHERE
ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');

PROMPT*************** insert into  tables_images********************
@features/images/add_image


PROMPT*************** insert into  tables_language********************
@features/languages/add_language



PROMPT*************** insert into  tables_skills********************
@features/skills/add_skills

PROMPT*************** insert into  tables_videos********************
@features/videos/add_video
@show_cv