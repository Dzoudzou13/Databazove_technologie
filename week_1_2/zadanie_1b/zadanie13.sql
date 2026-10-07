SELECT sales.*
FROM flourmills_sales AS sales
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales AS region_sales
    WHERE region_sales.region = sales.region
      AND EXTRACT(YEAR FROM region_sales.sale_date) = 2024
);