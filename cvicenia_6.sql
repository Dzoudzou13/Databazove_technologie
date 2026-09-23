SELECT
    c.customer_name,
    o.order_id,
    o.sales
FROM customers AS c
FULL OUTER JOIN orders AS o
    ON c.customer_id = o.customer_id;