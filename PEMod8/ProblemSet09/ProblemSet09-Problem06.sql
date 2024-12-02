-- ## Problem 6
-- 
-- Enable auto increment to generate values for invoice numbers. 
-- The values should start with the value 9000.
--

/* YOUR SOLUTION HERE */
ALTER TABLE INVOICE MODIFY INV_NUM INT AUTO_INCREMENT;
ALTER TABLE INVOICE
AUTO_INCREMENT=9000;
