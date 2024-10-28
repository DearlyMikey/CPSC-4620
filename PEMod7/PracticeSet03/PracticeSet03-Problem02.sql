-- ## Problem 2:
-- 
-- The InstantStay Finance team requires average price per stay rounded to two decimal places for 
-- all the houses in the system. However, ensure that you do not include the cancelled stays with 
-- negative payment information.
-- 
-- +---------+---------+
-- | HouseID | Payment |
-- +---------+---------+
-- |    1    |  110.0  |
-- |    2    |  118.0  |
-- |    4    | 129.17  |
-- |    5    | 127.75  |
-- +---------+---------+

/* YOUR SOLUTION HERE */
SELECT
    HouseID,
    ROUND(AVG(StayPrice - (StayPrice * StayDiscount)), 2) as "Payment"
FROM STAY
WHERE StayPrice > 0
GROUP BY HouseID;