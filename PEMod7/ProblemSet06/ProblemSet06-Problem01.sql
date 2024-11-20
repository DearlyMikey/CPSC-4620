-- ## Problem 01
-- 
-- Write a query to display the eight departments in the LGDEPARTMENT table sorted by department name.
-- 
-- Your results should look like this:
-- +------------+------------------+-----------------+--------------+-----------+
-- |   DEPT_NUM | DEPT_NAME        |   DEPT_MAIL_BOX | DEPT_PHONE   |   EMP_NUM |
-- |------------+------------------+-----------------+--------------+-----------|
-- |        600 | ACCOUNTING       |             957 | 555-2333     |     84583 |
-- |        250 | CUSTOMER SERVICE |             100 | 555-5555     |     84001 |
-- |        500 | DISTRIBUTION     |             348 | 555-3624     |     84052 |
-- |        280 | MARKETING        |             848 | 555-8500     |     84042 |
-- |        300 | PURCHASING       |             222 | 555-4873     |     83746 |
-- |        200 | SALES            |             475 | 555-2824     |     83509 |
-- |        550 | TRUCKING         |             842 | 555-0057     |     83683 |
-- |        400 | WAREHOUSE        |             789 | 555-1003     |     83759 |
-- +------------+------------------+-----------------+--------------+-----------+
-- 

/* YOUR SOLUTION HERE */
SELECT
    DEPT_NUM,
    DEPT_NAME,
    DEPT_MAIL_BOX,
    DEPT_PHONE,
    EMP_NUM
FROM LGDEPARTMENT
ORDER BY DEPT_NAME
