-- ## Problem 7
--
-- Write a query to produce the total number of hours and charges for each of the 
-- projects represented in the ASSIGNMENT table, sorted by project number. 
 -- 
-- The results are shown below:
-- 
--    +----------+-------------------+--------------------+
--    | PROJ_NUM | SumOfASSIGN_HOURS | SumOfASSIGN_CHARGE |
--    +----------+-------------------+--------------------+
--    |    15    |       20.5        |      1806.52       |
--    |    18    |       23.7        |      1544.80       |
--    |    22    |       27.0        |      2593.16       |
--    |    25    |       19.4        |      1668.16       |
--    +----------+-------------------+--------------------+

/* YOUR SOLUTION HERE */
SELECT
    PROJ_NUM,
    ROUND(SUM(ASSIGN_HOURS),1) AS 'SumOfASSIGN_HOURS',
    SUM(ASSIGN_CHARGE) AS 'SumOfASSIGN_CHARGE'
FROM ASSIGNMENT
GROUP BY PROJ_NUM
