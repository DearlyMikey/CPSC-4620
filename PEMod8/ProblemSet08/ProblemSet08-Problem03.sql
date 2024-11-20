-- ## Problem 3
-- 
-- Using the EMPLOYEE table that already exists, use a subquery to insert the remaining rows 
-- from the EMPLOYEE table into the EMP_1 table. Remember, your subquery should only retrieve the
-- data for employees 103 through 109.
-- 

/* YOUR SOLUTION HERE */
INSERT INTO EMP_1 (EMP_NUM, EMP_LNAME, EMP_FNAME, EMP_INITIAL, EMP_HIREDATE, JOB_CODE)
SELECT EMP_NUM, EMP_LNAME, EMP_FNAME, EMP_INITIAL, EMP_HIREDATE, JOB_CODE
FROM EMPLOYEE
WHERE EMP_NUM BETWEEN '103' AND '109';


