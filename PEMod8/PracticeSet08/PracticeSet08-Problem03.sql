-- ## Problem 3:
-- 
-- The InstantStay Developers team requested a SQL statement to collect the emails from the tables 
-- in the InstantStay database. Create a generic statement with the following script and execute it for testing:
-- 
-- MySql has the cabaility to set local variables that can be used during the current session.
-- A MySQL variable starts with an '@' symbol.  In the code below @table_name is set to a string
-- containg the name of the table.  The @OwnerEmailCollector variable will hold the results of the
-- CONCAT function call, which uses the @table_name variable.  Of course, this is not valid SQL, so
-- the PREPARE command compiles the variables into an executable SQL command.  Finally the EXECUTE 
-- command actually runs the compliled SQL.
-- 
-- 	SET @table_name:='OWNER';
-- 	SET @OwnerEmailCollector:=CONCAT('SELECT OwnerEmail FROM ',@table_name);
-- 	PREPARE Statement FROM @OwnerEmailCollector;
-- 	EXECUTE Statement;	
-- 
-- This is a great technique for development and testing, but shouldn't be used in production!
-- 
-- Copy and run these commands.  Your results should look like:
-- 
-- +---------------------+
-- | OwnerEmail          |
-- |---------------------|
-- | k.logan@xmail.com   |
-- | r.gibbs@xmail.com   |
-- | a.burke@xmail.com   |
-- | k.jones@xmail.com   |
-- | a.webber@xmail.au   |
-- | r.snow@xmail.com    |
-- | d.schmidt@xmail.com |
-- | e.yilmaz@xmail.com  |
-- +---------------------+

/* YOUR SOLUTION HERE */
SET @table_name:='OWNER';
SET @OwnerEmailCollector:=CONCAT('SELECT OwnerEmail FROM ',@table_name);
PREPARE Statement FROM @OwnerEmailCollector;
