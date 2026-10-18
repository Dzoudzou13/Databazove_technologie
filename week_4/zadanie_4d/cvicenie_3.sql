WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(o.sales) AS total_sales
    FROM customers AS c
    JOIN orders AS o
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_id, c.customer_name
),
customer_quartiles AS (
    SELECT
        customer_name,
        total_sales,
        NTILE(4) OVER (
            ORDER BY total_sales DESC
        ) AS quartile
    FROM customer_sales
)
SELECT customer_name, total_sales, quartile
FROM customer_quartiles
ORDER BY total_sales DESC;