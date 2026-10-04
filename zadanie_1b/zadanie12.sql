SELECT DISTINCT sales.product_category
FROM flourmills_sales AS sales
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales AS category_sales
    WHERE category_sales.product_category = sales.product_category
    GROUP BY category_sales.product_category
    HAVING COUNT(DISTINCT category_sales.region) > 3
);