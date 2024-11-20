-- ## Problem 6
-- 
-- Write the SQL code to delete the row for William Smithfield, who was hired on June 22, 2004, and whose job code is 500. 
-- 
-- NOTE: Use logical operators to include all of the information given in this problem. 
-- Remember, if you are using MySQL, you may have to first disable “safe mode.”
--

/* YOUR SOLUTION HERE */
DELETE FROM EMP_1
WHERE EMP_LNAME = 'Smithfield'
    AND EMP_FNAME = 'William'
    AND EMP_HIREDATE = '2004-06-22'
    AND JOB_CODE = '500';
