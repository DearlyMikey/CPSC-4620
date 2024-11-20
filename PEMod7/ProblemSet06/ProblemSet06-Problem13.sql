-- ## Problem 13
-- 
-- Write a query to display the department number and most recent employee hire date for each
-- department. Sort the output by department number.
-- 
-- Your results should look like this:
-- +------------+--------------+
-- |   DEPT_NUM | MOSTRECENT   |
-- |------------+--------------|
-- |        200 | 2011-06-08   |
-- |        250 | 2021-12-15   |
-- |        280 | 2020-04-16   |
-- |        300 | 2020-12-12   |
-- |        400 | 2021-01-26   |
-- |        500 | 2021-04-26   |
-- |        550 | 2021-10-22   |
-- |        600 | 2021-10-02   |
-- +------------+--------------+
-- 

/* YOUR SOLUTION HERE */
SELECT
    d.DEPT_NUM,
    MAX(EMP_HIREDATE) AS 'MOSTRECENT'
FROM LGDEPARTMENT d
    JOIN LGEMPLOYEE e ON d.DEPT_NUM = e.DEPT_NUM
GROUP BY d.DEPT_NUM
