WITH customer_purchases AS (
    SELECT
        customer_id,
        product_name,
        sale_date,
        total_amount,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY sale_date DESC
        ) AS purchase_number
    FROM flourmills_sales
)
SELECT
    customer_id,
    product_name,
    sale_date,
    total_amount
FROM customer_purchases
WHERE purchase_number = 1
ORDER BY customer_id ASC;