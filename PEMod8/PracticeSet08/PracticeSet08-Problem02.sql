-- ## Problem 2:
-- 
-- The InstantStay Marketing team wants to create guest levels such as GOLD, BRONZE and NEW.
-- The team will use these levels to provide additional campaigns and discounts. The team requested
-- a stored function named GuestStaus that will use the stay count to calculate the geust's level.
-- 
-- Return the guest level as follows:
-- 	GOLD when the user has more than 2 stays
-- 	BRONZE when then use has 1 or 2 stays
-- 	NEW when the user has no previous stays
-- 
-- The function should take an integer GuestID as input and return a string.
-- 
-- Once created, you should test it by calling the function in a SELECT statment:
-- 	SELECT GuestID, GuestStatus(GuestID) FROM GUEST;
-- 	
-- Your results should look like this:
-- +-----------+------------------------+
-- |   GuestID | GuestStatus(GuestID)   |
-- |-----------+------------------------|
-- |         1 | BRONZE                 |
-- |         2 | BRONZE                 |
-- |         3 | GOLD                   |
-- |         4 | NEW                    |
-- |         5 | NEW                    |
-- |         6 | NEW                    |
-- |         7 | BRONZE                 |
-- |         8 | NEW                    |
-- |         9 | NEW                    |
-- |        10 | NEW                    |
-- |        11 | NEW                    |
-- |        12 | NEW                    |
-- +-----------+------------------------+

/* YOUR SOLUTION HERE */
CREATE FUNCTION GuestStatus(
    GuestID int
)
RETURNS VARCHAR(10) DETERMINISTIC
BEGIN
    SELECT COUNT(GuestID) FROM GUEST GROUP BY GuestID;

END;
