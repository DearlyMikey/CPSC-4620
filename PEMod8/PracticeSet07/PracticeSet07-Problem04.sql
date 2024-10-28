-- ## Problem 4:
-- 
-- The Owner Relationship team requested to work with a VIEW for active owners (to replace the 
-- table previously deleted). Create a VIEW with the name ACTIVE_OWNER from the table OWNER 
-- for the owners where the end date is NULL (ie for active owners).  The view should contain
-- only the Owner ID, First Name, Last Name, and email address.
-- 
-- NOTE: You should test your results with a SELECT statement...
-- but don't include any test SQL in your submission.
-- 

/* YOUR SOLUTION HERE */
CREATE VIEW ACTIVE_OWNER AS
    SELECT
        OwnerID,
        OwnerFirstName,
        OwnerLastName,
        OwnerEmail
    FROM OWNER
    WHERE OwnerEndDate IS NULL;

