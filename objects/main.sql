ALTER SESSION SET NLS_LANGUAGE=English;
ALTER SESSION SET NLS_TERRITORY=America;
ALTER session set NLS_DATE_FORMAT='DD/MM/YYYY';
--@sequences/main
PROMPT******************** create table experience****************************************************************
@objects/tables/tables_experiences




PROMPT******************** create table academical experience*************************
@objects/tables/tables_academic_exp






PROMPT******************** create table community experience************
@objects/tables/tables_community_exp





@objects/tables/tables_experiences



PROMPT******************** create table files*************************
@objects/tables/tables_files





PROMPT******************** create table hobby*************************
@objects/tables/tables_hobby



PROMPT******************** create table hobby_type*******************************
@objects/tables/tables_hobby_type





PROMPT******************** create table images*************************
@objects/tables/tables_images





PROMPT******************** create table info_add*************************
@objects/tables/tables_info_add




PROMPT******************** create table languages**********************
@objects/tables/tables_language



PROMPT******************** create table level_project****************************
@objects/tables/tables_level_project


PROMPT******************** create table medias**********************
@objects/tables/tables_media


PROMPT******************** create table other experience******************
@objects/tables/tables_other_exp


PROMPT******************** create table other_files************************
@objects/tables/tables_other_files

PROMPT******************** create table pdf*********************
@objects/tables/tables_pdf

PROMPT******************** create table profession	 experience*********************
@objects/tables/tables_professional_exp

PROMPT******************** create table profiles**********************
@objects/tables/tables_profile


PROMPT******************** create table projects**********************
@objects/tables/tables_projects


PROMPT******************** create table skills**********************
@objects/tables/tables_skills



PROMPT******************** create table users*************************
@objects/tables/tables_users

PROMPT******************** create table videos*********************
@objects/tables/tables_videos


--add constraints of tables
PROMPT ************************************************************************************
PROMPT ***********************************creation of tables*******************************
PROMPT ************************************************************************************
@objects/tables/constraints/main