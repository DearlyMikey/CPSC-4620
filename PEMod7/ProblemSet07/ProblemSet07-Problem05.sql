-- ## Problem 5
-- 
-- Write a query to display the brand ID, brand name, brand type, and average price of products 
-- for the brand that has the largest average product price.
-- 
-- Your results should look like this:
-- +------------+--------------+--------------+------------+
-- |   BRAND_ID | BRAND_NAME   | BRAND_TYPE   |   AVGPRICE |
-- |------------+--------------+--------------+------------|
-- |         29 | BUSTERS      | VALUE        |      22.59 |
-- +------------+--------------+--------------+------------+
-- 

/* YOUR SOLUTION HERE */
SELECT
    BRAND_ID,
    BRAND_NAME,
    BRAND_TYPE,
    ROUND(AVERAGE,2) AS 'AVGPRICE'
FROM
    (SELECT b.BRAND_ID,
            b.BRAND_NAME,
            b.BRAND_TYPE,
            AVG(p.PROD_PRICE) AS 'AVERAGE'
     FROM LGBRAND b
        JOIN LGPRODUCT p on b.BRAND_ID = p.BRAND_ID
     GROUP BY b.BRAND_ID, b.BRAND_NAME, b.BRAND_TYPE) as BIA
ORDER BY AVERAGE DESC
LIMIT 1;


