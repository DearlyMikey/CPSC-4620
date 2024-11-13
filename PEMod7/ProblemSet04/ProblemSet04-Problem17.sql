-- ## Problem 17
-- 
-- Write a query to display the author last name, first name, book title, and replacement cost 
-- for each book. Sort the results by book number and then author ID. (25 rows)
-- 
-- 
-- [NOTE: Your SQL does not need to center any result output.
--  Rows omitted from the target results for clarity.  
--  The autograder will check for  ALL required output.]
--  
-- +------------+------------+-----------------------------------------------------------------------+-------------+
-- | AU_LNAME   | AU_FNAME   | BOOK_TITLE                                                            |   BOOK_COST |
-- |------------+------------+-----------------------------------------------------------------------+-------------|
-- | Durante    | Reba       | Beginner's Guide to JAVA                                              |       59.95 |
-- | Walsh      | Neal       | Database in the Cloud                                                 |       79.95 |
-- | Reeves     | Benson     | Mastering the database environment                                    |       89.95 |
-- | Palca      | Julia      | Conceptual Programming                                                |       59.95 |
-- | Salvadore  | Carmine    | J++ in Mobile Apps                                                    |       49.95 |
-- | Paulsen    | Connie     | J++ in Mobile Apps                                                    |       49.95 |
-- | Sheel      | Lawrence   | J++ in Mobile Apps                                                    |       49.95 |
-- | Beatney    | Rachel     | iOS Programming                                                       |       79.95 |
-- | Paulsen    | Connie     | JAVA First Steps                                                      |       49.95 |
-- | McGill     | Rachel     | JAVA First Steps                                                      |       49.95 |
-- | Aggerwal   | Manish     | C# in Middleware Deployment                                           |       59.95 |
-- | Bruer      | Hugo       | DATABASES in Theory                                                   |      129.95 |
-- | Chiang     | Xia        | Cloud-based Mobile Applications                                       |       69.95 |
-- | Tankersly  | Trina      | Cloud-based Mobile Applications                                       |       69.95 |
-- | Lake       | Robert     | The Golden Road to Platform independence                              |      119.95 |
-- | Bruer      | Hugo       | Capture the Cloud                                                     |       69.95 |
-- | Lake       | Robert     | Shining Through the Cloud: Sun Programming                            |      109.95 |
-- | Salvadore  | Carmine    | What You Always Wanted to Know About Database, But Were Afraid to Ask |       49.95 |
-- | Chiang     | Xia        | Starlight Applications                                                |       69.95 |
-- | Walsh      | Neal       | Reengineering the Middle Tier                                         |       89.95 |
-- | Pearson    | Perry      | Reengineering the Middle Tier                                         |       89.95 |
-- | Paulsen    | Connie     | Thoughts on Revitalizing Ruby                                         |       59.95 |
-- | Chiang     | Xia        | Beyond the Database Veil                                              |       69.95 |
-- | Reeves     | Benson     | Virtual Programming for Virtual Environments                          |       79.95 |
-- | McGill     | Rachel     | Coding Style for Maintenance                                          |       49.95 |
-- +------------+------------+-----------------------------------------------------------------------+-------------+


/* YOUR SOLUTION HERE */
SELECT
    a.AU_LNAME,
    a.AU_FNAME,
    b.BOOK_TITLE,
    b.BOOK_COST
FROM AUTHOR a
    JOIN WRITES w on a.AU_ID = w.AU_ID
    JOIN BOOK b on w.BOOK_NUM = b.BOOK_NUM
ORDER BY b.BOOK_NUM, a.AU_ID
