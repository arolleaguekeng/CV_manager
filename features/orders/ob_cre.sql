Prompt ******  Creating REGIONS table ....
	
CREATE TABLE regions
    (
		region_id NUMBER(10)
		CONSTRAINT region_id_nn NOT NULL,
		name VARCHAR2(25)
		CONSTRAINT name_reg_nn NOT NULL
   );

Prompt ******  Creating CITY table ....

CREATE TABLE city
( 
	name VARCHAR2(25)
	CONSTRAINT name_cit_nn NOT NULL,
	region_id NUMBER(10)
	CONSTRAINT region_id_cit_nn NOT NULL
);

Prompt ******  Creating LOCATIONS table ....

CREATE TABLE locations
(
	latitude NUMBER(10, 3),
	longitude NUMBER(10, 3),
	city_name VARCHAR2(25)
	CONSTRAINT city_id_loc_nn NOT NULL
);


Prompt ******  Creating ADDRESS table ....

CREATE TABLE address
( 
	address_id VARCHAR2(25)
	CONSTRAINT address_id_nn NOT NULL,
	street VARCHAR2(25)
	CONSTRAINT street_nn NOT NULL,
	latitude NUMBER(10, 3)
	CONSTRAINT latitude_add_nn NOT NULL,
	longitude NUMBER(10, 3)
	CONSTRAINT longitude_add_nn NOT NULL,
	client_id NUMBER(10)
);
   

Prompt ****** Creating STORE table ....

CREATE TABLE stores
(
    store_id NUMBER 
    CONSTRAINT store_id_nn NOT NULL,
    store_address VARCHAR2(25)
    CONSTRAINT store_address_nn NOT NULL
);

Prompt ****** Creating USERS table ....

CREATE TABLE users
(
    user_id NUMBER
    CONSTRAINT user_id_nn NOT NULL,
    user_name VARCHAR2(25)
    CONSTRAINT user_name_nn NOT NULL,
	type VARCHAR2(25) CHECK(type IN ('client','employee'))
);

Prompt ******  Creating EMPLOYEES table .... 

CREATE TABLE  employees
(
	employee_id NUMBER
		CONSTRAINT employee_id_nn NOT NULL,
	name VARCHAR2(25),
	user_id NUMBER
);

Prompt ****** Creating CLIENTS table ....

CREATE TABLE clients
(
    client_id NUMBER
    CONSTRAINT client_id_nn NOT NULL,
    name VARCHAR2(25)
    CONSTRAINT name_nn NOT NULL,
    phone NUMBER
    CONSTRAINT phone_nn NOT NULL,
    user_id NUMBER 
);

Prompt ****** Creating WAREHOUSES table ....

CREATE TABLE warehouses
(
	warehouse_id NUMBER(10)
	CONSTRAINT warehouse_id_war_nn NOT NULL,
	warehouse_name VARCHAR2(25),
	latitude NUMBER(10, 3)
	CONSTRAINT latitude_war_nn NOT NULL,
	longitude NUMBER(10, 3)
	CONSTRAINT longitude_war_nn NOT NULL
);

Prompt ****** Creating WAREHOUSES_ARTICLE table ....

CREATE TABLE warehouse_article
(
	article_id NUMBER(10)
	CONSTRAINT article_id_war_art_nn NOT NULL,
	warehouse_id NUMBER(10)
	CONSTRAINT warehouse_id_war_art_nn NOT NULL,
	remainig_quantity NUMBER(10)
	CONSTRAINT remainig_quantity_war_art_nn NOT NULL
);

Prompt ****** Creating Services table ....

CREATE TABLE Services 
(
    service_id VARCHAR2(25)
    CONSTRAINT service_id_ser_nn NOT NULL,
    title VARCHAR2(25)
    CONSTRAINT title_ser_nn NOT NULL,
    Type VARCHAR2(25) CHECK(type IN ('percentage','fixed'))
    CONSTRAINT type_ser_nn NOT NULL,
    amount NUMBER(10),
    percentage NUMBER(10,2)
);

-- Prompt ****** TABLE SERVICES CREATED BY VERON KOUM....

Prompt ****** Creating ARTICLES table ....

CREATE TABLE articles
(
	article_id NUMBER(10)
	CONSTRAINT article_id_art_nn NOT NULL,
	article_name VARCHAR2(25),
	article_description VARCHAR2(255),
	group_id NUMBER(10)
	CONSTRAINT group_id_art_nn NOT NULL,
	class varchar2(25)
	CONSTRAINT class_art_nn NOT NULL,
	price NUMBER
	CONSTRAINT price_art_nn NOT NULL
);

Prompt ****** Creating ARTICLE_SERVICE table ....

CREATE TABLE article_service
(
	article_id NUMBER(10)
	CONSTRAINT article_id_art_ser_nn NOT NULL,
	service_id VARCHAR2(25)
	CONSTRAINT service_id_art_ser_nn NOT NULL
);

Prompt ****** Creating SHIPPING_CLASS table ....

CREATE TABLE shipping_class
(
	class VARCHAR2 (25)
    CONSTRAINT class_shi_cla_nn NOT NULL
);

Prompt ****** Creating ARTICLE_GROUP table ....

CREATE TABLE article_group
(
    group_id NUMBER (10)
    CONSTRAINT group_id_nn NOT NULL,
    title  VARCHAR2(25)
);

Prompt ****** Creating LISTE DE PRIX table ....

CREATE TABLE list_price
(
    price NUMBER(10,2) 
        CONSTRAINT price_lp_nn NOT NULL,       
    article_id NUMBER(25)
        CONSTRAINT article_id_lp_nn NOT NULL,
    client_id NUMBER(25)              
);

Prompt ****** Creating INSTALLATIONS table ....

CREATE TABLE installations
(
    installation_id NUMBER
    CONSTRAINT installation_id_nn NOT NULL,
    title VARCHAR2(25)
    CONSTRAINT title_int_nn NOT NULL,
    service_id VARCHAR2(25)
    CONSTRAINT service_id_inst_nn NOT NULL
);

Prompt ****** Creating WARRANTIES table ....

CREATE TABLE warranties
(
    warranty_id NUMBER
    CONSTRAINT warranty_id_nn NOT NULL,
    title VARCHAR2(255)
    CONSTRAINT title_war_nn NOT NULL,
    duration NUMBER(10)
    CONSTRAINT duration_war_nn NOT NULL,
    service_id VARCHAR2(25)
    CONSTRAINT service_id_war_nn NOT NULL    
);

Prompt****** Creating VOUCHERS table....

CREATE TABLE Vouchers
(
	voucher_id number,
	type VARCHAR2(25) CHECK(type IN ('percentage', 'fixed')),
	amount number ,
	percentage  number(10,2)	
);

Prompt****** Creating ORDERS table....

CREATE TABLE orders
(
	order_number NUMBER(10)
	CONSTRAINT order_number_ord_nn NOT NULL,
	order_date DATE  DEFAULT SYSDATE
	CONSTRAINT order_date_ord_nn NOT NULL,
	order_mode VARCHAR2(25) CHECK(order_mode IN ('on-line', 'physically', 'intermediary'))
	CONSTRAINT order_mode_ord_nn NOT NULL,
	creation_user NUMBER
	CONSTRAINT creation_user_ord_nn NOT NULL,
	edition_user NUMBER,
	voucher_id NUMBER,
	billing_address VARCHAR2(25)
	CONSTRAINT billin_address_ord_nn NOT NULL,
	store_id NUMBER
	CONSTRAINT store_id_ord_nn NOT NULL
);

CREATE UNIQUE INDEX order_number_pk
ON orders(order_number);

Prompt****** Creating ORDER_ITEM table....

CREATE TABLE order_item
(
	item_id number 
	CONSTRAINT item_id_nn NOT NULL,
	order_number number,
	article_id number ,
	description varchar2(255),
	service_id varchar2(25)
);

prompt ****** creating group_voucher table....

CREATE TABLE group_voucher
(
	group_id NUMBER(10)
	CONSTRAINT group_voucher_id_nn NOT NULL,
	voucher_id NUMBER(10)
    CONSTRAINT voucher_id_gv_nn NOT NULL,
    start_date DATE
    CONSTRAINT start_date_gv_nn NOT NULL,
    end_date DATE
    CONSTRAINT end_date_gv_nn NOT NULL
);

Prompt ******  Creating Packages table ....

CREATE TABLE packages
(
	package_id NUMBER
	CONSTRAINT package_id_nn NOT NULL,
	order_number NUMBER,
	delivery_address VARCHAR2(25),
	start_date DATE DEFAULT SYSDATE,
	end_date DATE,
	delivery_mode VARCHAR2(25) CHECK(delivery_mode IN ('domicile', 'agence')) ,
	statute VARCHAR2(25) CHECK(statute IN ('Delivred', 'Process start', 'Stopped'))
);

Prompt ******  Creating Package_item table ....

CREATE TABLE package_item
(
	item_id NUMBER 
	CONSTRAINT package_item_nn NOT NULL,
	package_id NUMBER 
	CONSTRAINT package_id_pac_ite_nn NOT NULL,
	quantity NUMBER 
	CONSTRAINT qte_nn NOT NULL
);

COMMIT;