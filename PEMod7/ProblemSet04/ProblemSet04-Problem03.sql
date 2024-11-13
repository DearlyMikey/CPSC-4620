-- ## Problem 3
-- 
-- Write a query to display the number of books in the FACT system.
-- 
-- +-----------------+
-- | Number of Books |
-- +-----------------+
-- |       20        |
-- +-----------------+

/* YOUR SOLUTION HERE */
SELECT
    COUNT(BOOK_NUM) AS 'Number of Books'
FROM BOOK

