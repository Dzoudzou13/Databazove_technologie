WITH RECURSIVE date_range AS (
    SELECT
        MIN(sale_date) AS start_date,
        MAX(sale_date) AS end_date
    FROM flourmills_sales
),
sales_calendar AS (
    SELECT start_date AS calendar_date
    FROM date_range
    WHERE start_date IS NOT NULL

    UNION ALL

    SELECT calendar_date + 1
    FROM sales_calendar
    CROSS JOIN date_range
    WHERE calendar_date < end_date
)
SELECT COUNT(*) AS number_of_days
FROM sales_calendar;
ORDER BY calendar_date ASC;



