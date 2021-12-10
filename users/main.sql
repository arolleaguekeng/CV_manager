SET ECHO OFF
SET VERIFY OFF
PROMPT START ALTER SESSION
ALTER SESSION set container=xepdb1;
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

DROP USER cvm CASCADE;
-------------------------------------------------------------------------------
PROMPT CREATE USER
CREATE USER cvm IDENTIFIED BY &pass;
-------------------------------------------------------------------------------


PROMPT ALTER USER SET DEFAUT TABLE
ALTER USER cvm DEFAULT TABLESPACE &tbs
              QUOTA UNLIMITED ON &tbs;
-------------------------------------------------------------------------------
PROMPT ALTER USER GIVE A TEMPORARY TABLESSPACE
ALTER USER cvm TEMPORARY TABLESPACE &ttbs;
PROMPT GRAND ACESS CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO cvm
GRANT CREATE SESSION, CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO cvm;
------------------------------------------------------------------------------------


PROMPT GRANT CREATE SESSION, CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO cvm
GRANT CREATE SYNONYM, CREATE DATABASE LINK, RESOURCE , UNLIMITED TABLESPACE TO cvm;
------------------------------------------------------------------------------------


PROMPT CONNECTION TO sysdba
CONNECT sys/&pass_sys@&connect_string AS SYSDBA;
PROMPT GRANT EXECUTE 
GRANT execute ON sys.dbms_stats TO cvm;

REM =======================================================
REM create cvm schema objects
REM =======================================================
CONNECT cvm/&pass@&connect_string

