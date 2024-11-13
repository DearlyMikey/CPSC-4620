-- ## Problem 4
-- Write a query to display the number of different book subjects in the FACT system.
-- 
-- +--------------------+
-- | Number of Subjects |
-- +--------------------+
-- |         4          |
-- +--------------------+

/* YOUR SOLUTION HERE */
SELECT
    COUNT(DISTINCT BOOK_SUBJECT) AS 'Number of Subjects'
FROM BOOK

