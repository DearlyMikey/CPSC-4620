-- ## Problem 7
-- 
-- Write a single SQL code to create a copy of table EMP_1 named EMP_2 and populate it
-- with all the data in EMP_1.
-- 
-- NOTE: You should test your results with a SELECT statement...
-- but don't include any test SQL in your submission.
--

/* YOUR SOLUTION HERE */
CREATE TABLE EMP_2 AS
SELECT * FROM EMP_1;


