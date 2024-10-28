-- ## Problem 7:
-- 
-- In addition, the InstantStay Marketing team wants to create a word cloud from the cities of the houses. They want to learn the number of characters in the longest city name.
-- 
-- 
-- +------------------------+
-- | MAX(LENGTH(HouseCity)) |
-- +------------------------+
-- |           12           |
-- +------------------------+

/* YOUR SOLUTION HERE */
SELECT
    MAX(LENGTH(HouseCity))
FROM HOUSE