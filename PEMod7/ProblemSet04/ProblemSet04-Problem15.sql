-- ## Problem 15
-- 
-- Write a query to display the author last name, author first name, and book number for each 
-- book written by that author. Sort the results by author last name, first name, and then book 
-- number. (25 rows)
-- 
-- +------------+------------+------------+
-- | AU_LNAME   | AU_FNAME   |   BOOK_NUM |
-- |------------+------------+------------|
-- | Aggerwal   | Manish     |       5242 |
-- | Beatney    | Rachel     |       5240 |
-- | Bruer      | Hugo       |       5243 |
-- | Bruer      | Hugo       |       5246 |
-- | Chiang     | Xia        |       5244 |
-- | Chiang     | Xia        |       5249 |
-- | Chiang     | Xia        |       5252 |
-- | Durante    | Reba       |       5235 |
-- | Lake       | Robert     |       5245 |
-- | Lake       | Robert     |       5247 |
-- | McGill     | Rachel     |       5241 |
-- | McGill     | Rachel     |       5254 |
-- | Palca      | Julia      |       5238 |
-- | Paulsen    | Connie     |       5239 |
-- | Paulsen    | Connie     |       5241 |
-- | Paulsen    | Connie     |       5251 |
-- | Pearson    | Perry      |       5250 |
-- | Reeves     | Benson     |       5237 |
-- | Reeves     | Benson     |       5253 |
-- | Salvadore  | Carmine    |       5239 |
-- | Salvadore  | Carmine    |       5248 |
-- | Sheel      | Lawrence   |       5239 |
-- | Tankersly  | Trina      |       5244 |
-- | Walsh      | Neal       |       5236 |
-- | Walsh      | Neal       |       5250 |
-- +------------+------------+------------+

/* YOUR SOLUTION HERE */
SELECT
    a.AU_LNAME,
    a.AU_FNAME,
    w.BOOK_NUM
FROM AUTHOR a JOIN WRITES w ON a.AU_ID = w.AU_ID
ORDER BY AU_LNAME, AU_FNAME, BOOK_NUM