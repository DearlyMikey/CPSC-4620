-- ## Problem 2:
-- 
-- In addition, House Development team wants the same information (as mentioned in the Problem 1) 
-- along with the city, state level details.
-- 
-- +------------+--------------+----------------+
-- | HouseState |  HouseCity   | COUNT(HouseID) |
-- +------------+--------------+----------------+
-- |     NY     |  Lancaster   |       1        |
-- |     IL     | Libertyville |       1        |
-- |     OK     | Bartlesville |       1        |
-- |     CA     | Garden Grove |       1        |
-- |     NY     |   Endicott   |       1        |
-- |     CA     |  Morro Bay   |       1        |
-- |     MA     |    Hadley    |       1        |
-- |     MS     |   Meridian   |       1        |
-- +------------+--------------+----------------+

/* YOUR SOLUTION HERE */
SELECT
    HouseState,
    HouseCity,
    COUNT(HouseID)
FROM HOUSE
GROUP BY HouseState, HouseCity
ORDER BY COUNT(HouseID) DESC