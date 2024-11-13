-- ## Problem 5
--
-- Write the SQL to validate the ASSIGN_CHARGE values in the ASSIGNMENT table. 
-- Your query should retrieve the assignment number, employee number, project number, 
-- the stored assignment charge (ASSIGN_CHARGE), and the calculated assignment charge 
-- (CALC_ASSIGN_CHARGE is calculated by multiplying ASSIGN_CHG_HR by ASSIGN_HOURS and 
-- rounded to two decimal places). Sort the results by the assignment number. 
-- 
-- The results of running that query are shown below:
-- 
--    +------------+---------+----------+---------------+--------------------+
--    | ASSIGN_NUM | EMP_NUM | PROJ_NUM | ASSIGN_CHARGE | CALC_ASSIGN_CHARGE |
--    +------------+---------+----------+---------------+--------------------+
--    |    1001    |   103   |    18    |    295.75     |       295.75       |
--    |    1002    |   117   |    22    |    145.11     |       145.11       |
--    |    1003    |   117   |    18    |     69.10     |       69.10        |
--    |    1004    |   103   |    18    |    498.55     |       498.55       |
--    |    1005    |   108   |    25    |    212.85     |       212.85       |
--    |    1006    |   104   |    22    |    406.35     |       406.35       |
--    |    1007    |   113   |    25    |    192.85     |       192.85       |
--    |    1008    |   103   |    18    |     76.05     |       76.05        |
--    |    1009    |   115   |    15    |    541.80     |       541.80       |
--    |    1010    |   117   |    15    |     82.92     |       82.92        |
--    |    1011    |   105   |    25    |    451.50     |       451.50       |
--    |    1012    |   108   |    18    |    328.95     |       328.95       |
--    |    1013    |   115   |    25    |    193.50     |       193.50       |
--    |    1014    |   104   |    22    |    270.90     |       270.90       |
--    |    1015    |   103   |    15    |    515.45     |       515.45       |
--    |    1016    |   105   |    22    |    493.50     |       493.50       |
--    |    1017    |   117   |    18    |    131.29     |       131.29       |
--    |    1018    |   117   |    25    |     76.01     |       76.01        |
--    |    1019    |   104   |    25    |    541.45     |       541.45       |
--    |    1020    |   101   |    15    |    387.50     |       387.50       |
--    |    1021    |   108   |    22    |    298.35     |       298.35       |
--    |    1022    |   115   |    22    |    541.45     |       541.45       |
--    |    1023    |   105   |    22    |    437.50     |       437.50       |
--    |    1024    |   103   |    15    |    278.85     |       278.85       |
--    |    1025    |   117   |    18    |    145.11     |       145.11       |
--    +------------+---------+----------+---------------+--------------------+

/* YOUR SOLUTION HERE */
SELECT
    ASSIGN_NUM,
    EMP_NUM,
    PROJ_NUM,
    ASSIGN_CHARGE,
    ROUND((ASSIGN_CHARGE * ASSIGN_CHG_HR), 2) AS 'CALC_ASSIGN_CHARGE'
FROM ASSIGNMENT
ORDER BY ASSIGN_NUM
