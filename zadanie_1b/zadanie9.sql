SELECT
    sales.product_name,
    sales.region,
    sales.total_amount,
    (
        SELECT MIN(region_sales.total_amount)
        FROM flourmills_sales AS region_sales
        WHERE region_sales.region = sales.region
    ) AS region_min_amount
FROM flourmills_sales AS sales;