-- ## Problem 2:
-- 
-- The Owner Relationship team requested a constraint on the first names and last names of the 
-- active users. The team does not want dummy owner names with only 1 letter in the system, 
-- therefore, you need to alter the ACTIVE_OWNER table and add a check constraint to enforce the
-- restriction.
-- 
-- NOTE: You can test your constraint by attempting to insert data into the table that 
-- violates the constraint...but don't include any test SQL in your submission.
-- 

/* YOUR SOLUTION HERE */
ALTER TABLE ACTIVE_OWNER
ADD CONSTRAINT CHECK (LENGTH(OwnerFirstName) > 1 AND LENGTH(OwnerLastName) > 1);