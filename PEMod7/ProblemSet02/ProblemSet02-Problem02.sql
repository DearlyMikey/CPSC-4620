-- ## Problem 2
-- 
-- Write a query to count the number of customers with a balance of more than $500.
-- 
-- +----------+
-- | COUNT(*) |
-- +----------+
-- |    2     |
-- +----------+
-- 
/* YOUR SOLUTION HERE */
SELECT
    COUNT(*)
FROM CUSTOMER
WHERE CUS_BALANCE > 500