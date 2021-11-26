SET ECHO OFF
SET VERIFY OFF
ALTER SESSION SET container = xepdb1;
PROMPT 
PROMPT specify password for ASM as parameter 1:
DEFINE pass     = &1
PROMPT 
PROMPT specify default tablespeace for ASM as parameter 2:
DEFINE tbs      = &2
PROMPT 
PROMPT specify temporary tablespace for ASM as parameter 3:
DEFINE ttbs     = &3
PROMPT 
PROMPT specify password for SYS as parameter 4:
DEFINE pass_sys = &4
PROMPT 
PROMPT specify log path as parameter 5:
DEFINE log_path = C:/asm/
PROMPT
PROMPT specify connect string as parameter 6:
DEFINE connect_string     = //localhost:1521/xepdb1
PROMPT

DEFINE spool_file = &log_path.hr_main.log
SPOOL &spool_file



REM =======================================================
REM cleanup section
REM =======================================================

DROP USER asm CASCADE;



REM =======================================================
REM create user
REM three separate commands, so the create user command 
REM will succeed regardless of the existence of the 
REM DEMO and TEMP tablespaces 
REM =======================================================

CREATE USER asm IDENTIFIED BY &pass;

ALTER USER asm DEFAULT TABLESPACE &tbs
              QUOTA UNLIMITED ON &tbs;

ALTER USER asm TEMPORARY TABLESPACE &ttbs;

GRANT CREATE SESSION, CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO asm;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, RESOURCE , UNLIMITED TABLESPACE TO asm;
REM =======================================================
REM grants from sys schema
REM =======================================================

CONNECT sys/&pass_sys@&connect_string AS SYSDBA;
GRANT execute ON sys.dbms_stats TO asm;

REM =======================================================
REM create asm schema objects
REM =======================================================

CONNECT asm/&pass@&connect_string
ALTER SESSION SET NLS_LANGUAGE=English;
ALTER SESSION SET NLS_TERRITORY=Cameroon;

--
-- create tables, sequences and constraint
--

@C:/asm/asm_cre

--
-- création de la table bloc
--
CREATE TABLE blocs
(
    id_bloc INT PRIMARY KEY NOT NULL,
    nom_bloc VARCHAR (255),
    salle_de_classe_blocid_bloc INT,
    salle_de_classe_classeid_classe INT
);

--
-- création de la table campus
--
CREATE TABLE blocs
(
    id_bloc INT PRIMARY KEY NOT NULL,
    nom_bloc VARCHAR (255),
    salle_de_classe_blocid_bloc INT,
    salle_de_classe_classeid_classe INT

);

--
-- création de la table diplome
--

CREATE TABLE diplomes
(
    id_diplome INT PRIMARY KEY NOT NULL,
    tutelle VARCHAR (255),
    nom_diplome VARCHAR (255),
    type_diplome VARCHAR(255),
    qualite VARCHAR(255),
    equivalence VARCHAR (255),
    #id_niveau INT,
    #id_specialite INT,
    specialitied_specialite INT,
    niveau_academiqueid_niveau INT,
    id_type_de_diplome INT
);

--
-- création de la table niveau_accademique
--

CREATE TABLE niveau_academique
(
    id_niveau INT PRIMARY KEY NOT NULL,
    nom_niveau VARCHAR (100),
    Ddepartementid_departement INT,
    coursfiliereid_filiere INT,
    coursniveau_academique_niveau INT,
    coursid_cours INT
);

--
-- création de la table position
--

CREATE TABLE position
(
    id INT PRIMARY KEY NOT NULL,
    nom_position VARCHAR (255)
);

--
-- création de la table ville
--

CREATE TABLE villes
(
    id_ville INT PRIMARY KEY NOT NULL,
    nom_ville VARCHAR (255)
);

-- creation de la table Amphi 
create table amphi(
    salle_de_coursid_salle_cours int(10)
);

-- creation de la table classe academique 
create table classe_academique(
    id_classe int(30) primary key,
    nom_classe varchar(255),
    id_niveau int(10),
    id_Specialie  int(10),
    Specialiteid_specialite int(30),
    coursFiliereid_filiere  int(30),
    coursNIVEAU_acadmiqueid_niveau  int(30),
    coursid_cours  int(10)
);

-- cration de la tabble periode academique
create table periode_academique(
    etendu_formation varchar(255) primary key,
    id_niveau int(30),
    id_filiere  int(30),
    classe_acaid_classe int(30)
);

-- cration de la table promotion
create table promotion(
    classe_acaid_classe  int(30)
);

-- creation  de la table salle de cour
create table salle_de_cours(
    id_salle_cours  int(10) primary key,
    id_salle_normale int(10),
    id_amphi int(10),
    id_labo int(10)
);

/*creer la table personne*/

create table person(
id_person int  primary key,
name_person varchar(30),
id_nationality varchar(30),
departmentid_depertment int
);

/*creer la table propriete*/

create table proprietary(
personid_person int  primary key,
);

/*creer la table pays*/

create table country(
id_nationality int primary key,
name_nationality varchar(30),
capital varchar(30),
id_person int ,
structureid_country int
);

/*creer la table sous-ecole*/

create table sub_school(
id_sousecole int primary key,
name_sousecole varchar(30),
id_structure int ,
structureid_structure int
);

/*creer la table structure*/

create table structure(
id_structure int primary key,
name_structyre varchar(30),
id_nationalite varchar(30),
id_diploma int ,
structureid_structure int
structureid_structure2 int
personid_person int
);
