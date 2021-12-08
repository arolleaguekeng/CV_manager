SET ECHO OFF
SET VERIFY OFF
ALTER SESSION SET container = xepdb1;
PROMPT 
PROMPT specify password for cvm as parameter 1:
DEFINE pass     = cmv
PROMPT 
PROMPT specify default tablespeace for cvm as parameter 2:
DEFINE tbs      = users
PROMPT 
PROMPT specify temporary tablespace for cvm as parameter 3:
DEFINE ttbs     = temp
PROMPT 
PROMPT specify password for SYS as parameter 4:
DEFINE pass_sys = pass
PROMPT 
PROMPT specify log path as parameter 5:
DEFINE log_path = logs/
PROMPT
PROMPT specify connect string as parameter 6:
DEFINE connect_string     = //localhost:1521/xepdb1
PROMPT

DEFINE spool_file = &log_path.cvm_main.log
SPOOL &spool_file



REM =======================================================
REM cleanup section
REM =======================================================

DROP USER cvm CASCADE;



REM =======================================================
REM create user
REM three separate commands, so the create user command 
REM will succeed regardless of the existence of the 
REM DEMO and TEMP tablespaces 
REM =======================================================

CREATE USER cvm IDENTIFIED BY &pass;

ALTER USER cvm DEFAULT TABLESPACE &tbs
              QUOTA UNLIMITED ON &tbs;

ALTER USER cvm TEMPORARY TABLESPACE &ttbs;

GRANT CREATE SESSION, CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO cvm;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, RESOURCE , UNLIMITED TABLESPACE TO cvm;
REM =======================================================
REM grants from sys schema
REM =======================================================

CONNECT sys/&pass_sys@&connect_string AS SYSDBA;
GRANT execute ON sys.dbms_stats TO cvm;

REM =======================================================
REM create cvm schema objects
REM =======================================================

CONNECT cvm/&pass@&connect_string
ALTER SESSION SET NLS_LANGUAGE=English;
ALTER SESSION SET NLS_TERRITORY=Cameroon;

--
-- create tables, sequences and constraint
--

@cvm_cre

SPOOL OFF
--
--insert datas on tables by ntentie

INSERT INTO users(USER_ID,USER_NAME,USER_PASSWORD)values(001,'ABA',123);
INSERT INTO users(USER_ID,USER_NAME,USER_PASSWORD)values(002,'Ado',123);
INSERT INTO users(USER_ID,USER_NAME,USER_PASSWORD)values(003,'Anas',123);
INSERT INTO users(USER_ID,USER_NAME,USER_PASSWORD)values(004,'bom',123);
INSERT INTO users(USER_ID,USER_NAME,USER_PASSWORD)values(005,'balo',123);
INSERT INTO users(USER_ID,USER_NAME,USER_PASSWORD)values(006,'bakosi',123);
INSERT INTO users(USER_ID,USER_NAME,USER_PASSWORD)values(007,'bason',123);
INSERT INTO users(USER_ID,USER_NAME,USER_PASSWORD)values(008,'cadin',123);
INSERT INTO users(USER_ID,USER_NAME,USER_PASSWORD)values(009,'calvi',123);
INSERT INTO users(USER_ID,USER_NAME,USER_PASSWORD)values(010,'cavou',123);

--@cvm_cre


--
--------------Show tables
--
SELECT table_name FROM user_tables;