CREATE SEQUENCE order_number_seq
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE client_id_seq
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE warehouse_id_seq
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE store_id_seq
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE article_id_seq
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE warranty_id_seq
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE installation_id_seq
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE employee_id_seq
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE user_id_seq
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE item_id_seq
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE package_id_seq
START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER order_item_tg
BEFORE INSERT ON order_item
FOR EACH ROW
BEGIN
:new.item_id := item_id_seq.nextval;
END;
/

CREATE OR REPLACE TRIGGER order_tg
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
:new.order_number := order_number_seq.nextval;
END;
/


CREATE OR REPLACE TRIGGER client_tg
BEFORE INSERT ON clients
FOR EACH ROW
BEGIN
:new.client_id := client_id_seq.nextval;
END;
/

CREATE OR REPLACE TRIGGER packages_tg
AFTER UPDATE ON packages
FOR EACH ROW
BEGIN
    IF :old.statute = 'Delivred' OR :old.statute = 'Stopped'
        THEN  UPDATE packages SET end_date = SYSDATE WHERE package_id = :old.package_id;
END IF;
END;
/

CREATE OR REPLACE TRIGGER warehouse_tg
BEFORE INSERT ON warehouses
FOR EACH ROW
BEGIN
:new.warehouse_id := warehouse_id_seq.nextval;
END;
/

CREATE OR REPLACE TRIGGER sotre_tg
BEFORE INSERT ON stores
FOR EACH ROW
BEGIN
:new.store_id := store_id_seq.nextval;
END;
/

CREATE OR REPLACE TRIGGER article_tg
BEFORE INSERT ON articles
FOR EACH ROW
BEGIN
:new.article_id := article_id_seq.nextval;
END;
/

CREATE OR REPLACE TRIGGER warranty_tg
BEFORE INSERT ON warranties
FOR EACH ROW
BEGIN
:new.warranty_id := warranty_id_seq.nextval;
END;
/

CREATE OR REPLACE TRIGGER installation_tg
BEFORE INSERT ON installations
FOR EACH ROW
BEGIN
:new.installation_id := installation_id_seq.nextval;
END;
/

CREATE OR REPLACE TRIGGER user_tg
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
:new.user_id := user_id_seq.nextval;
END;
/

CREATE OR REPLACE TRIGGER employee_tg
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
INSERT INTO users(user_name, type) VALUES (:new.name, 'employee');
:new.user_id := user_id_seq.currval;
:new.employee_id := employee_id_seq.nextval;
END;
/

CREATE OR REPLACE TRIGGER package_id_tg
BEFORE INSERT ON packages
FOR EACH ROW
BEGIN
:new.package_id := package_id_seq.nextval;
END;
/

COMMIT;