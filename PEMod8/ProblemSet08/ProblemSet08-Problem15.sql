-- ## Problem 15
-- 
-- Using a single SQL command , write the SQL code that will change the PROJ_NUM to 14 for 
-- employees who were hired before January 1, 1998, and whose job code is at least 501. 
-- 

/* YOUR SOLUTION HERE */
UPDATE EMP_2
SET PROJ_NUM = '14'
WHERE EMP_HIREDATE < '1998-01-01' AND JOB_CODE >= '501'
