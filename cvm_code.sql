
------this code generate the users id automaticaly
CREATE SEQUENCE users_seq INCREMENT BY 3 START WITH 16;

CREATE OR REPLACE TRIGGER users_BI
BEFORE INSERT
ON users
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
 :NEW.user_id := 'usr_'||TO_CHAR(users_seq.nextval);

END users_BI;
/










