-- ## Problem 9:
-- 
-- The team wants to create specialized entry mats to the houses using the initials of owners. 
-- The team needs the first letter of the first name and last name owners in upper case.
-- 
-- +-----------+-----------+
-- | initial_1 | initial_2 |
-- +-----------+-----------+
-- |     K     |     L     |
-- |     R     |     G     |
-- |     A     |     B     |
-- |     K     |     J     |
-- |     A     |     W     |
-- |     R     |     S     |
-- |     D     |     S     |
-- +-----------+-----------+

/* YOUR SOLUTION HERE */
SELECT
    UPPER(LEFT(OwnerFirstName, 1)) AS "initial_1",
    UPPER(LEFT(OwnerLastName, 1)) AS "initial_2"
FROM OWNER