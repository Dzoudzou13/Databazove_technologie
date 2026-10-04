SELECT DISTINCT sales.region
FROM flourmills_sales AS sales
WHERE NOT EXISTS (
    SELECT 1
    FROM flourmills_sales AS flour_sales
    WHERE flour_sales.region = sales.region
      AND flour_sales.product_category = 'Flour'
);