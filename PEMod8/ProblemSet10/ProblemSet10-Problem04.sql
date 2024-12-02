-- ## Problem 4
-- 
-- Create a procedure named prc_cus_balance_update that will take the invoice number 
-- as a parameter and update the customer balance.
-- 
-- Hint: You can use DECLARE to define a TOTINV numeric variable that holds the computed 
-- invoice total.
-- 
-- Check your prodecure code by calling it with an invoice number and then verifying that 
-- the data in the CUSTOMER table are updated apprporiately.  You will need to use your
-- prc_inv_amounts procedure to make sure things work correctly!
-- 
-- Make sure you include the appropriate DELIMITER statements in your solution!
-- 

/* YOUR SOLUTION HERE */
DELIMITER $$

CREATE PROCEDURE prc_cus_balance_update (
    IN p_INV_NUM INT
)
BEGIN
    DECLARE v_TOTINV DECIMAL(10,2);

    CALL prc_inv_amounts(p_INV_NUM);

    SELECT INV_TOTAL
    INTO v_TOTINV
    FROM INVOICE
    WHERE INV_NUMBER = p_INV_NUM;

    UPDATE CUSTOMER
    SET CUS_BALANCE = CUS_BALANCE + v_TOTINV
    WHERE CUS_CODE = (
        SELECT CUS_CODE
        FROM INVOICE
        WHERE INV_NUMBER = p_INV_NUM
    );
END$$

DELIMITER ;


