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

