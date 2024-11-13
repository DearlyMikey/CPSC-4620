-- ## Problem 1
-- 
-- Write the SQL code required to list the employee number, last name, first name, and middle initial of all employees whose last names
-- start with Smith. In other words, the rows for both Smith and Smithfield should be included in the listing. Sort the results by 
-- employee number. Assume case sensitivity.  
-- 
-- Display the results as shown below:
--
--    +---------+------------+-----------+-------------+
--    | EMP_NUM | EMP_LNAME  | EMP_FNAME | EMP_INITIAL |
--    +---------+------------+-----------+-------------+
--    |   106   | Smithfield |  William  |             |
--    |   109   |   Smith    |   Larry   |      W      |
--    |   112   |  Smithson  |  Darlene  |      M      |
--    +---------+------------+-----------+-------------+

/* YOUR SOLUTION HERE */
SELECT
    EMP_NUM,
    EMP_LNAME,
    EMP_FNAME,
    EMP_INITIAL
FROM EMPLOYEE
WHERE EMP_LNAME LIKE 'Smith%'