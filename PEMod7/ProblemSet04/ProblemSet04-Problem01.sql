-- ## Problem 1
-- 
-- Write a query to display the checkout number, book number, patron ID, checkout date, 
-- and due date for all checkouts that have not yet been returned. Sort the results by book number.
-- 
-- +-----------+----------+--------+----------------+----------------+
-- | CHECK_NUM | BOOK_NUM | PAT_ID | CHECK_OUT_DATE | CHECK_DUE_DATE |
-- +-----------+----------+--------+----------------+----------------+
-- |   91068   |   5238   |  1229  |   2021-05-24   |   2021-05-31   |
-- |   91053   |   5240   |  1212  |   2021-05-09   |   2021-05-16   |
-- |   91066   |   5242   |  1228  |   2021-05-19   |   2021-05-26   |
-- |   91061   |   5246   |  1172  |   2021-05-15   |   2021-05-22   |
-- |   91059   |   5249   |  1207  |   2021-05-10   |   2021-05-17   |
-- |   91067   |   5252   |  1229  |   2021-05-24   |   2021-05-31   |
-- +-----------+----------+--------+----------------+----------------+

/* YOUR SOLUTION HERE */
SELECT
    CHECK_NUM,
    BOOK_NUM,
    PAT_ID,
    CHECK_OUT_DATE,
    CHECK_DUE_DATE
FROM CHECKOUT
WHERE CHECK_IN_DATE IS NULL
ORDER BY BOOK_NUM
