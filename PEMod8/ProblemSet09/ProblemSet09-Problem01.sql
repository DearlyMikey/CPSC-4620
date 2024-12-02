-- ## Problem 1
-- 
-- Create the CUSTOMER table structure shown in the ProblemSet09 ERD:
-- - The customer number should store integer values. 
-- - The CUST_FNAME and CUST_LNAME attributes should support variable length character data 
--   up to 30 characters each. 
-- - The CUST_BALANCE should support up to eight digits on the left of the decimal place and
--   two digits to the right of the decimal place. 
-- - Use CUST_NUM as the primary key.
--

/* YOUR SOLUTION HERE */
CREATE TABLE CUSTOMER (
    CUST_NUM INT PRIMARY KEY,
    CUST_LNAME VARCHAR(30) NULL,
    CUST_FNAME VARCHAR(30) NULL,
    CUST_BALANCE DECIMAL(10,2) NULL
)