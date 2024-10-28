-- ## Problem 3:
-- 
-- The InstantStay Finance team wants to collect all Stay IDs with the price, discount and 
-- channel commission rate.
-- 
-- +--------+-----------+--------------+-------------------+
-- | StayID | StayPrice | StayDiscount | ChannelCommission |
-- +--------+-----------+--------------+-------------------+
-- |   1    |   110.0   |     0.0      |        0.0        |
-- |   2    |   110.0   |     0.0      |        0.0        |
-- |   3    |   110.0   |     0.0      |        0.0        |
-- |   4    |   110.0   |     0.0      |        0.0        |
-- |   5    |   130.0   |     0.1      |       0.07        |
-- |   6    |   140.0   |     0.15     |       0.07        |
-- |   7    |  -120.5   |     0.0      |       0.07        |
-- |   8    |   150.0   |     0.15     |       0.13        |
-- |   9    |   160.0   |     0.2      |       0.13        |
-- |   10   |   125.0   |     0.2      |       0.15        |
-- |   11   |   125.0   |     0.3      |       0.15        |
-- |   12   |  -130.25  |     0.3      |       0.15        |
-- |   13   |   200.0   |     0.0      |       0.15        |
-- +--------+-----------+--------------+-------------------+

/* YOUR SOLUTION HERE */
SELECT
    StayID,
    StayPrice,
    StayDiscount,
    channel.ChannelCommission
FROM stay left join channel on stay.ChannelID = channel.ChannelID