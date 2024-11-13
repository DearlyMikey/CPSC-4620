-- ## Problem 7
-- 
-- Write a query to display the current salary for each employee in department 300. Assume that 
-- only current employees are kept in the system, and therefore the most current salary for each
-- employee is the entry in the salary history with a NULL end date. Sort the output in descending
-- order by salary amount.
-- 
-- Your results should look like this:
-- +-----------+-------------+-------------+--------------+
-- |   EMP_NUM | EMP_LNAME   | EMP_FNAME   |   SAL_AMOUNT |
-- |-----------+-------------+-------------+--------------|
-- |     83746 | RANKIN      | SEAN        |        95550 |
-- |     84328 | CARPENTER   | FERN        |        94090 |
-- |     83716 | RIVERA      | HENRY       |        85920 |
-- |     84432 | JAMISON     | MERLE       |        85360 |
-- |     83902 | VARGAS      | ROCKY       |        79540 |
-- |     83695 | MENDEZ      | CARROLL     |        79200 |
-- |     84500 | WESTON      | CHRISTINE   |        78690 |
-- ...
-- |     83644 | MAXWELL     | WILLA       |        43200 |
-- |     83312 | BAKER       | ROSALBA     |        42400 |
-- +-----------+-------------+-------------+--------------+
-- 
-- 

/* YOUR SOLUTION HERE */

