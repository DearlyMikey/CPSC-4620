-- ## Problem 15
-- 
-- Write a procedure to delete an invoice, giving the invoice number as a parameter. 
-- Name the procedure prc_inv_delete. 
-- 
-- Test the procedure by calling the procedure with invoice numbers  8005 and 8006 
-- and verifying that the invoices have been removed from the INVOICE table.
--
-- Make sure you include the appropriate DELIMITER statements in your solution! 
-- 

/* YOUR SOLUTION HERE */
DELIMITER //
CREATE PROCEDURE prc_inv_delete (
    IN t_INV_NUM INT
)
BEGIN
    DELETE FROM INVOICE
        WHERE INV_NUM = t_INV_NUM;
END //

DELIMITER ;
