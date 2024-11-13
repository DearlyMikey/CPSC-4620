-- ## Problem 5
-- Write a query to display the number of books that are available (not currently checked out).
-- 
-- +-----------------+
-- | Available Books |
-- +-----------------+
-- |       14        |
-- +-----------------+

/* YOUR SOLUTION HERE */
SELECT COUNT(*) AS "Available Books"
FROM BOOK
WHERE BOOK_NUM NOT IN (
  SELECT BOOK_NUM
  FROM CHECKOUT
  WHERE CHECK_IN_DATE IS NULL
);