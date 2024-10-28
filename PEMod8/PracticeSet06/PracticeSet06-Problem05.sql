-- ## Problem 5:
-- 
-- The Owner Relationship team realized that they do not need an OwnerStatus column in the
-- ACTIVE_OWNER table. The team want you to remove the column the from the table.
-- 
-- 

/* YOUR SOLUTION HERE */
ALTER TABLE ACTIVE_OWNER
DROP COLUMN OwnerStatus
