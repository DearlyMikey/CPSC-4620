-- ## Problem 10
-- 
-- Using the EMP_2 table, write a single SQL command to change the EMP_PCT value to 5.00 for 
-- the people with employee numbers 101, 105, and 107.
--

/* YOUR SOLUTION HERE */
UPDATE EMP_2
SET EMP_PCT = '5.00'
WHERE EMP_NUM IN ('101','105','107')
