CREATE PROCEDURE apply_regional_discount(
    p_region_name TEXT,
    p_discount_rate NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE orders AS o
    SET sales = o.sales * (1 - p_discount_rate)
    FROM customers AS c
    WHERE c.customer_id = o.customer_id
      AND c.region = p_region_name;

    RAISE NOTICE 'Applied a % discount to region %',
        p_discount_rate,
        p_region_name;
END;
$$;

CALL apply_regional_discount('West', 0.10);
CALL apply_regional_discount('West', 0.10);