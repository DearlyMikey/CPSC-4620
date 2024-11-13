-- ## Problem 2
-- 
-- Write a query to display the author ID, first name, last name, and year of birth for all authors.
-- Sort the results in descending order by year of birth, and then in ascending order by last name. 
-- 
-- +---------+------------+------------+----------------+
-- |   AU_ID | AU_FNAME   | AU_LNAME   |   AU_BIRTHYEAR |
-- |---------+------------+------------+----------------|
-- |     185 | Benson     | Reeves     |           1990 |
-- |     603 | Julia      | Palca      |           1988 |
-- |     438 | Perry      | Pearson    |           1986 |
-- |     581 | Manish     | Aggerwal   |           1984 |
-- |     218 | Rachel     | Beatney    |           1983 |
-- |     460 | Connie     | Paulsen    |           1983 |
-- |     394 | Robert     | Lake       |           1982 |
-- |     383 | Neal       | Walsh      |           1980 |
-- |     592 | Lawrence   | Sheel      |           1976 |
-- |     251 | Hugo       | Bruer      |           1972 |
-- |     273 | Reba       | Durante    |           1969 |
-- |     284 | Trina      | Tankersly  |           1961 |
-- |     262 | Xia        | Chiang     |                |
-- |     559 | Rachel     | McGill     |                |
-- |     229 | Carmine    | Salvadore  |                |
-- +---------+------------+------------+----------------+

/* YOUR SOLUTION HERE */
SELECT
    AU_ID,
    AU_FNAME,
    AU_LNAME,
    AU_BIRTHYEAR
FROM AUTHOR
ORDER BY AU_BIRTHYEAR DESC, AU_LNAME ASC
