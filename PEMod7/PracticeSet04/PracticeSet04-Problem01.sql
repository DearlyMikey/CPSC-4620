-- ## Problem 1:
-- 
-- The InstantStay House Development team works on the houses and the coverage of InstantStay 
-- over the world. They require a detailed analysis on the count of houses in the InstantStay. 
-- To start with, they require the count of houses based in each state in a descending order.
-- 
-- +------------+----------------+
-- | HouseState | COUNT(HouseID) |
-- +------------+----------------+
-- |     NY     |       2        |
-- |     CA     |       2        |
-- |     IL     |       1        |
-- |     OK     |       1        |
-- |     MA     |       1        |
-- |     MS     |       1        |
-- +------------+----------------+

/* YOUR SOLUTION HERE */
SELECT
    HouseState,
    Count(HouseID)
FROM HOUSE
GROUP BY HouseState
ORDER BY COUNT(HouseID) DESC