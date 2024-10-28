-- ## Problem 5:
-- 
-- The team also needs to ensure that an UPDATE to the owner's email is also stored in lowercase.
-- You should be able to use your INSERT trigger as a starting point.
-- Name your trigger "email_update".  You should be able to create this trgger with 1 SQL command.
-- 
-- Once created, you can verify that the trigger was created with this command
-- 	SHOW TRIGGERS;
-- 
-- To verify that the trigger is working, yoiu should update a record and look at the results.
-- Such as:
-- 
-- 	UPDATE OWNER SET OwnerEmail = 'ECE.YILMAZ@XMAIL.COM' WHERE OwnerID = 8;
-- 	SELECT OwnerEmail FROM OWNER WHERE OwnerID = 8;
-- 
-- If the trigger worked correctly, the owner email should look like:
-- +----------------------+
-- | OwnerEmail           |
-- |----------------------|
-- | ece.yilmaz@xmail.com |
-- +----------------------+

/* YOUR SOLUTION HERE */

