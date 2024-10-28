-- ## Problem 6:
-- 
-- The House Development team wants to update the price of the liability insurance extra to 75 
-- and wants to remove the household insurance option. However, the team does not store the ExtraID
-- and wants to work with the ExtraDescription. 
-- 
-- Prepare the update script by temporarily inactivating the safe update feature of MySQL:
-- 	SET SQL_SAFE_UPDATES = 0; -- temporarily disable the safe update feature of MySQL
-- 	SET SQL_SAFE_UPDATES = 1; -- enable the safe update feature of MYSQL
-- The SQL_SAFE_UPDATES is intended to protect the database against accidental deletion of data.
-- 
-- NOTE: You should test your results with a SELECT statement...
-- but don't include any test SQL in your submission.
-- 

/* YOUR SOLUTION HERE */
SET SQL_SAFE_UPDATES = 0;
UPDATE EXTRA SET ExtraPrice = 75 WHERE ExtraDescription = 'Liability Insurance';
DELETE FROM EXTRA WHERE ExtraDescription = 'Household Insurance';
SET SQL_SAFE_UPDATES = 1;

