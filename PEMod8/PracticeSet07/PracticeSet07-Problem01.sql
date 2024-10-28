-- ## Problem 1:
-- 
-- The House Development team wants a SQL script to add multiple rows to the HOUSE_EXTRA table 
-- in a batch. You need to create a transaction, add the rows and finally commit the changes.
-- 
-- Add the following data to the HOUSE_EXTRA table:
-- House ID	Extra ID
-- --------	--------
--    2	        1
--    2         2
-- 
-- MySQL automatically commits each line of command. Therefore, use this command:
-- 	SET autocommit = OFF;
-- to disable the auto commit feature....then start your  Then start your transaction, insert the
-- needed data AND commit it to the database.  You should then enable auto commit using:
-- 	SET autocommit = ON;
-- 
-- 
-- NOTE: You should test your results with a SELECT statement...
-- but don't include any test SQL in your submission.

/* YOUR SOLUTION HERE */
SET autocommit = OFF;
START TRANSACTION;
    INSERT INTO HOUSE_EXTRA (HouseID, ExtraID)
        VALUES
            ('2', '1');
    INSERT INTO HOUSE_EXTRA (HouseID, ExtraID)
        VALUES
            ('2','2');
COMMIT;
SET autocommit = ON;

