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
