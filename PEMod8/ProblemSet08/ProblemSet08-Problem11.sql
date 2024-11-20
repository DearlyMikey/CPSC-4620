-- ## Problem 11
-- 
-- Using the EMP_2 table, write a single SQL command to change the EMP_PCT value to 10.00 for all
-- the employees who do not currently have a value for EMP_PCT.
--

/* YOUR SOLUTION HERE */
UPDATE EMP_2
SET EMP_PCT = '10.00'
WHERE EMP_PCT IS NULL

