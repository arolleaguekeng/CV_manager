SET ECHO OFF
SET VERIFY OFF
--
--user login
--
select * from users WHERE user_name = '&&user_name' AND user_password = '&&user_password';

--
--show user_profiles
--
SELECT first_name,last_name,born_date,phone_number
FROM profiles 
WHERE user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');

--
--write in HTML REPPORT
--
SET MARKUP HTML ON
SPOOL ON 
SET NULL'_'
SET TAB OFF
SET LINESIZE 1000
SET NEWPAGE NONE
SET TRIMS OFF
SET NUHWIDTN 50
SPOOL DB_Devoir.html



PROMPT ******************************************************************************************************CV INFORMATION*****************************


PROMPT ******************************************************************************************************PROFILE INFORMATIONS******************************

--
--return profiles informations
--
SELECT first_name,last_name,born_date,phone_number
FROM profiles 
WHERE user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');


PROMPT ******************************************************************************************************LANGUAGE INFORMATION****************************
--
--return languages informations
--
SELECT language_name ,language_level
FROM languages
WHERE user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');


PROMPT ******************************************************************************************************HOBBY  INFORMATION***************************
--
--return hobby and hobby type informations
--
SELECT h.hobby_name as nom_loisir, th.hobby_type as type_loisir 
FROM hobby h INNER JOIN hobby_type th ON (h.hobby_type_id = th.hobby_type_id)
WHERE h.user_id =  (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');




PROMPT ******************************************************************************************************MEDIA INFORMATION*******************
--
--return all medias for current user
--
SELECT media_id ,pj.intitule
FROM medias m 
JOIN projects pj ON (pj.project_id = m.project_id )
JOIN experiences ex ON (ex.experience_id = pj.experience_id)
WHERE
ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');


PROMPT *******************************************************EXPERIENCES INFORMATION**********************************************
--
--return experiences for current user
--
SELECT instituled 
FROM experiences ex
JOIN users u ON(u.user_id = ex.user_id)
WHERE u.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');


PROMPT *************************************************************PROJECT INFORMATION*******************************************
--
--return all project of current user and institut name
--
SELECT ex.instituled ,intitule, begin_date ,end_date 
FROM projects pj
JOIN experiences ex ON (pj.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');
PROMPT********************************PROFESSIONAL EXPERIENCES INFORMATION****************************************************************
--
--return professional experiences for an experiences
--
SELECT ex.instituled ,begin_date ,end_date  
FROM professional_exp pe
JOIN experiences ex ON (pe.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');



PROMPT *************************************************ACADEMICAL EXPERIENCE INFORMATION****************************************
--
--return acdademical experiences and experiences intituled
--
SELECT ex.instituled ,begin_date ,end_date
FROM academical_exp pe
JOIN experiences ex ON (pe.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');



PROMPT ********************************************************COMMUNITY EXPERIENCE INFORMATION*********************************
--
--return community experiences and experierience intituled
--
SELECT ex.instituled ,begin_date ,end_date
FROM community_exp pe
JOIN experiences ex ON (pe.experience_id = ex.experience_id)
WHERE ex.user_id =(select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');




PROMPT *************************************************OTHER EXPERIENCES INFORMATION**************************************
--
--return others experiences
--
SELECT ex.instituled ,begin_date ,end_date 
FROM other_exp pe
JOIN experiences ex ON (pe.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');



PROMPT **********************************************************IMAGES INFORMATION***************************************************
--
--return all images for current user
--
SELECT image_name,ex.instituled
FROM images i
JOIN medias m  ON(i.media_id = m.media_id)
JOIN projects pj ON(pj.project_id = m.project_id)
JOIN experiences ex ON (pj.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');

PROMPT **********************************************VIDEOS INFORMATION*****************************
--
--return all videos for projects,experiences and other for current user
--
SELECT video_name,ex.instituled 
FROM videos v
JOIN medias m  ON(v.media_id = m.media_id)
JOIN projects pj ON(pj.project_id = m.project_id)
JOIN experiences ex ON (pj.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');



PROMPT *****************************************FILES INFORMATION*************************************
--
--return all files for projects and experiences for current user
--
SELECT file_name ,ex.instituled 
FROM files v
JOIN medias m  ON(v.media_id = m.media_id)
JOIN projects pj ON(pj.project_id = m.project_id)
JOIN experiences ex ON (pj.experience_id = ex.experience_id)
WHERE ex.user_id = (select user_id FROM users WHERE user_name = '&user_name' AND user_password = '&user_password');



SET MARKUP HTML OFF
SPOOL OFF