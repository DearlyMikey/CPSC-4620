-- ## Problem 20
-- 
-- Write a query to display the book number and the number of times each book has been checked out. 
-- Do not include books that have never been checked out. Sort the results by the number of times
-- checked out in descending order and then by book number in descending order.
-- 
-- +----------+-------------------+
-- | BOOK_NUM | Times Checked Out |
-- +----------+-------------------+
-- |   5236   |        12         |
-- |   5235   |         9         |
-- |   5240   |         7         |
-- |   5238   |         6         |
-- |   5237   |         5         |
-- |   5254   |         4         |
-- |   5252   |         4         |
-- |   5249   |         4         |
-- |   5246   |         4         |
-- |   5244   |         4         |
-- |   5242   |         4         |
-- |   5248   |         3         |
-- |   5243   |         2         |
-- +----------+-------------------+

/* YOUR SOLUTION HERE */
SELECT
    BOOK_NUM,
    COUNT(CHECK_OUT_DATE) AS 'Times Checked Out'
FROM CHECKOUT
GROUP BY BOOK_NUM
ORDER BY COUNT(CHECK_OUT_DATE) DESC, BOOK_NUM DESC