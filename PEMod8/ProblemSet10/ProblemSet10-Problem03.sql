-- ## Problem 3
-- 
-- Create a stored procedure named prc_inv_amounts to update the INV_SUBTOTAL, INV_TAX, 
-- and INV_TOTAL. The procedure takes the invoice number as a parameter.
-- - INV_SUBTOTAL is the sum of the LINE_TOTAL amounts for the invoicein the LINE table
-- - INV_TAX is the product of the INV_SUBTOTAL and the tax rate (8%)
-- - INV_TOTAL is the sum of the INV_SUBTOTAL and the INV_TAX
-- 
-- Check your prodecure code by calling it with an invoice number and then verifying that 
-- the data in the INVOICE table are updated apprporiately.
-- 
-- Make sure you include the appropriate DELIMITER statements in your solution!
-- 

/* YOUR SOLUTION HERE */
DELIMITER $$

CREATE PROCEDURE prc_inv_amounts (
    IN p_INV_NUM INT
)
BEGIN
    DECLARE v_SUBTOTAL DECIMAL(10,2);
    DECLARE v_TAX DECIMAL(10,2);
    DECLARE v_TOTAL DECIMAL(10,2);
    DECLARE v_TAX_RATE DECIMAL(5,2) DEFAULT 0.08;

    SELECT SUM(LINE_TOTAL)
    INTO v_SUBTOTAL
    FROM LINE
    WHERE INV_NUMBER = p_INV_NUM;

    SET v_TAX = v_SUBTOTAL * v_TAX_RATE;

    SET v_TOTAL = v_SUBTOTAL + v_TAX;

    UPDATE INVOICE
    SET INV_SUBTOTAL = v_SUBTOTAL,
        INV_TAX = v_TAX,
        INV_TOTAL = v_TOTAL
    WHERE INV_NUMBER = p_INV_NUM;
END$$

DELIMITER ;

