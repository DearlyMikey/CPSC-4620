-- ## Problem 4
--
-- Write the SQL that will list only the distinct project numbers in the ASSIGNMENT table, sorted by project number. 
-- 
-- The results of running that query are shown below:
-- 
--    +----------+
--    | PROJ_NUM |
--    +----------+
--    |    15    |
--    |    18    |
--    |    22    |
--    |    25    |
--    +----------+

/* YOUR SOLUTION HERE */
SELECT
    DISTINCT(PROJ_NUM) AS 'PROJ_NUM'
FROM ASSIGNMENT