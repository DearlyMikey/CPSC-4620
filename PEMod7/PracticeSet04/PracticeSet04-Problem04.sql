-- ## Problem 4:
-- 
-- The House Development team also requires to calculate the total number of rooms available 
-- in each state.
-- 
-- +------------+-------------------+
-- | HouseState | TotalAvailability |
-- +------------+-------------------+
-- |     NY     |         6         |
-- |     IL     |         3         |
-- |     OK     |         4         |
-- |     CA     |        10         |
-- |     MA     |         3         |
-- |     MS     |         2         |
-- +------------+-------------------+

/* YOUR SOLUTION HERE */
SELECT
    HouseState,
    SUM(HouseNumberOfRooms) AS "TotalAvailability"
FROM HOUSE
GROUP BY HouseState