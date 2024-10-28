-- ## Problem 5:
-- 
-- The Owner Relationship team wants to update the email of the active owner whose ID is 5
-- with a new address a.webber@xmail.au
-- 
-- The view created previously is updatable, meaning it can be used to update the underlying
-- base table.  Write an UPDATE statement to change the email address for owner #5.
-- 
-- NOTE: You should test your results with a SELECT statement...
-- but don't include any test SQL in your submission.

/* YOUR SOLUTION HERE */
UPDATE ACTIVE_OWNER
SET OwnerEmail = 'a.webber@xmail.au'
WHERE OwnerID = 5
