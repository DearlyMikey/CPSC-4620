-- ## Problem 05
-- 
-- Write a query to display the employee number, last name, first name, salary from date, 
-- salary end date, and salary amount for employees 83731, 83745, and 84039. Sort the output by
-- employee number then salary from date.
-- 
-- Your results should look like this:
-- +-----------+-------------+-------------+------------+------------+--------------+
-- |   EMP_NUM | EMP_LNAME   | EMP_FNAME   | SAL_FROM   | SAL_END    |   SAL_AMOUNT |
-- |-----------+-------------+-------------+------------+------------+--------------|
-- |     83731 | VARGAS      | SHERON      | 2018-07-15 | 2019-07-14 |        43740 |
-- |     83731 | VARGAS      | SHERON      | 2019-07-14 | 2020-07-13 |        48110 |
-- |     83731 | VARGAS      | SHERON      | 2020-07-14 | 2021-07-14 |        49550 |
-- |     83731 | VARGAS      | SHERON      | 2021-07-15 |            |        51040 |
-- |     83745 | SPICER      | DWAIN       | 2015-08-02 | 2016-08-01 |        56020 |
-- |     83745 | SPICER      | DWAIN       | 2016-08-02 | 2017-08-02 |        57700 |
-- |     83745 | SPICER      | DWAIN       | 2017-08-03 | 2018-08-01 |        63470 |
-- |     83745 | SPICER      | DWAIN       | 2018-08-02 | 2019-08-01 |        68550 |
-- |     83745 | SPICER      | DWAIN       | 2019-08-01 | 2020-07-31 |        71980 |
-- |     83745 | SPICER      | DWAIN       | 2020-08-01 | 2021-08-01 |        74140 |
-- |     83745 | SPICER      | DWAIN       | 2021-08-02 |            |        76360 |
-- |     84039 | COLEMAN     | HANNAH      | 2018-06-28 | 2019-06-27 |        47380 |
-- |     84039 | COLEMAN     | HANNAH      | 2019-06-27 | 2020-06-26 |        51170 |
-- |     84039 | COLEMAN     | HANNAH      | 2020-06-27 | 2021-06-27 |        52700 |
-- |     84039 | COLEMAN     | HANNAH      | 2021-06-28 |            |        54280 |
-- +-----------+-------------+-------------+------------+------------+--------------+
-- 

/* YOUR SOLUTION HERE */
SELECT
    e.EMP_NUM,
    e.EMP_LNAME,
    e.EMP_FNAME,
    s.SAL_FROM,
    s.SAL_END,
    s.SAL_AMOUNT
FROM LGEMPLOYEE e
    JOIN LGSALARY_HISTORY s on e.EMP_NUM = s.EMP_NUM
WHERE e.EMP_NUM in (83731, 83745, 84039)
ORDER BY e.EMP_NUM, s.SAL_FROM

