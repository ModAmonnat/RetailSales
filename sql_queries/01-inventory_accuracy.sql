SELECT 
    /* Counts products missing from the physical audit */
    SUM(CASE WHEN p.stock_count IS NULL THEN 1 ELSE 0 END) AS missing_quantity_in_physical,
    /* Counts products where system and physical quantities mismatch */
    SUM(CASE WHEN p.stock_count IS NOT NULL AND s.quantity_in_stock <> p.stock_count THEN 1 ELSE 0 END) AS mismatched_quantity,
    /* Total discrepancies requiring investigation */
    SUM(CASE WHEN p.stock_count IS NULL OR s.quantity_in_stock <> p.stock_count THEN 1 ELSE 0 END) AS total_discrepancies
FROM systemstock s 
LEFT JOIN physical_count p 
    ON s.product_id = p.product_id;
