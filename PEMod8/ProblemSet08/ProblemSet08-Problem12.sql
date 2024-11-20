-- ## Problem 12
-- 
-- Using the EMP_2 table, write the SQL command to add .15 to the EMP_PCT of the employee whose
-- name is Maria D. Alonzo. (Use the employee name in your command to determine the correct
-- employee.)
-- 

/* YOUR SOLUTION HERE */
UPDATE EMP_2
SET EMP_PCT = EMP_PCT + .15
WHERE EMP_LNAME = 'Alonzo' AND EMP_INITIAL = 'D' AND EMP_FNAME = 'Maria'
