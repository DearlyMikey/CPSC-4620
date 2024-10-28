-- ## Problem 6:
-- The House Development team considered that the extras for the houses should not be free. 
-- Therefore, they want to extend their EXTRA table (created in problem 1) to include the pricing
-- information. Change the EXTRAtable to include a float field names ExtraPrice.
--  
--  You can use these command to access the MySQL metadata and check your soultion.
-- 		DESCRIBE TABLE EXTRA;	
-- 		SHOW COLUMNS FROM EXTRA;
-- 
-- Just don't include these commands in your solution file!
--

/* YOUR SOLUTION HERE */
ALTER TABLE EXTRA ADD (ExtraPrice FLOAT)
