WITH customer_activity AS (
    SELECT
        c.customer_id,
        c.customer_name,
        MAX(o.order_date) OVER (
            PARTITION BY c.customer_id
        ) AS last_order_date,
        MAX(o.order_date) OVER () AS latest_order_date
    FROM customers AS c
    JOIN orders AS o
        ON o.customer_id = c.customer_id
)
SELECT DISTINCT
    customer_id,
    customer_name,
    last_order_date
FROM customer_activity
WHERE last_order_date < latest_order_date - INTERVAL '90 days'
ORDER BY last_order_date ASC;