-- ## Problem 14
-- 
-- Write a trigger to update the CUST_BALANCE when an invoice is deleted. 
-- Name the trigger trg_updatecustbalance2.
-- 
-- You should delete INV_NUM 9006 from INVOICE and look at results for the customer
-- data associated with that invoice to to ensure your code is correct.
--
-- Make sure you include the appropriate DELIMITER statements in your solution! 
-- 

/* YOUR SOLUTION HERE */
DELIMITER //
CREATE TRIGGER trg_updatecustbalance2
    AFTER DELETE
    ON INVOICE
    FOR EACH ROW
    BEGIN
        UPDATE CUSTOMER
        SET CUST_BALANCE = CUST_BALANCE - OLD.INV_AMOUNT
        WHERE CUST_NUM = OLD.CUST_NUM;
END //

DELIMITER ;
