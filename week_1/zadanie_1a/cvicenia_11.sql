SELECT
    c.region,
    SUM(o.sales) AS total_sales,
    AVG(o.discount) AS average_discount,
    COUNT(DISTINCT o.order_id) AS order_count
FROM customers AS c
JOIN orders AS o
    ON o.customer_id = c.customer_id
GROUP BY c.region;
