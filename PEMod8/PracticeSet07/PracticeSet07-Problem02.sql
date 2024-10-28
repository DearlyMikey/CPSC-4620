-- ## Problem 2:
-- 
-- The House Development team wants a SQL script to add the following data to the HOUSE_EXTRA
-- table:
-- 
-- House ID	Extra ID
-- --------	--------
--    3	        1
--    3         2
-- 
-- However, they do not want this data in the database after they complete their operations. 
-- You need to create a transaction that makes the changes, but with a rollback rather than a
-- commit.  You will again need to update the autocommit flag in MySQL for this transaction TO
-- work properly.
-- 
-- MySQL automatically commits each line of command. Therefore, use this command:
-- 	SET autocommit = OFF;
-- to disable the auto commit feature....then start your  Then start your transaction, insert the
-- needed data AND commit it to the database.  You should then enable auto commit using:
-- 	SET autocommit = ON;
-- 
-- NOTE: You should test your results with a SELECT statement...
-- but don't include any test SQL in your submission.
-- 

/* YOUR SOLUTION HERE */
SET autocommit = OFF;
START TRANSACTION;
    INSERT INTO HOUSE_EXTRA (HouseID, ExtraID)
        VALUES
            ('3', '1');
    INSERT INTO HOUSE_EXTRA (HouseID, ExtraID)
        VALUES
            ('3','2');
ROLLBACK;
SET autocommit = ON;

