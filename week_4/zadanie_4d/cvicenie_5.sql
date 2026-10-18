WITH product_totals AS (
    SELECT
        p.category,
        p.product_name,
        SUM(o.sales) AS product_sales
    FROM orders AS o
    JOIN products AS p
        ON p.product_id = o.product_id
    GROUP BY p.category, p.product_name
)
SELECT
    category,
    product_name,
    product_sales,
    SUM(product_sales) OVER (
        PARTITION BY category
    ) AS category_total,
    ROUND(
        product_sales * 100.0 /
        NULLIF(
            SUM(product_sales) OVER (PARTITION BY category),
            0
        ),
        2
    ) AS pct_of_category
FROM product_totals
ORDER BY category, product_sales DESC;