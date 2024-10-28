-- ## Problem 6:
-- 
-- The InstantStay Marketing team is planning to create some maps to show the coverage of InstantStay
-- throughout the country. 
-- 
-- Therefore, they need alist of the distinct zipcodes for all the houses.
-- 
-- +--------------+
-- | HouseZIPCode |
-- +--------------+
-- |    14086     |
-- |    60048     |
-- |    74006     |
-- |    92845     |
-- |    13760     |
-- |    93442     |
-- |    01035     |
-- |    39301     |
-- +--------------+

/* YOUR SOLUTION HERE */
SELECT
    DISTINCT(HouseZIPCode) AS "HouseZIPCode"
FROM HOUSE