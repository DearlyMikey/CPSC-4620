-- ## Problem 5
-- 
-- During the guest user analysis, developers realized there could be duplicate users in the 
-- system. Check for the guests with the same name but different GUESTIDs to check whether 
-- they are duplicate or not.
-- 
-- +---------+----------------+---------------+-------------------+--------------+
-- | GUESTID | GUESTFIRSTNAME | GUESTLASTNAME |    GuestEmail     | DUP Guest ID |
-- +---------+----------------+---------------+-------------------+--------------+
-- |   12    |     Ronald     |     Oneil     | r.oneil@tmail.com |      7       |
-- |   11    |      Jada      |     Swan      | j.swan@tmail.com  |      9       |
-- |    9    |      Jada      |     Swan      | j.swan@xmail.com  |      11      |
-- |    7    |     Ronald     |     Oneil     | r.oneil@xmail.com |      12      |
-- +---------+----------------+---------------+-------------------+--------------+

/* YOUR SOLUTION HERE */
SELECT
    g1.GUESTID AS "GuestID",
    g1.GUESTFIRSTNAME AS "GuestFirstName",
    g1.GUESTLASTNAME AS "GuestLastName",
    g1.GUESTEMAIL AS "GuestEmail",
    g2.GUESTID AS "DUP Guest ID"
FROM Guest g1
JOIN Guest g2
    ON g1.GUESTFIRSTNAME = g2.GUESTFIRSTNAME
    AND g1.GUESTLASTNAME = g2.GUESTLASTNAME
    AND g1.GUESTID <> g2.GUESTID

