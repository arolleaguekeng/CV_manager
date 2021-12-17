SET ECHO OFF
SET VERIFY OFF

PROMPT 
PROMPT specify password for ob as parameter 1:
DEFINE pass     = ob
PROMPT 
PROMPT specify default tablespeace for ob as parameter 2:
DEFINE tbs      = users
PROMPT 
PROMPT specify temporary tablespace for ob as parameter 3:
DEFINE ttbs     = temp
PROMPT 
PROMPT specify password for SYS as parameter 4:
DEFINE pass_sys = &4
PROMPT 
PROMPT specify log path as parameter 5:
DEFINE log_path = &5
PROMPT
PROMPT specify connect string as parameter 6:
DEFINE connect_string     = localhost:1521/xepdb1
PROMPT

-- The first dot in the spool command below is 
-- the SQL*Plus concatenation character

DEFINE spool_file = &log_path.hr_main.log
SPOOL &spool_file

REM =======================================================
REM cleanup section
REM =======================================================

DROP USER ob CASCADE;

REM =======================================================
REM create user
REM three separate commands, so the create user command 
REM will succeed regardless of the existence of the 
REM DEMO and TEMP tablespaces 
REM =======================================================

CREATE USER ob IDENTIFIED BY &pass;

ALTER USER ob DEFAULT TABLESPACE &tbs
              QUOTA UNLIMITED ON &tbs;

ALTER USER ob TEMPORARY TABLESPACE &ttbs;

GRANT CREATE SESSION, CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO ob;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, RESOURCE , UNLIMITED TABLESPACE TO ob;

REM =======================================================
REM grants from sys schema
REM =======================================================

CONNECT sys/&pass_sys@&connect_string AS SYSDBA;
GRANT execute ON sys.dbms_stats TO ob;

REM =======================================================
REM create ob schema objects
REM =======================================================

CONNECT ob/&pass@&connect_string
ALTER SESSION SET NLS_LANGUAGE=American;
ALTER SESSION SET NLS_TERRITORY=America;

--
-- create tables, sequences and constraint
--

@E:\cours\PAM2\ProgrammationSQL\orders\ob_cre

-- 
-- create index
--
@E:\cours\PAM2\ProgrammationSQL\orders\ob_con


--
-- create procedural objects
--

@E:\cours\PAM2\ProgrammationSQL\orders\ob_code

--
-- popluate tables
--

@E:\cours\PAM2\ProgrammationSQL\orders\ob_popul

--
-- add comments to tables and columns
--

@E:\cours\PAM2\ProgrammationSQL\orders\ob_comnt

--
-- gather schema statistics
--

@E:\cours\PAM2\ProgrammationSQL\orders\ob_analz

spool off