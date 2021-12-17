Prompt *****ADD ARTICLE.....

Prompt
Prompt Order number:
DEFINE order = &1 

Prompt
Prompt Article:
DEFINE article = &2

Prompt
Prompt quantity:
DEFINE quantity = &3

Prompt
Prompt Services 
DEFINE service = &4

Prompt
Prompt client_id 
DEFINE client = &4

INSERT INTO order_item(order_number, article_id, service_id)
VALUES
 (
    &order, 
    &article, 
    CASE WHEN '&service' = (SELECT service_id FROM article_service WHERE article_id = &article AND service_id = '&service') THEN '&service'
    ELSE null END
    );

INSERT INTO package_item (item_id, package_id, quantity) VALUES (item_id_seq.currval, package_id_seq.currval, &quantity);

WITH cte1
AS(
    SELECT pi.quantity, pi.item_id, oi.article_id
    FROM order_item oi    
    LEFT OUTER JOIN orders o ON TO_CHAR(o.order_date, 'DD-Month-YYYY') = TO_CHAR(SYSDATE, 'DD-Month-YYYY') AND o.order_number = oi.order_number
    RIGHT OUTER JOIN package_item pi ON pi.item_id = oi.item_id
    WHERE oi.order_number = &order),
cte2
AS(
    SELECT  DISTINCT(oi.article_id),
        CASE WHEN EXISTS(SELECT price FROM list_price WHERE client_id = &client AND article_id= oi.article_id )
        THEN (SELECT price FROM list_price WHERE client_id = &client AND article_id= oi.article_id )
        ELSE (SELECT price FROM articles WHERE article_id = oi.article_id) END price
    FROM order_item oi
),
cte3
AS(
    SELECT oi.article_id, oi.item_id,
    CASE WHEN s.type = 'percentage' THEN s.percentage * c2.price
    ELSE s.amount  END * 
    (SELECT c1.quantity FROM cte1 c1 WHERE c1.item_id = oi.item_id) service_price
    FROM order_item oi
    LEFT OUTER JOIN services s ON oi.service_id = s.service_id
    LEFT OUTER JOIN cte2 c2 ON c2.article_id = oi.article_id
    WHERE oi.order_number = &order
)
SELECT SUM((c1.quantity * (SELECT 
                            c2.price FROM cte2 c2 WHERE 
                            c2.article_id = c1.article_id)))
        +SUM(c3.service_price) TOTAL
FROM cte1 c1
LEFT OUTER JOIN cte3 c3 ON c3.item_id = c1.item_id;

UNDEFINE order
UNDEFINE article
UNDEFINE quantity
UNDEFINE service
UNDEFINE client

COMMIT;



