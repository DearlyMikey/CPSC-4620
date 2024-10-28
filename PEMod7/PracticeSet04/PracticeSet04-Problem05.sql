-- ## Problem 5:
-- 
-- In addition, the House Development team wants to know the largest and average house in terms
-- of number of rooms for each state.
-- 
-- +------------+--------------+--------------+
-- | HouseState | LargestHouse | AverageHouse |
-- +------------+--------------+--------------+
-- |     NY     |      4       |    3.0000    |
-- |     IL     |      3       |    3.0000    |
-- |     OK     |      4       |    4.0000    |
-- |     CA     |      6       |    5.0000    |
-- |     MA     |      3       |    3.0000    |
-- |     MS     |      2       |    2.0000    |
-- +------------+--------------+--------------+

/* YOUR SOLUTION HERE */
SELECT
    HouseState,
    MAX(HouseNumberOfRooms) AS "LargestHouse",
    AVG(HouseNumberOfRooms) AS "AverageHouse"
FROM HOUSE
GROUP BY HouseState