-- ## Problem 6:
-- 
-- The Owner Relationship team wants to add a new owner 
-- 
-- First Name	Last Name	Email				Join Date
-- ----------	---------	-----				----------
-- Ece			Yilmaz		e.yilmaz@xmail.com	2024-07-28
-- 
-- However, they indicated that OwnerID field should be automatically incremented with each new
-- owner added to the system.  Alter the OWNER table so the OwnerID is automatically incremented.
-- 
-- The write the insert statment to add the new owner.
-- 
-- NOTE: You should test your results with a SELECT statement...
-- but don't include any test SQL in your submission.
--
ALTER TABLE OWNER MODIFY COLUMN OwnerID INT NOT NULL AUTO_INCREMENT;
INSERT INTO OWNER (OwnerFirstName, OwnerLastName, OwnerEmail, OwnerJoinDate)
VALUES
    ('Ece', 'Yilmaz', 'e.yilmaz@xmail.com', '2024-07-28');
