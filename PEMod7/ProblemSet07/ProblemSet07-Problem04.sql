-- ## Problem 4
-- 
-- Write a query to display the largest average product price of any brand.
-- 
-- Your results should look like this:
-- +-------------------+
-- |   LARGEST AVERAGE |
-- |-------------------|
-- |             22.59 |
-- +-------------------+
-- 

/* YOUR SOLUTION HERE */
SELECT
    ROUND(MAX(AVERAGE),2) AS 'LARGEST AVERAGE'
FROM
    (SELECT b.BRAND_ID ,
            AVG(p.PROD_PRICE) AS 'AVERAGE'
     FROM LGBRAND b
        JOIN LGPRODUCT p on b.BRAND_ID = p.BRAND_ID
     GROUP BY b.BRAND_ID) as BIA