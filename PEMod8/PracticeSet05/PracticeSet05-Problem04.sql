-- ## Problem 4:
-- The owner relationship team wants to reduce the time required to access all the active owner
-- details. The team has highlighted the fact that it needs extra effort and time to fetch the 
-- customer information when they are only provided with the first name. The team is looking for a
-- solution to minimize the time required to fetch the required data.
-- 
-- In such case, you need to create an INDEX called NameSearch based on the first name and last name of the active owners (ie the index is needed on the table created in problem 3). 
-- 
-- Indexes make it easier to find rows in MySQL. Without an index, the MySQL engine will look for all the rows to find the searched items. 
-- 
-- You can use this command to access the MySQL metadata and check your soultion:
-- 		SHOW INDEX FROM ACTIVE_OWNER;
-- 
-- Just don't include thie command in your solution file!
-- 

/* YOUR SOLUTION HERE */
CREATE INDEX NameSearch ON ACTIVE_OWNER(OwnerFirstName,OwnerLastName)

