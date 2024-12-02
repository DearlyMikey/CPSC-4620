-- ## Problem 12
-- 
-- Write a procedure named prc_cust_add to add a new customer to the CUSTOMER table. 
-- The procedure must have parameters of the appropriate types for fields CUST_NUM, 
-- CUST_LNAME, CUST_FNAME, and CUST_BALANCE.
-- 
-- Test the procedure by calling it with following values:
-- 
-- +------------+--------------+--------------+----------------+
-- |   CUST_NUM | CUST_LNAME   | CUST_FNAME   |   CUST_BALANCE |
-- |------------+--------------+--------------+----------------+
-- |       1002 | Rauthor      | Peter        |        1351.83 |
-- +------------+--------------+--------------+----------------+
-- 
-- Note: You should execute the procedure and verify that the new customer was added to ensure your code is correct!
-- 
-- Make sure you include the appropriate DELIMITER statements in your solution! 
-- 

/* YOUR SOLUTION HERE */

DELIMITER //
CREATE PROCEDURE prc_cust_add (
    IN t_CUST_NUM INT,
    IN t_CUST_LNAME VARCHAR(30),
    IN t_CUST_FNAME VARCHAR(30),
    IN t_CUST_BALANCE DECIMAL(10,2)
)
BEGIN
    INSERT INTO CUSTOMER (CUST_NUM, CUST_LNAME, CUST_FNAME, CUST_BALANCE)
        VALUES (t_CUST_NUM,t_CUST_LNAME,t_CUST_FNAME,t_CUST_BALANCE);
END //

DELIMITER ;



