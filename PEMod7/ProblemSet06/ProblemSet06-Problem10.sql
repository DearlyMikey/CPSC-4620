-- ## Problem 10
-- 
-- Write a query to display the number of products within each base and type combination, 
-- sorted by base and then by type.
-- 
-- Your results should look like this:
-- +-------------+-------------+---------------+
-- | PROD_BASE   | PROD_TYPE   |   NUMPRODUCTS |
-- |-------------+-------------+---------------|
-- | Solvent     | Exterior    |            67 |
-- | Solvent     | Interior    |            83 |
-- | Water       | Exterior    |            39 |
-- | Water       | Interior    |            63 |
-- +-------------+-------------+---------------+
-- 

/* YOUR SOLUTION HERE */
SELECT
    PROD_BASE,
    PROD_TYPE,
    COUNT(PROD_DESCRIPT) AS 'NUMPRODUCTS'
FROM LGPRODUCT
GROUP BY PROD_BASE, PROD_TYPE
ORDER BY PROD_BASE, PROD_TYPE
