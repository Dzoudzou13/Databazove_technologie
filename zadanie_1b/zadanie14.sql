SELECT DISTINCT sales.product_category
FROM flourmills_sales AS sales
WHERE NOT EXISTS (
    SELECT 1
    FROM flourmills_sales AS category_sales
    WHERE category_sales.product_category = sales.product_category
      AND category_sales.total_amount > 500000
);