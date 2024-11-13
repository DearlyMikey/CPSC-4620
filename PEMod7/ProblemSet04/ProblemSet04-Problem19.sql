-- ## Problem 19
-- Write a query to display the patron ID, full name (first and last), and patron type for all 
-- patrons. Sort the results by patron type and then by last name and first name. 
-- Ensure that all sorting is case insensitive. (50 rows)
-- 
-- [NOTE: Your SQL does not need to center any result output.
--  Rows omitted from the target results for clarity.  
--  The autograder will check for  ALL required output.]
-- 
-- +----------+--------------------+------------+
-- |   PAT_ID | NAME               | PAT_TYPE   |
-- |----------+--------------------+------------|
-- |     1165 | Cedric Baldwin     | Faculty    |
-- |     1170 | Cory Barry         | faculty    |
-- |     1160 | robert carter      | Faculty    |
-- |     1183 | Helena Hughes      | Faculty    |
-- |     1161 | Kelsey Koch        | Faculty    |
-- |     1167 | Alan Martin        | FACULTY    |
-- |     1166 | Vera Alvarado      | Student    |
-- |     1202 | Holly Anthony      | Student    |
-- |     1180 | Nadine Blair       | STUDENT    |
-- ... rows ommitted...
-- |     1203 | Tyler Pope         | STUDENT    |
-- |     1207 | Iva Ramos          | Student    |
-- |     1244 | Leon Richmond      | Student    |
-- |     1213 | Desiree Rivas      | Student    |
-- |     1218 | Angel Terrell      | Student    |
-- |     1200 | Lorenzo Torres     | Student    |
-- |     1241 | Irene West         | Student    |
-- |     1185 | Sandra Yang        | student    |
-- +----------+--------------------+------------+

/* YOUR SOLUTION HERE */
SELECT
    PAT_ID,
    CONCAT(PAT_FNAME, ' ', PAT_LNAME) AS 'Name',
    PAT_TYPE
FROM PATRON
ORDER BY PAT_TYPE, PAT_LNAME, PAT_FNAME