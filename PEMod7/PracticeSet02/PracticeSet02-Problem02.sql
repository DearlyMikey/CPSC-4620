-- ## Problem 2:
-- 
-- The InstantStay Legal team requires all house owner's first and last names along with 
-- their house ids and addresses. 
-- 
-- Collect the information from HOUSE and OWNER tables and return in a consolidated way.
-- 
-- +----------------+---------------+---------+-------------------+--------------+--------------+------------+
-- | OwnerFirstName | OwnerLastName | HouseID |   HouseAddress    |  HouseCity   | HouseZIPCode | HouseState |
-- +----------------+---------------+---------+-------------------+--------------+--------------+------------+
-- |      Kaya      |     Logan     |    1    | 33 Southpoint Dr  |  Lancaster   |    14086     |     NY     |
-- |      Ruth      |     Gibbs     |    2    | 204 Garfield Ave  | Libertyville |    60048     |     IL     |
-- |    Alberto     |     Burke     |    3    |   3200 Price Rd   | Bartlesville |    74006     |     OK     |
-- |    Kristen     |     Jones     |    4    | 12791 Amethyst St | Garden Grove |    92845     |     CA     |
-- |    Kristen     |     Jones     |    6    |   505 Dawson St   |  Morro Bay   |    93442     |     CA     |
-- |      Alec      |    Webber     |    5    | 100 Cleveland Ave |   Endicott   |    13760     |     NY     |
-- |     Ronald     |     Snow      |    7    |  20 Woodlawn Rd   |    Hadley    |    01035     |     MA     |
-- |     Donald     |    Schmidt    |    8    |   2402 13th St    |   Meridian   |    39301     |     MS     |
-- +----------------+---------------+---------+-------------------+--------------+--------------+------------+

/* YOUR SOLUTION HERE */
SELECT
    o.OwnerFirstName,
    o.OwnerLastName,
    h.HouseID,
    h.HouseAddress,
    h.HouseCity,
    h.HouseZIPCode,
    h.HouseState
FROM OWNER as o join HOUSE as h on o.OwnerID = h.OwnerID