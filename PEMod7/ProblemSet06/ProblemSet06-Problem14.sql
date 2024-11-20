-- ## Problem 14
-- 
-- Write a query to display the employee number, first name, last name, and largest salary amount
-- for each employee in department 200. Sort the output by largest salary in descending order, 
-- and then by employee number.
-- 
-- Your results should look like this:
-- +-----------+-------------+-------------+-----------------+
-- |   EMP_NUM | EMP_FNAME   | EMP_LNAME   |   LARGESTSALARY |
-- |-----------+-------------+-------------+-----------------|
-- |     83509 | FRANKLYN    | STOVER      |          210000 |
-- |     83705 | JOSE        | BARR        |          147000 |
-- |     83537 | CLEO        | ENGLISH     |          136000 |
-- |     83565 | LOURDES     | ABERNATHY   |          133000 |
-- |     83593 | ROSANNE     | NASH        |          129000 |
-- ...
-- |     84392 | ALEJANDRA   | WHALEY      |           61000 |
-- |     84420 | DOUG        | CAUDILL     |           61000 |
-- +-----------+-------------+-------------+-----------------+
-- 
-- 

/* YOUR SOLUTION HERE */
SELECT
    e.EMP_NUM,
    e.EMP_FNAME,
    e.EMP_LNAME,
    TRIM(MAX(SAL_AMOUNT))+0 AS 'LARGESTSALARY'
FROM LGEMPLOYEE e
    JOIN LGDEPARTMENT d on e.DEPT_NUM = d.DEPT_NUM
    JOIN LGSALARY_HISTORY s ON e.EMP_NUM = s.EMP_NUM
WHERE d.DEPT_NUM = '200'
GROUP BY e.EMP_NUM
ORDER BY LARGESTSALARY DESC, EMP_NUM

