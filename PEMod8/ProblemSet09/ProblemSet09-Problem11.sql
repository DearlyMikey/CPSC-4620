-- ## Problem 11
-- 
-- Create a MySQL trigger named trg_updatecustbalance to update the CUST_BALANCE 
-- in the CUSTOMER table when a new invoice record is entered.
-- 
-- Whatever value appears in the INV_AMOUNT column of the new invoice should be added to 
-- the customer’s balance. 
-- 
-- Test the trigger using the following new INVOICE record, which would add 225.40 to the 
-- balance of customer 1001:
-- 
-- +-----------+------------+------------+--------------+
-- |   INV_NUM |   CUST_NUM | INV_DATE   |   INV_AMOUNT |
-- |-----------+------------+------------+--------------|
-- |      8005 |       1001 | 2022-04-27 |      225.40  |
-- +-----------+------------+------------+--------------+
-- 
-- Make sure you include the appropriate DELIMITER statements in your solution! 
-- 

/* YOUR SOLUTION HERE */
DELIMITER //
CREATE TRIGGER trg_updatecustbalance
    AFTER INSERT ON INVOICE
    FOR EACH ROW
    BEGIN
        UPDATE CUSTOMER
        SET CUST_BALANCE = CUST_BALANCE + NEW.INV_AMOUNT
        WHERE CUST_NUM = NEW.CUST_NUM;
END //
DELIMITER ;
