Prompt ***********************ORDER DETAILS.....


Prompt
Prompt Order number:
DEFINE order = &1

Prompt
Prompt Client:
DEFINE client = &1 


SELECT     
    oi.article_id "ARTICLE IDENTIFIER",
    (SELECT a.article_name FROM articles a WHERE a.article_id = oi. article_id ) "ARTICLE NAME",
    (SELECT p.quantity FROM package_item p WHERE p.item_id = oi.item_id) "QUANTITY",
    (SELECT
        DISTINCT(
            CASE WHEN EXISTS(SELECT price FROM list_price WHERE client_id = &client AND article_id= ooi.article_id )
            THEN (SELECT price FROM list_price WHERE client_id = &client AND article_id= ooi.article_id )
            ELSE (SELECT price FROM articles WHERE article_id = ooi.article_id) END
        )
    FROM order_item ooi
    WHERE ooi.article_id = oi.article_id) + 
    NVL((   SELECT CASE WHEN s.type = 'percentage' THEN s.percentage *  
                                                                        (SELECT
                                                                            DISTINCT(
                                                                                CASE WHEN EXISTS(SELECT price FROM list_price WHERE client_id = &client AND article_id= ooi.article_id )
                                                                                THEN (SELECT price FROM list_price WHERE client_id = &client AND article_id= ooi.article_id )
                                                                                ELSE (SELECT price FROM articles WHERE article_id = ooi.article_id) END
                                                                            )
                                                                        FROM order_item ooi
                                                                        WHERE ooi.article_id = oi.article_id)
        ELSE s.amount  END
        FROM services s
        WHERE  s.service_id = oi.service_id), 0) "UNITARY PRICE",
    (SELECT p.quantity FROM package_item p WHERE p.item_id = oi.item_id) * ((SELECT
        DISTINCT(
            CASE WHEN EXISTS(SELECT price FROM list_price WHERE client_id = &client AND article_id= ooi.article_id )
            THEN (SELECT price FROM list_price WHERE client_id = &client AND article_id= ooi.article_id )
            ELSE (SELECT price FROM articles WHERE article_id = ooi.article_id) END
        )
    FROM order_item ooi
    WHERE ooi.article_id = oi.article_id) + 
    NVL((   SELECT CASE WHEN s.type = 'percentage' THEN s.percentage *  
                                                                        (SELECT
                                                                            DISTINCT(
                                                                                CASE WHEN EXISTS(SELECT price FROM list_price WHERE client_id = &client AND article_id= ooi.article_id )
                                                                                THEN (SELECT price FROM list_price WHERE client_id = &client AND article_id= ooi.article_id )
                                                                                ELSE (SELECT price FROM articles WHERE article_id = ooi.article_id) END
                                                                            )
                                                                        FROM order_item ooi
                                                                        WHERE ooi.article_id = oi.article_id)
        ELSE s.amount  END
        FROM services s
        WHERE  s.service_id = oi.service_id), 0)) "TOTAL PRICE",
    (SELECT a.article_description FROM articles a WHERE a.article_id = oi. article_id ) "DESCRIPTION"
FROM orders o
LEFT OUTER JOIN order_item oi ON oi.order_number = o.order_number
WHERE o.order_number = &order
ORDER BY oi.item_id ASC;

UNDEFINE client
UNDEFINE order

COMMIT;