-- ## Problem 3:
-- 
-- The InstantStay Marketing team wants to learn the apartment that have more than average number 
-- of stays.
-- 
-- +---------+-------+
-- | HouseID | Stays |
-- +---------+-------+
-- |    1    |   4   |
-- |    4    |   4   |
-- +---------+-------+

/* YOUR SOLUTION HERE */
SELECT
    HouseID,
    Stays
FROM (SELECT STAY.HouseID, COUNT(*) as 'Stays'
      FROM STAY
      GROUP BY
          STAY.HouseID) as HouseStays
WHERE Stays > (SELECT AVG(StaysAvg)
               FROM (SELECT COUNT(*) AS StaysAvg
                     FROM STAY
                     GROUP BY HouseID) AS AverageStays);