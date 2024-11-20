-- ## Problem 8
-- 
-- Using the EMP_2 table, write the SQL code that will add the attributes EMP_PCT and PROJ_NUM to 
-- EMP_2. The EMP_PCT is the bonus percentage to be paid to each employee. The new attribute characteristics are:
-- 
-- 	EMP_PCT DECIMAL(4,2)  
-- 	PROJ_NUM CHAR(3)
-- 

/* YOUR SOLUTION HERE */
ALTER TABLE EMP_2
ADD EMP_PCT DECIMAL(4,2),
ADD PROJ_NUM CHAR(3)
