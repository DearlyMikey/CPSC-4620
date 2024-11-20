-- ## Problem 11
-- 
-- Write a query to display the total inventory—that is, the sum of all products on hand for 
-- each brand ID. Sort the output by brand ID in descending order.
-- 
-- Your results should look like this:
-- +------------+------------------+
-- |   BRAND_ID |   TOTALINVENTORY |
-- |------------+------------------|
-- |         35 |             2431 |
-- |         33 |             2158 |
-- |         31 |             1117 |
-- |         30 |             3012 |
-- |         29 |             1735 |
-- |         28 |             2200 |
-- |         27 |             2596 |
-- |         25 |             1829 |
-- |         23 |             1293 |
-- +------------+------------------+
-- 

/* YOUR SOLUTION HERE */
SELECT
    BRAND_ID,
    SUM(PROD_QOH) AS 'TOTALINVENTORY'
FROM LGPRODUCT
GROUP BY BRAND_ID
ORDER BY BRAND_ID DESC