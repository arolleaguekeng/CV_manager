Prompt ******  Populating SHIPPING_CLASS table ....

INSERT ALL 
INTO shipping_class (class) VALUES ('very small')
INTO shipping_class (class) VALUES ('small')
INTO shipping_class (class) VALUES ('large')
INTO shipping_class (class) VALUES ('very large')
INTO shipping_class (class) VALUES ('flat')
SELECT * FROM dual;

Prompt ******  Populating ARTICLE_GROUP table ....

INSERT ALL
INTO article_group (group_id, title) VALUES (1, 'television')
INTO article_group (group_id, title) VALUES (2, 'computer')
INTO article_group (group_id, title) VALUES (3, 'school')
INTO article_group (group_id, title) VALUES (4, 'clothes')
INTO article_group (group_id, title) VALUES (5, 'alimentary')
INTO article_group (group_id, title) VALUES (6, 'clothes accessoire')
INTO article_group (group_id, title) VALUES (7, 'phone')
INTO article_group (group_id, title) VALUES (8, 'game')
INTO article_group (group_id, title) VALUES (9, 'console')
INTO article_group (group_id, title) VALUES (10, 'household godds')
SELECT * FROM dual;

Prompt ******  Populating REGION table ....

INSERT INTO regions(region_id,name) VALUES(1,'LITORALE');
INSERT INTO regions(region_id,name) VALUES(2,'NORD_OUEST');
INSERT INTO regions(region_id,name) VALUES(3,'CENTRE');
INSERT INTO regions(region_id,name) VALUES(4,'SUD');
INSERT INTO regions(region_id,name) VALUES(5,'SUD_OUEST');
INSERT INTO regions(region_id,name) VALUES(6,'EST');
INSERT INTO regions(region_id,name) VALUES(7,'OUEST');
INSERT INTO regions(region_id,name) VALUES(8,'ADAMAOUA');
INSERT INTO regions(region_id,name) VALUES(9,'SUD');
INSERT INTO regions(region_id,name) VALUES(10,'NORD');

Prompt ******  Populating CITY table ....

INSERT INTO city (name,region_id) VALUES('Douala',1);
INSERT INTO city (name,region_id) VALUES('Bamenda',2);
INSERT INTO city (name,region_id) VALUES('Yaounde',3);
INSERT INTO city (name,region_id) VALUES('Kribi',4);
INSERT INTO city (name,region_id) VALUES('Tombel',5);
INSERT INTO city (name,region_id) VALUES('Bertoua',6);
INSERT INTO city (name,region_id) VALUES('Bafang',7);
INSERT INTO city (name,region_id) VALUES('Ngaoundére',8);
INSERT INTO city (name,region_id) VALUES('Ebolowa',9);
INSERT INTO city (name,region_id) VALUES('Garoua',10);

Prompt ******  Populating LOCATIONS table ....
Prompt ******  STORES LOCATIONS table ....
INSERT ALL
INTO locations(latitude, longitude, city_name) VALUES(12.3, 15.3, 'Douala')
INTO locations(latitude, longitude, city_name) VALUES(14.3, 16.3, 'Yaounde')
SELECT * FROM DUAL;


Prompt ******  WAREHOUSES LOCATIONS table ...
INSERT ALL
INTO locations(latitude, longitude, city_name) VALUES(12.12, 15.15, 'Douala')
INTO locations(latitude, longitude, city_name) VALUES(14.14, 16.14, 'Yaounde')
SELECT * FROM DUAL;


Prompt ******  Populating WAREHOUSES table ....
INSERT ALL
INTO warehouses(warehouse_name, latitude, longitude) VALUES('First warehouse', 12.12, 15.15)
INTO warehouses(warehouse_name, latitude, longitude) VALUES('Second warehouse', 14.14, 16.14)
SELECT * FROM DUAL;


Prompt ******  Populating ADDRESS table ....
Prompt ******  STORES ADDRESS ....
INSERT ALL
INTO address(address_id, street, latitude, longitude) VALUES('ST001', 'national street',  12.3, 15.3)
INTO address(address_id, street, latitude, longitude) VALUES('ST002', 'secondary street', 14.3, 16.3)
SELECT * FROM DUAL;


Prompt ******  Populating STORES table ....
INSERT ALL
INTO stores(store_address) VALUES('ST001')
INTO stores(store_address) VALUES('ST002')
SELECT * FROM DUAL;

Prompt ******  Populating EMPLOYEES table ....

INSERT ALL
INTO employees(name) VALUES ('Paul')
INTO employees(name) VALUES ('Jean')
INTO employees(name) VALUES ('Louis')
SELECT * FROM DUAL;

Prompt ******  Populating VOUCHERS table ....

INSERT ALL
INTO vouchers(voucher_id, type, amount) VALUES ('1', 'fixed', 2000)
INTO vouchers(voucher_id, type, percentage) VALUES ('2', 'percentage', 0.3)
INTO vouchers(voucher_id, type, amount) VALUES ('3', 'fixed', 3000)
SELECT * FROM DUAL;

Prompt ******  Populating GROUP_VOUCHER table ....

INSERT ALL
INTO group_voucher(group_id, voucher_id, start_date, end_date) VALUES(2, 1, SYSDATE, TO_DATE('09-12-2021', 'DD-MM-YYYY'))
INTO group_voucher(group_id, voucher_id, start_date, end_date) VALUES(1, 2, SYSDATE, TO_DATE('31-12-2021', 'DD-MM-YYYY'))
INTO group_voucher(group_id, voucher_id, start_date, end_date) VALUES(8, 3, SYSDATE, TO_DATE('07-03-2021', 'DD-MM-YYYY'))
SELECT * FROM DUAL;


Prompt ******  Populating SERVICES table ....

INSERT ALL
INTO services(service_id, title, type, percentage) VALUES ('VENUS_SQ_WS', 'Warranty', 'percentage', 0.2 )
SELECT * FROM DUAL;

INSERT ALL
INTO Warranties(title, duration, service_id) VALUES ('Warranty on article venus sq', 60, 'VENUS_SQ_WS')
SELECT * FROM DUAL;

INSERT ALL
INTO services(service_id, title, type, percentage) VALUES ('Computer_WS', 'Warranty', 'percentage', 1.5 )
SELECT * FROM DUAL;

INSERT ALL
INTO Warranties(title, duration, service_id) VALUES ('computer warranty', 90, 'Computer_WS')
SELECT * FROM DUAL;

INSERT ALL
INTO services(service_id, title, type, amount) VALUES ('Computer_IS', 'Installation', 'fixed', 1000 )
SELECT * FROM DUAL;

INSERT ALL
INTO Installations(title, service_id) VALUES ('computer Installation',  'Computer_IS')
SELECT * FROM DUAL;

INSERT ALL
INTO services(service_id,title,type,percentage)VALUES('VANS_WS','Warranty','percentage',0.5)
SELECT * FROM DUAL;

INSERT ALL
INTO Warranties(title, duration, service_id)VALUES('warranty on article VANS',30,'VANS_WS')
SELECT * FROM DUAL;

INSERT ALL
INTO services(service_id, title, type, percentage) VALUES ('PS4_WS', 'Warranty', 'percentage', 0.5 )
SELECT * FROM DUAL;


INSERT ALL
INTO Warranties(title, duration, service_id) VALUES ('Warranty DE L ARTICLE PS4' , 15, 'PS4_WS')
SELECT * FROM DUAL;

INSERT ALL
INTO services(service_id,title,type,percentage)VALUES('TECNO_WS','Warranty','percentage',0.5)
SELECT * FROM DUAL;

INSERT ALL
INTO Warranties(title, duration, service_id)VALUES('warranty on article TECNO',30,'TECNO_WS')
SELECT * FROM DUAL;

INSERT INTO services(service_id, title, type, percentage) VALUES ('SAMSUNG_S8_WS', 'Warranty', 'percentage', 0.25 );

INSERT INTO Warranties(title, duration, service_id) VALUES ('Warranty on articles SAMSUNG S8', 20, 'SAMSUNG_S8_WS');

INSERT ALL
INTO services(service_id, title, type, percentage) VALUES ('iphone_WS', 'Warranty', 'percentage', 13 )
SELECT * FROM DUAL;

INSERT ALL
INTO Warranties(title, duration, service_id) VALUES ('Warranty of article iphone' , 30, 'iphone_WS')
SELECT * FROM DUAL;


Prompt ******  Populating CLIENTS table ....

INSERT ALL 
INTO clients(name, phone) VALUES ('MANFO JIENGAP', 681410728)
SELECT * FROM DUAL;

INSERT ALL
INTO locations(latitude, longitude, city_name) VALUES (19.9, 17.3, 'Yaounde')
INTO locations(latitude, longitude, city_name) VALUES (19.7, 17.7, 'Douala')
INTO address(address_id, street, latitude, longitude, client_id) VALUES ('MJ01', 'rue des palmiers', 19.9, 17.3, client_id_seq.currval)
INTO address(address_id, street, latitude, longitude, client_id) VALUES ('MJ02', 'dernier poteau', 19.7, 17.7, client_id_seq.currval)
SELECT * FROM DUAL;

Prompt ******  Populating ARTICLES table ....

INSERT INTO articles
(   article_name, 
    article_description,
    group_id,
    class, price)VALUES('VENUS SQ', 'VENUS SQ white/gold', 1,'very small', 50000);
INSERT INTO article_service(article_id, service_id) VALUES (article_id_seq.currval, 'VENUS_SQ_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(30000, article_id_seq.currval, client_id_seq.currval);

INSERT INTO articles
(   article_name, 
    article_description,
    group_id,
    class, price)VALUES('VENUS SQ', 'VENUS SQ grey', 1,'very small', 50000);
INSERT INTO article_service(article_id, service_id) VALUES (article_id_seq.currval, 'VENUS_SQ_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(30000, article_id_seq.currval, client_id_seq.currval);

INSERT INTO articles
(   article_name, 
    article_description,
    group_id,
    class, price)VALUES('VENUS SQ', 'VENUS SQ music white/gold', 1,'very small', 50000);
INSERT INTO article_service(article_id, service_id) VALUES (article_id_seq.currval, 'VENUS_SQ_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(30000, article_id_seq.currval, client_id_seq.currval);

Prompt ******  Populating CLIENTS table ....

INSERT ALL
INTO CLIENTS (name,phone) VALUES('NGUEFFO Rebecca',652915747)
SELECT * FROM DUAL;

INSERT ALL
INTO LOCATIONS (latitude,longitude,city_name) VALUES (18.5,17.7,'Douala')
INTO LOCATIONS (latitude,longitude,city_name) VALUES (3.87,11.52,'Bamenda')
INTO address   ( address_id,street,latitude,longitude,client_id) VALUES ('NS01','Rue des écoles',18.5,17.7,client_id_seq.currval)
INTO address   ( address_id,street,latitude,longitude,client_id) VALUES ('NS02','Rue Mulang',3.87,11.52,client_id_seq.currval)
SELECT *FROM DUAL;

Prompt ******  Populating ARTICLES table ....

INSERT INTO articles
(   article_name, 
    article_description,
    group_id,
    class,price)VALUES('Computer', 'HP core i3, 1.7~2.2GHz, 4go', 2,'small',70000);
INSERT INTO article_service(article_id, service_id) VALUES (article_id_seq.currval, 'Computer_WS');
INSERT INTO article_service(article_id, service_id) VALUES (article_id_seq.currval, 'Computer_IS');
INSERT INTO list_price(price, article_id, client_id) VALUES(65000, article_id_seq.currval, client_id_seq.currval);

INSERT INTO articles
(   article_name, 
    article_description,
    group_id,
    class,price)VALUES('Computer', 'DELL core i5, 2.7~3.0GHz, 4go', 2,'small',200000);
INSERT INTO article_service(article_id, service_id) VALUES (article_id_seq.currval, 'Computer_WS');
INSERT INTO article_service(article_id, service_id) VALUES (article_id_seq.currval, 'Computer_IS');
INSERT INTO list_price(price, article_id, client_id) VALUES(175000, article_id_seq.currval, client_id_seq.currval);

INSERT INTO articles
(   article_name, 
    article_description,
    group_id,
    class,price)VALUES('Computer', 'LENOVO core i7, 2.5~3.3GHz, 8go', 2,'small',500000);
INSERT INTO article_service(article_id, service_id) VALUES (article_id_seq.currval, 'Computer_WS');
INSERT INTO article_service(article_id, service_id) VALUES (article_id_seq.currval, 'Computer_IS');
INSERT INTO list_price(price, article_id, client_id) VALUES(175000, article_id_seq.currval, client_id_seq.currval);


Prompt ******  Populating CLIENTS table ....

INSERT ALL 
INTO clients(name, phone)VALUES('MENDJIN MICHELLE', 652508167)
SELECT * FROM DUAL;

INSERT ALL
INTO locations(latitude, longitude, city_name) VALUES (19.2, 12.6, 'Kribi')
INTO locations(latitude, longitude, city_name) VALUES (19.7, 10.3, 'Bamenda')
INTO address(address_id, street, latitude, longitude, client_id)VALUES('MM08', 'carrefour la poste', 19.2, 12.6, client_id_seq.currval)
INTO address(address_id, street, latitude, longitude, client_id)VALUES('MM09', 'rue cocotier', 19.7, 10.3, client_id_seq.currval)
SELECT * FROM DUAL;

Prompt ******  Populating ARTICLES table ....

INSERT INTO articles
(article_name,
article_description,
group_id,
class,
price)VALUES('VANS','couleur blanche pointure 17',6,'small',10000);
INSERT INTO article_service(article_id, service_id)VALUES(article_id_seq.currval,'VANS_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(8000, article_id_seq.currval, client_id_seq.currval);

INSERT INTO articles(
article_name,
article_description,
group_id,
class,
price)VALUES('VANS','couleur rouge blanche pointure 27',6,'small',11500);
INSERT INTO article_service(article_id, service_id)VALUES(article_id_seq.currval,'VANS_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(10000, article_id_seq.currval, client_id_seq.currval);

INSERT INTO articles(
article_name,
article_description,
group_id,
class,
price)VALUES('VANS','couleur bleu blanche pointure 40',6,'small', 14000);
INSERT INTO article_service(article_id, service_id)VALUES(article_id_seq.currval,'VANS_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(12000, article_id_seq.currval, client_id_seq.currval);


Prompt ******  Populating CLIENTS table ....

INSERT ALL
INTO CLIENTS (name,phone) VALUES('NANFAH WAMBA',673821309)
SELECT * FROM DUAL;

INSERT ALL
INTO LOCATIONS (latitude,longitude,city_name) VALUES (18.5,17.5,'Douala')
INTO LOCATIONS (latitude,longitude,city_name) VALUES (19.5,17.3,'Yaounde')
INTO address   ( address_id,street,latitude,longitude,client_id) VALUES ('NW01','balancoir de dogbon',18.5,17.5,client_id_seq.currval)
INTO address   ( address_id,street,latitude,longitude,client_id) VALUES ('NW02','tobogan de l ouest',19.5,17.3,client_id_seq.currval)
SELECT *FROM DUAL;

Prompt ******  Populating ARTICLES table ....

INSERT INTO articles
(article_name, 
article_description,
group_id,
class,price)VALUES('PS4', 'COULEURS GOLD', 9,'small',300000);
INSERT INTO  article_service(article_id, service_id) VALUES (article_id_seq.currval, 'PS4_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(275000, article_id_seq.currval, client_id_seq.currval);

INSERT INTO articles
(article_name, 
article_description,
group_id,
class,price)VALUES('PS4', 'THEME god of war', 9, 'small',305500);
INSERT INTO article_service(article_id, service_id) VALUES (article_id_seq.currval, 'PS4_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(300000, article_id_seq.currval, client_id_seq.currval);

INSERT INTO articles
(article_name, 
article_description,
group_id,
class,price)VALUES('PS4','THEME NARUTO SHIPPUDEN', 9,'small',4000000);
INSERT INTO article_service(article_id, service_id) VALUES (article_id_seq.currval, 'PS4_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(390000, article_id_seq.currval, client_id_seq.currval);

Prompt ******  Populating CLIENTS table ....

INSERT ALL 
INTO clients(name, phone)VALUES('NGUEMO JOSUE', 693629103)
SELECT * FROM DUAL;

INSERT ALL
INTO locations(latitude, longitude, city_name) VALUES (18.2, 12.3, 'Bertoua')
INTO locations(latitude, longitude, city_name) VALUES (19.7, 10.4, 'Bamenda')
INTO address(address_id, street, latitude, longitude, client_id)VALUES('NG01', 'carrefour la poste', 18.2, 12.3, client_id_seq.currval)
INTO address(address_id, street, latitude, longitude, client_id)VALUES('NG02', 'rue cocotier', 19.7, 10.4, client_id_seq.currval)
SELECT * FROM DUAL;

Prompt ******  Populating ARTICLES table ....

INSERT INTO articles
(article_name,
article_description,
group_id,
class,
price)VALUES('TECNO','couleur rouge',7,'very small',100000);
INSERT INTO article_service(article_id, service_id)VALUES(article_id_seq.currval,'TECNO_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(95000, article_id_seq.currval, client_id_seq.currval);

INSERT INTO articles(
article_name,
article_description,
group_id,
class,
price)VALUES('TECNO','couleur noir',7,'very small',110000);
INSERT INTO article_service(article_id, service_id)VALUES(article_id_seq.currval,'TECNO_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(90000, article_id_seq.currval, client_id_seq.currval);

INSERT INTO articles(
article_name,
article_description,
group_id,
class,
price)VALUES('TECNO','couleur orange',7,'very small',180000);
INSERT INTO article_service(article_id, service_id)VALUES(article_id_seq.currval,'TECNO_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(15000, article_id_seq.currval, client_id_seq.currval);

Prompt ******  Populating CLIENTS table ....

INSERT INTO locations(latitude, longitude, city_name) VALUES(125.10, 120.10, 'Garoua');
INSERT INTO clients(name, phone) VALUES ('Mambou Betheu', 657039698);
INSERT INTO address(address_id, street, latitude, longitude) VALUES ('ST003', 'New York Street',  125.10, 120.10);

Prompt ******  Populating ARTICLES table ....

INSERT INTO articles (article_name, article_description, group_id, class, price)
VALUES ('SAMSUNG_S8', 'SAMSUNG S8 white 128G', 7,'very small', 250000);
INSERT INTO article_service(article_id, service_id)
VALUES (article_id_seq.currval, 'SAMSUNG_S8_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(225000, article_id_seq.currval, client_id_seq.currval);

INSERT INTO articles (article_name, article_description, group_id, class, price)
VALUES ('SAMSUNG_S8', 'SAMSUNG S8 gold 528G', 7,'very small', 350000);
INSERT INTO article_service(article_id, service_id)
VALUES (article_id_seq.currval, 'SAMSUNG_S8_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(300000, article_id_seq.currval, client_id_seq.currval);

INSERT INTO articles (article_name, article_description, group_id, class, price)
VALUES ('SAMSUNG_S8', 'SAMSUNG S8 black 228G', 7,'very small', 300000);
INSERT INTO article_service(article_id, service_id)
VALUES (article_id_seq.currval, 'SAMSUNG_S8_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(295000, article_id_seq.currval, client_id_seq.currval);

Prompt ******  Populating CLIENTS table ....

INSERT ALL
INTO clients  (name,phone) VALUES('DONGMO NANDJOU PEREZ  ',659407237)
SELECT * FROM DUAL;

INSERT ALL
INTO locations(latitude,longitude,city_name) VALUES (4.05,9.5,'Douala')
INTO locations(latitude,longitude,city_name) VALUES (4.024,9.70,'Yaounde')
INTO address(address_id,street,latitude,longitude,client_id) VALUES ('MJ10','Rue des ecoles ',4.05,9.5,client_id_seq.currval)
INTO address(address_id,street,latitude,longitude,client_id) VALUES ('MJ11','Essos',4.024,9.70,client_id_seq.currval)
SELECT *FROM DUAL;

Prompt ******  Populating ARTICLES table ....

INSERT INTO articles
(article_name,
article_description,
group_id,
class,
price) VALUES('iphone 11 ','jaune',4,'small',300000);
INSERT INTO article_service(article_id_seq.currval, service_id) VALUES(5, 'iphone_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(295000, article_id_seq.currval, client_id_seq.currval);

INSERT INTO articles(
article_name,
article_description,
group_id,
class,
price)VALUES('iphone 12','rouge',4,'small',500000);
INSERT INTO article_service(article_id_seq.currval, service_id) VALUES(5, 'iphone_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(470000, article_id_seq.currval, client_id_seq.currval);

INSERT INTO articles(
article_name,
article_description,
group_id,
class,
price)VALUES('iphone 13','bleu',4,'small',900000);
INSERT INTO article_service(article_id_seq.currval, service_id) VALUES(5, 'iphone_WS');
INSERT INTO list_price(price, article_id, client_id) VALUES(850000, article_id_seq.currval, client_id_seq.currval);


COMMIT;