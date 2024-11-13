-- ## Problem 6
--
-- Using the data in the ASSIGNMENT table, write the SQL that will yield the 
-- total number of hours worked for each employee and the total charges stemming 
-- from those hours worked, sorted by employee number. 
-- 
-- The results of running that query are shown below:
-- 
--    +---------+------------+-------------------+--------------------+
--    | EMP_NUM | EMP_LNAME  | SumOfASSIGN_HOURS | SumOfASSIGN_CHARGE |
--    +---------+------------+-------------------+--------------------+
--    |   101   |    News    |        3.1        |       387.50       |
--    |   103   |  Arbough   |       19.7        |      1664.65       |
--    |   104   |  Ramoras   |       11.9        |      1218.70       |
--    |   105   |  Johnson   |       12.5        |      1382.50       |
--    |   108   | Washington |        8.3        |       840.15       |
--    |   113   | Joenbrood  |        3.8        |       192.85       |
--    |   115   |  Bawangi   |       12.5        |      1276.75       |
--    |   117   | Williamson |       18.8        |       649.54       |
--    +---------+------------+-------------------+--------------------+

/* YOUR SOLUTION HERE */
SELECT
    a.EMP_NUM,
    e.EMP_LNAME,
    SUM(a.ASSIGN_HOURS) as 'SumOfASSIGN_HOURS',
    SUM(a.ASSIGN_CHARGE) as 'SumOfASSIGN_CHARGE'
FROM ASSIGNMENT a JOIN EMPLOYEE e ON a.EMP_NUM = e.EMP_NUM
GROUP BY a.EMP_NUM
ORDER BY a.EMP_NUM