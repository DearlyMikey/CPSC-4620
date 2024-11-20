-- ## Problem 12
-- 
-- Write a query to display the brand ID, brand name, and average price of products of each brand.
-- Sort the output by brand name. Results are shown with the average price rounded to two decimal
-- places.
-- 
-- Your results should look like this:
-- +------------+-------------------+------------+
-- |   BRAND_ID | BRAND_NAME        |   AVGPRICE |
-- |------------+-------------------+------------|
-- |         33 | BINDER PRIME      |      16.12 |
-- |         29 | BUSTERS           |      22.59 |
-- |         23 | FORESTERS BEST    |      20.94 |
-- |         27 | HOME COMFORT      |      21.8  |
-- |         35 | LE MODE           |      19.22 |
-- |         30 | LONG HAUL         |      20.12 |
-- |         28 | OLDE TYME QUALITY |      18.33 |
-- |         25 | STUTTENFURST      |      16.47 |
-- |         31 | VALU-MATTE        |      16.84 |
-- +------------+-------------------+------------+
-- 

/* YOUR SOLUTION HERE */
SELECT
    b.BRAND_ID,
    b.BRAND_NAME,
    ROUND(AVG(p.PROD_PRICE),2) AS 'AVGPRICE'
FROM LGBRAND b
    JOIN LGPRODUCT p ON b.BRAND_ID = p.BRAND_ID
GROUP BY b.BRAND_ID, b.BRAND_NAME
ORDER BY BRAND_NAME
