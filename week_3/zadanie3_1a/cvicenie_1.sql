-- Active: 1790163059069@@127.0.0.1@5432@superstore
CREATE VIEW high_value_customers AS
SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.sales) AS total_sales
FROM customers AS c
JOIN orders AS o
    ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.sales) > 2000;

SELECT COUNT(*)
FROM high_value_customers;