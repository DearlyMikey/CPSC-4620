-- ## Problem 10
-- 
-- The Binder Prime Company wants to recognize the employee who sold the most of its products during
--  a specified period. Write a query to display the employee number, employee first name, employee
-- last name, email address, and TOTAL units sold for the employee who sold the most Binder Prime
-- brand products between November 1, 2021, and December 5, 2021. 
-- 
-- If there is a tie for most units sold, sort the output by employee last name.
-- 
-- Your results should look like this:
-- +-----------+-------------+-------------+--------------------------+---------+
-- |   EMP_NUM | EMP_FNAME   | EMP_LNAME   | EMP_EMAIL                |   TOTAL |
-- |-----------+-------------+-------------+--------------------------+---------|
-- |     84134 | ROSALIE     | GARLAND     | G.ROSALI98@LGCOMPANY.COM |      23 |
-- |     83850 | RUSTY       | MILES       | M.RUSTY95@LGCOMPANY.COM  |      23 |
-- +-----------+-------------+-------------+--------------------------+---------+
-- 

/* YOUR SOLUTION HERE */
SELECT emp.EMP_NUM,
       EMP_FNAME,
       EMP_LNAME,
       EMP_EMAIL,
       TOTAL
FROM LGEMPLOYEE AS emp
         INNER JOIN
     (SELECT EMPLOYEE_ID, SUM(LINE_QTY) AS TOTAL
      FROM LGINVOICE AS i
               INNER JOIN LGLINE as l ON i.INV_NUM = l.INV_NUM
               INNER JOIN LGPRODUCT AS p ON l.PROD_SKU = p.PROD_SKU
               INNER JOIN LGBRAND AS b ON b.BRAND_ID = p.BRAND_ID
      WHERE BRAND_NAME = 'Binder Prime'
        AND INV_DATE BETWEEN '2021-11-01' AND '2021-12-05'
      GROUP BY EMPLOYEE_ID) AS sub
     ON emp.EMP_NUM = sub.EMPLOYEE_ID
WHERE TOTAL = (SELECT MAX(TOTAL)
               FROM (SELECT EMPLOYEE_ID, SUM(LINE_QTY) AS TOTAL
                     FROM LGINVOICE AS i
                              INNER JOIN LGLINE as l ON i.INV_NUM = l.INV_NUM
                              INNER JOIN LGPRODUCT AS p ON l.PROD_SKU = p.PROD_SKU
                              INNER JOIN LGBRAND AS b ON b.BRAND_ID = p.BRAND_ID
                     WHERE BRAND_NAME = 'Binder Prime'
                       AND INV_DATE BETWEEN '2021-11-01' AND '2021-12-05'
                     GROUP BY EMPLOYEE_ID) as sub1)
ORDER BY EMP_LNAME;
