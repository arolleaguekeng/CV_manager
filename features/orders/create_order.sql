Prompt ******  ORDER CREATION ....

Prompt User:
DEFINE user = &1

Prompt Order mode:
DEFINE mode = &2

Prompt Store_id:
DEFINE store = &3

Prompt Billing address:
DEFINE billing = &4

Prompt Delivery address:
DEFINE delivery = &5

Prompt Delivery mode:
DEFINE delivery_mode = &5

INSERT INTO orders(order_mode, creation_user, billing_address, store_id) VALUES ('&mode', &user, '&billing', &store);
INSERT INTO packages(order_number, delivery_address) VALUES (order_number_seq.currval, '&delivery');

Prompt Order number : 
SELECT TO_CHAR(order_number_seq.currval, '0099') FROM DUAL;

UNDEFINE usert
UNDEFINE mode
UNDEFINE store
UNDEFINE billing
UNDEFINE delivery
UNDEFINE delivery_mode

COMMIT;