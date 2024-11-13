-- ## Problem 9
-- 
-- Write a query to display the subject and the number of books in each subject. Sort the results 
-- by the number of books in descending order and then by subject name in ascending order.
-- 
-- +----------------+--------------------+
-- | BOOK_SUBJECT   |   Books In Subject |
-- |----------------+--------------------|
-- | Programming    |                  9 |
-- | Cloud          |                  4 |
-- | Database       |                  4 |
-- | Middleware     |                  3 |
-- +----------------+--------------------+

/* YOUR SOLUTION HERE */
SELECT
    BOOK_SUBJECT,
    COUNT(BOOK_SUBJECT) AS 'Books In Subject'
FROM BOOK
GROUP BY BOOK_SUBJECT
ORDER BY COUNT(BOOK_SUBJECT) DESC, BOOK_SUBJECT ASC
