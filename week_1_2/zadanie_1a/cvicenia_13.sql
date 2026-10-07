SELECT
    c.customer_name,
    SUM(o.sales) AS total_sales,
    AVG(o.discount) AS average_discount,
    COUNT(DISTINCT o.order_id) AS order_count,
    CASE
        WHEN SUM(o.sales) > 2500 THEN 'VIP'
        ELSE 'REGULAR'
    END AS customer_type
FROM customers AS c
JOIN orders AS o
    ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_sales DESC;
