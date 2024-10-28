-- ## Problem 4:
-- 
-- The Marketing team wants to get all the houses in the system which are larger than the average 
-- in size. For the calculation, you will compare against the AVG of HouseSquareMeter for all 
-- the houses in InstantStay.
-- +---------+-------------------+--------------+--------------+------------+--------------------+------------------+----------------+---------------+--------------+---------+
-- | HouseID |   HouseAddress    |  HouseCity   | HouseZIPCode | HouseState | HouseNumberOfRooms | HouseSquareMeter | HouseBuildYear | HouseJoinDate | HouseEndDate | OwnerID |
-- +---------+-------------------+--------------+--------------+------------+--------------------+------------------+----------------+---------------+--------------+---------+
-- |    1    | 33 Southpoint Dr  |  Lancaster   |    14086     |     NY     |         4          |       150        |      2001      |  2024-03-10   |              |    1    |
-- |    3    |   3200 Price Rd   | Bartlesville |    74006     |     OK     |         4          |       150        |      2001      |  2024-08-02   |              |    3    |
-- |    4    | 12791 Amethyst St | Garden Grove |    92845     |     CA     |         6          |       210        |      1975      |  2024-08-15   |              |    4    |
-- +---------+-------------------+--------------+--------------+------------+--------------------+------------------+----------------+---------------+--------------+---------+

/* YOUR SOLUTION HERE */
SELECT
    HouseID,
    HouseAddress,
    HouseCity,
    HouseZIPCode,
    HouseState,
    HouseNumberOfRooms,
    HouseSquareMeter,
    HouseBuildYear,
    HouseJoinDate,
    HouseEndDate,
    OwnerID
FROM HOUSE
WHERE HouseSquareMeter > (SELECT AVG(HouseSquareMeter) FROM HOUSE)