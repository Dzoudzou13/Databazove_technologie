WITH monthly_totals AS (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        SUM(sales) AS monthly_sales
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
)
SELECT
    month,
    monthly_sales,
    LAG(monthly_sales) OVER (
        ORDER BY month
    ) AS prev_month_sales,
    LEAD(monthly_sales) OVER (
        ORDER BY month
    ) AS next_month_sales
FROM monthly_totals
ORDER BY month ASC;