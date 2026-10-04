WITH order_totals AS (
    SELECT
        c.region,
        o.order_id,
        SUM(o.sales) AS order_total
    FROM orders AS o
    JOIN customers AS c
        ON c.customer_id = o.customer_id
    GROUP BY c.region, o.order_id
)
SELECT
    region,
    COUNT(CASE WHEN order_total > 1000 THEN 1 END) AS high_value_orders,
    COUNT(CASE WHEN order_total <= 1000 THEN 1 END) AS low_value_orders
FROM order_totals
GROUP BY region;
