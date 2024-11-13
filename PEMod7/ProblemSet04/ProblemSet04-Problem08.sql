-- ## Problem 8
-- 
-- Write a query to display the number of different patrons who have ever checked out a book.
-- 
-- +-------------------+
-- | DIFFERENT PATRONS |
-- +-------------------+
-- |        33         |
-- +-------------------+

/* YOUR SOLUTION HERE */
SELECT
    COUNT(DISTINCT PAT_ID) AS 'DIFFERENT PATRONS'
FROM CHECKOUT

