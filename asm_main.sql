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

/*fait par NOKIZE MAXIME   */

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
id_sub_school int primary key,
name_sub_school varchar(30 ),
id_structure int ,
structureid_structure int
);

/*creer la table structure*/

create table structure(
id_structure int primary key,
name_structure varchar(30),
id_nationalite varchar(30),
id_diploma int ,
structureid_structure int
structureid_structure2 int
personid_person int
);

--
-- creation de la table type_equipement par Guetuissie Mambou
--

 CREATE TABLE type_equipement ( -- type_equipement
 id_Type_equipement int primary key, -- id_type equipement
 ceiling_lamp varchar (30), -- podium
 blackboard varchar (30), --tableau
 computer varchar (30), --computer
 tablebanc varchar (30), --table banc
 chair varchar (30), -- chaise
 duster varchar (30), -- chiffon
 marker varchar (30), -- marqueur
 text_register varchar (30), -- registre texte
 extension_board varchar (30), -- planche à ralonge
 video_projector varchar (30), -- vidéo projecteur
 micro varchar (30), -- micro
 scanner varchar (30), -- scanner
 printer varchar (30), -- imprimante
 server varchar (30), -- serveur
 switch varchar (30), -- switch 
 router varchar (30), -- routeur
 fire_extinguisher varchar (30), -- extincteur
 biometric_pointer varchar (30), -- pointeur biométrique
 ticket_office varchar (30), -- guichet
 podium varchar (30), -- podium
 platform varchar (30), -- estrade
 loudspeaker varchar (30), -- haut parleur
 helmet varchar (30), -- casque
 balance varchar (30), -- balance
 hygometer varchar (30), -- hygomètre
 refractometer varchar (30), -- refractomètre
magnetic_stirrer varchar (30), -- agitateur magnétique
 texture_analyszers varchar (30), -- analyseur de texture
 ph_meter varchar (30), -- Ph mètres
 dosing_pump varchar (30), -- pompes doseuses
 power_source varchar (30), -- source d'alimentation
 generator varchar (30), -- groupe éléctrogène
 balon_heater varchar (30), -- chauffes ballon
 chlorine_measurer varchar (30), -- mesureur de chlore
 microscope varchar (30), -- microscope
 microtomes varchar (30), -- microtome
 conductimeter varchar (30), -- conductimètre
 particle_counter varchar (30), -- compteurs de particule
 thermometer varchar (30), -- thermomètre
 viscometer varchar (30), -- viscomètre
 transparent_lenses varchar (30), -- verres transparentes
 apron varchar (30) --  tablier
 hands_gangs varchar (30), --  gang à amin
 batting_bat varchar (30), -- chapeau de laboratoire
 metal_rule varchar (30), -- règle metallique
 meter_ribbon varchar (30), -- mètre ruban
 spherometer varchar (30), -- sphéromètre
 precisoin_palmer varchar (30), -- palmer de précision
 hanging_hook varchar (30), -- crochet de suspension
 caliper varchar (30),  -- pied à coulisse
 agitator varchar (30), -- agitateur
 balance_professional varchar (30), --  balance professionnelle
 climate_speakers varchar (30), -- enceintes climatiques
 laboratory_glassware_washer varchar (30), -- lave verrerie de laboraoire
 ice_machine varchar (30), -- machine à glace 
 autoclaves varchar (30), -- autoclaves
 centrifuge varchar (30), -- centrifugeur
 dessicators varchar (30), -- dessicateur
 incubator varchar (30), -- incubateur
 micropipette varchar (30), -- micropipette
 support_elavator_cross varchar (30), -- support élévateur à croisillon
 electrophorese varchar (30), -- éléctrophèse
 rotary_evaporator varchar (30), -- evaporateur rotatif
 distiller varchar (30), -- distillateur
 heating varchar (30), -- chauffage
 laboratory_baths varchar (30) --  bains laboratoire
 );
 
 --
 -- creation de la table type_salle par YIANYI POPOURE WILLIAM STEPHANE
 --
 CREATE TABLE type_room(
     laboratory_informatic varchar(30), -- salle_informatique 
	 laboratory_science varchar(30), -- salle_de_science
	 office varchar(30), -- bureau
	 room_conference varchar(30), -- salle_conference
	 room_sport varchar(30), -- salle_sport
	 room_profesor varchar(30), -- salle_prof
	 room_reception varchar(30), -- salle_acceuil
	 classroom varchar(30), -- salle_classe
	 room_server varchar(30), -- salle_serveur
	 lab_mechanic varchar(30), --- labo_serveur
	 room_media(30), -- salle_multimedia
	 store varchar(30), -- magasin
	 room_medecine varchar(30), -- laba_medecine
	 room_shower varchar(30), -- salle_douche
	 room_infimery varchar(30), --infimerie
	 room_library varchar(30), --bibliotheque
	 amphitheatre varchar(30) --amphitheare
	 workshop_room varchar(30) --salle_atelier
);

--
--  creation de la table departement par YIANYI POPOURE WILLIAM STEPHANE
--
CREATE TABLE departments(
   id_department int primary key, -- departement_id
   name_department char(255),  --nom_departement
   id_subschool int, --id_sous_ecole_ecole
   id_structure int --id_structure
 );
 
 --
 --  creation de la table cours par YIANYI POPOURE WILLIAM STEPHANE
 --
 CREATE TABLE classes(
   id_spinneret int primary key not null, -- id_filiere
   id_classe int, -- id_cours
   id_grade int, -- id_niveau
 );
 
 --
 --  creation de la table filiere par YIANYI POPOURE WILLIAM STEPHANE
 --
 CREATE TABLE spinneret(
   id_spinneret int primary key not null, -- id_filiere
   name_spinneret char(255), -- nom_filiere
   organisation_de_periode varchar(30) -- organisation_de_periode
   id_department  int, --departement_id
 );
 
 --
 -- creation de la table objectifs par YIANYI POPOUERE WILLIAM STEPHANE
 --
 CREATE TABLE objectives(
   id_spinneret int, --id_filiere
   id_classe int, -- id_cours
   id_grade int -- id_niveau
 );
 
 --
 -- creation de la table specialite par YIANYI POPOUERE WILLIAM STEPHANE
 --
 CREATE TABLE specialty(
   id_speciality int primary key not null, -- id_specialite
   name_speciality char(255), -- nom_specialie
   id_spinneret int, -- id_filiere
   common_core int  -- tronc_commun
 );
 
 --
 -- creation de la table syllabus par YIANYI POPOUERE WILLIAM STEPHANE
 --
 CREATE TABLE syllabus(
   id_spinneret int, -- id_filiere
   id_classe int, -- id_cours
   id_grade int -- id_niveau
 );
