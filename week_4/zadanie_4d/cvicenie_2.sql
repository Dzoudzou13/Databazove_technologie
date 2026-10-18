WITH customer_profits AS (
    SELECT
        c.region,
        c.customer_id,
        c.customer_name,
        SUM(o.profit) AS total_profit
    FROM customers AS c
    JOIN orders AS o
        ON o.customer_id = c.customer_id
    GROUP BY c.region, c.customer_id, c.customer_name
)
SELECT
    region,
    customer_name,
    total_profit,
    RANK() OVER (
        PARTITION BY region
        ORDER BY total_profit DESC
    ) AS profit_rank,
    DENSE_RANK() OVER (
        PARTITION BY region
        ORDER BY total_profit DESC
    ) AS dense_profit_rank
FROM customer_profits
ORDER BY region, total_profit DESC, customer_name;