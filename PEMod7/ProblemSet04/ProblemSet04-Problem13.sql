-- ## Problem 13
-- 
-- Write a query to display the patron ID, patron full name, and patron type for each patron sorted 
-- by patron ID. (50 rows)
-- 
-- [NOTE: Rows omitted from the target results for clarity.  
--  The autograder will check for  ALL required output.]
--  
-- +----------+--------------------+------------+
-- |   PAT_ID | Patron Name        | PAT_TYPE   |
-- |----------+--------------------+------------|
-- |     1160 | robert carter      | Faculty    |
-- |     1161 | Kelsey Koch        | Faculty    |
-- |     1165 | Cedric Baldwin     | Faculty    |
-- |     1166 | Vera Alvarado      | Student    |
-- |     1167 | Alan Martin        | FACULTY    |
-- |     1170 | Cory Barry         | faculty    |
-- |     1171 | Peggy Marsh        | STUDENT    |
-- |     1172 | Tony Miles         | STUDENT    |
-- |     1174 | Betsy Malone       | STUDENT    |
-- |     1180 | Nadine Blair       | STUDENT    |
-- |     1181 | Allen Horne        | Student    |
-- ... rows ommitted...
-- |     1241 | Irene West         | Student    |
-- |     1242 | Mario King         | Student    |
-- |     1243 | Roberto Kennedy    | Student    |
-- |     1244 | Leon Richmond      | Student    |
-- +----------+--------------------+------------+

/* YOUR SOLUTION HERE */
SELECT
    PAT_ID,
    CONCAT(PAT_FNAME, ' ', PAT_LNAME) AS 'Patron Name',
    PAT_TYPE
FROM PATRON
ORDER BY PAT_ID
