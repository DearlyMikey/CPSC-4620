-- ## Problem 3:
-- The Owner Relationships team wants to track the active owners in the InstantStay system. 
-- The team requested a new table, called ACTIVE_OWNER which should have all the related 
-- information of the currently active owners currently.
-- 
-- You need a statement like
-- CREATE TABLE ACTIVE_OWNER (
-- 	...owner data...
-- ) AS SELECT ...owner data FROM OWNER
-- 	WHERE
-- 		how do we know an owner is active? 
-- 		
-- The results should look like:
-- 
-- +-----------+------------------+-----------------+--------------------+
-- |   OwnerID | OwnerFirstName   | OwnerLastName   | OwnerEmail         |
-- |-----------+------------------+-----------------+--------------------|
-- |         1 | Kaya             | Logan           | k.logan@xmail.com  |
-- |         2 | Ruth             | Gibbs           | r.gibbs@xmail.com  |
-- |         3 | Alberto          | Burke           | a.burke@xmail.com  |
-- |         4 | Kristen          | Jones           | k.jones@xmail.com  |
-- |         5 | Alec             | Webber          | a.webber@xmail.com |
-- +-----------+------------------+-----------------+--------------------+
-- 

/* YOUR SOLUTION HERE */
CREATE TABLE ACTIVE_OWNER AS
    SELECT
        OwnerID,
        OwnerFirstName,
        OwnerLastName,
        OwnerEmail
    FROM OWNER
WHERE OwnerEndDate IS NULL

