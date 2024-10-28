-- ## Problem 5:
-- 
-- The Owner Relationship team wants to ensure that there are no multiple active owners with the 
-- same first name, last name and email. To ensure this, you need to create a uniiquess CONSTRAINT 
-- on the ACTIVE_OWNER table (created in problem 3) to ensure the teams requirement.
-- 
-- You can verify your solution by trying to add a record to ACTIVE_OWNER where the owner's name
-- already exists in the table.
-- 

/* YOUR SOLUTION HERE */
ALTER TABLE ACTIVE_OWNER
ADD CONSTRAINT DuplicateCheck UNIQUE (OwnerFirstName,OwnerLastName,OwnerEmail)