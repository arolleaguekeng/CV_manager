SET ECHO OFF
SET VERIFY OFF
select * from users WHERE user_name = '&&user_name' AND user_password = '&&user_password';

SELECT first_name,last_name,born_date,phone_number
FROM profiles 
WHERE user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');

SELECT instituled 
FROM experiences
WHERE user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');




SELECT language_name ,language_level
FROM languages
WHERE user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');



SELECT h.hobby_name as nom_loisir, th.hobby_type as type_loisir 
FROM hobby h INNER JOIN hobby_type th ON (h.hobby_type_id = th.hobby_type_id)
WHERE h.user_id =  (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');





SELECT media_id ,pj.intitule
FROM medias m 
JOIN projects pj ON (pj.project_id = m.project_id )
JOIN experiences ex ON (ex.experience_id = pj.experience_id)
WHERE
ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');



SELECT instituled 
FROM experiences ex
JOIN users u ON(u.user_id = ex.user_id)
WHERE u.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');



SELECT ex.instituled ,intitule, begin_date ,end_date 
FROM projects pj
JOIN experiences ex ON (pj.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');


SELECT ex.instituled ,begin_date ,end_date  
FROM professional_exp pe
JOIN experiences ex ON (pe.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');




SELECT ex.instituled ,begin_date ,end_date
FROM academical_exp pe
JOIN experiences ex ON (pe.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');


SELECT ex.instituled ,begin_date ,end_date
FROM community_exp pe
JOIN experiences ex ON (pe.experience_id = ex.experience_id)
WHERE ex.user_id =(select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');





SELECT ex.instituled ,begin_date ,end_date 
FROM other_exp pe
JOIN experiences ex ON (pe.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');




SELECT image_name,ex.instituled
FROM images i
JOIN medias m  ON(i.media_id = m.media_id)
JOIN projects pj ON(pj.project_id = m.project_id)
JOIN experiences ex ON (pj.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');


SELECT video_name,ex.instituled 
FROM videos v
JOIN medias m  ON(v.media_id = m.media_id)
JOIN projects pj ON(pj.project_id = m.project_id)
JOIN experiences ex ON (pj.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');




SELECT file_name ,ex.instituled 
FROM files v
JOIN medias m  ON(v.media_id = m.media_id)
JOIN projects pj ON(pj.project_id = m.project_id)
JOIN experiences ex ON (pj.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');










SET MARKUP HTML ON
SPOOL ON 
SET NULL'_'
SET TAB OFF
SET LINESIZE 1000
SET NEWPAGE NONE
SET TRIMS OFF
SET NUHWIDTN 50
SPOOL CV_EXEMPLE.html



PROMPT ******************************************************************************************************CV INFORMATION*****************************


PROMPT ******************************************************************************************************PROFILE INFORMATIONS******************************

SELECT first_name,last_name,born_date,phone_number
FROM profiles 
WHERE user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');


PROMPT ******************************************************************************************************LANGUAGE INFORMATION****************************

SELECT language_name ,language_level
FROM languages
WHERE user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');


PROMPT ******************************************************************************************************HOBBY  INFORMATION***************************

SELECT h.hobby_name as nom_loisir, th.hobby_type as type_loisir 
FROM hobby h INNER JOIN hobby_type th ON (h.hobby_type_id = th.hobby_type_id)
WHERE h.user_id =  (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');




PROMPT ******************************************************************************************************MEDIA INFORMATION*******************

SELECT media_id ,pj.intitule
FROM medias m 
JOIN projects pj ON (pj.project_id = m.project_id )
JOIN experiences ex ON (ex.experience_id = pj.experience_id)
WHERE
ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');


PROMPT *******************************************************EXPERIENCES INFORMATION**********************************************

SELECT instituled 
FROM experiences ex
JOIN users u ON(u.user_id = ex.user_id)
WHERE u.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');


PROMPT *************************************************************PROJECT INFORMATION*******************************************

SELECT ex.instituled ,intitule, begin_date ,end_date 
FROM projects pj
JOIN experiences ex ON (pj.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');
PROMPT********************************PROFESSIONAL EXPERIENCES INFORMATION****************************************************************

SELECT ex.instituled ,begin_date ,end_date  
FROM professional_exp pe
JOIN experiences ex ON (pe.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');



PROMPT *************************************************ACADEMICAL EXPERIENCE INFORMATION****************************************

SELECT ex.instituled ,begin_date ,end_date
FROM academical_exp pe
JOIN experiences ex ON (pe.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');



PROMPT ********************************************************COMMUNITY EXPERIENCE INFORMATION*********************************

SELECT ex.instituled ,begin_date ,end_date
FROM community_exp pe
JOIN experiences ex ON (pe.experience_id = ex.experience_id)
WHERE ex.user_id =(select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');




PROMPT *************************************************OTHER EXPERIENCES INFORMATION**************************************

SELECT ex.instituled ,begin_date ,end_date 
FROM other_exp pe
JOIN experiences ex ON (pe.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');



PROMPT **********************************************************IMAGES INFORMATION***************************************************

SELECT image_name,ex.instituled
FROM images i
JOIN medias m  ON(i.media_id = m.media_id)
JOIN projects pj ON(pj.project_id = m.project_id)
JOIN experiences ex ON (pj.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');

PROMPT **********************************************VIDEOS INFORMATION*****************************

SELECT video_name,ex.instituled 
FROM videos v
JOIN medias m  ON(v.media_id = m.media_id)
JOIN projects pj ON(pj.project_id = m.project_id)
JOIN experiences ex ON (pj.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');



PROMPT *****************************************FILES INFORMATION*************************************

SELECT file_name ,ex.instituled 
FROM files v
JOIN medias m  ON(v.media_id = m.media_id)
JOIN projects pj ON(pj.project_id = m.project_id)
JOIN experiences ex ON (pj.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');



SET MARKUP HTML OFF
SPOOL OFF