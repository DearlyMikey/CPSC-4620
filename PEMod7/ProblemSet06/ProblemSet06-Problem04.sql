-- ## Problem 04
-- 
-- Write a query to display the first name, last name, phone number, title, and department number 
-- of employees who work in department 300 or have the title “CLERK I.” Sort the output by last 
-- name and then by first name.
-- 
-- Your results should look like this:
-- +-------------+-------------+-------------+-----------------------+------------+
-- | EMP_FNAME   | EMP_LNAME   | EMP_PHONE   | EMP_TITLE             |   DEPT_NUM |
-- |-------------+-------------+-------------+-----------------------+------------|
-- | LAVINA      | ACEVEDO     | 862-6787    | ASSOCIATE             |        300 |
-- | LAUREN      | AVERY       | 550-2270    | SENIOR ASSOCIATE      |        300 |
-- | ROSALBA     | BAKER       | 632-8197    | ASSOCIATE             |        300 |
-- | FERN        | CARPENTER   | 735-4820    | PURCHASING SPECIALIST |        300 |
-- | LEEANN      | CLINTON     | 616-9615    | CLERK I               |        600 |
-- | TANIKA      | CRANE       | 449-6336    | PURCHASING SPECIALIST |        300 |
-- ...
-- | MERLE       | WATTS       | 406-3691    | SENIOR ASSOCIATE      |        300 |
-- | CHRISTINE   | WESTON      | 559-3041    | SENIOR ASSOCIATE      |        300 |
-- +-------------+-------------+-------------+-----------------------+------------+
-- 

/* YOUR SOLUTION HERE */
SELECT
    e.EMP_FNAME,
    e.EMP_LNAME,
    e.EMP_PHONE,
    e.EMP_TITLE,
    d.DEPT_NUM
FROM LGEMPLOYEE e
    JOIN LGDEPARTMENT d ON e.DEPT_NUM = d.DEPT_NUM
WHERE (d.DEPT_NUM = '300' OR e.EMP_TITLE = 'CLERK I')
ORDER BY EMP_LNAME, EMP_FNAME
