SELECT
    c.region,
    SUM(o.sales) AS total_sales
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id
GROUP BY c.region;