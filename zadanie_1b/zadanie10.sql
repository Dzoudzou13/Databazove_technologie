SELECT sales.*
FROM flourmills_sales AS sales
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales AS other_sales
    WHERE other_sales.product_name = sales.product_name
    GROUP BY other_sales.product_name
    HAVING COUNT(DISTINCT EXTRACT(MONTH FROM other_sales.sale_date)) > 1
);