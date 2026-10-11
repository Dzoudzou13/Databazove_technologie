WITH RECURSIVE monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', sale_date) AS month,
        SUM(total_amount) AS revenue
    FROM flourmills_sales
    GROUP BY DATE_TRUNC('month', sale_date)
),
ordered_months AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY month) AS rn,
        month,
        revenue
    FROM monthly_revenue
),
cumulative_target AS (
    SELECT
        rn,
        month,
        revenue,
        revenue AS cumulative_revenue
    FROM ordered_months
    WHERE rn = 1

    UNION ALL

    SELECT
        next_month.rn,
        next_month.month,
        next_month.revenue,
        previous.cumulative_revenue + next_month.revenue
    FROM cumulative_target AS previous
    JOIN ordered_months AS next_month
        ON next_month.rn = previous.rn + 1
    WHERE previous.cumulative_revenue < 500000000
)
SELECT rn, month, revenue, cumulative_revenue
FROM cumulative_target
ORDER BY rn;