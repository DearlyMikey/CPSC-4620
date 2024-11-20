-- ## Problem 9
-- 
-- Using the EMP_2 table, write the SQL code to change the EMP_PCT value to 3.85 for 
-- the person whose employee number (EMP_NUM) is 103.
-- 

/* YOUR SOLUTION HERE */
UPDATE EMP_2
SET EMP_PCT = '3.85'
WHERE EMP_NUM = '103'
