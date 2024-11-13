-- ## Problem 8

-- Write the SQL to generate the total hours worked and the total charges made by all employees. 
-- 
-- The results are shown here:
-- 
--    +------------------------+-------------------------+
--    | SumOfSumOfASSIGN_HOURS | SumOfSumOfASSIGN_CHARGE |
--    +------------------------+-------------------------+
--    |          90.6          |         7612.64         |
--    +------------------------+-------------------------+

/* YOUR SOLUTION HERE */
SELECT
    ROUND(SUM(a.SumOfASSIGN_HOURS),1) as 'SumOfSumOfASSIGN_HOURS',
    SUM(a.SumOfASSIGN_CHARGE) as 'SumOfSumOfASSIGN_CHARGE'
FROM (SELECT SUM(ASSIGN_HOURS) as 'SumOfASSIGN_HOURS', SUM(ASSIGN_CHARGE) as 'SumOfASSIGN_CHARGE' FROM ASSIGNMENT GROUP BY EMP_NUM) as a
