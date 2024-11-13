-- ## Problem 11
-- 
-- Write a query to display the total value of all books in the library.
-- 
-- +---------------+
-- | Library Value |
-- +---------------+
-- |    1499.00    |
-- +---------------+

/* YOUR SOLUTION HERE */
SELECT
    SUM(BOOK_COST) as 'Library Value'
FROM BOOK