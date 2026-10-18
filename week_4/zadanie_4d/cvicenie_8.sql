WITH first_purchases AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', MIN(order_date)) AS first_month
    FROM orders
    GROUP BY customer_id
)
SELECT COUNT(*) AS returning_customers
FROM first_purchases AS f
WHERE f.first_month = DATE '2024-06-01'
  AND EXISTS (
      SELECT 1
      FROM orders AS o
      WHERE o.customer_id = f.customer_id
        AND o.order_date >= f.first_month + INTERVAL '1 month'
  );