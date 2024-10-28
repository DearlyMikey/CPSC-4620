-- ## Problem 4:
-- 
-- In a case wherein guests are canceling the reservations or altering their stay days, 
-- the respective reimbursements and cancellations payments are reflected with negative 
-- prices in the reservation tables. The InstantStay Finance team requires the list of Stay IDs,
-- GuestIDs, and the positive dollar amount rounded up to the nearest whole number.
-- 
-- +--------+---------+----------------------+
-- | StayID | GuestID | CEIL(ABS(StayPrice)) |
-- +--------+---------+----------------------+
-- |   7    |    6    |        121.0         |
-- |   12   |    3    |        131.0         |
-- +--------+---------+----------------------+

/* YOUR SOLUTION HERE */
SELECT
    StayID,
    GuestID,
    CEIL(ABS(StayPrice))
FROM stay
WHERE stay.StayPrice < 0