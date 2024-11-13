-- ## Problem 14
-- 
-- Write a query to display the book number, title with year, and subject for each book. 
-- Sort the results by the book number. (20 rows)
-- 
-- [NOTE: Your SQL does not need to center any result output.
--  Rows omitted from the target results for clarity.  
--  The autograder will check for  ALL required output.]
--  
-- +------------+------------------------------------------------------------------------------+----------------+
-- |   BOOK_NUM | BOOK                                                                         | BOOK_SUBJECT   |
-- |------------+------------------------------------------------------------------------------+----------------|
-- |       5235 | Beginner's Guide to JAVA (2018)                                              | Programming    |
-- |       5236 | Database in the Cloud (2018)                                                 | Cloud          |
-- |       5237 | Mastering the database environment (2019)                                    | Database       |
-- |       5238 | Conceptual Programming (2019)                                                | Programming    |
-- |       5239 | J++ in Mobile Apps (2019)                                                    | Programming    |
-- |       5240 | iOS Programming (2019)             BOO                                          | Programming    |
-- |       5241 | JAVA First Steps (2019)                                                      | Programming    |
-- |       5242 | C# in Middleware Deployment (2019)                                           | Middleware     |
-- |       5243 | DATABASES in Theory (2019)                                                   | Database       |
-- |       5244 | Cloud-based Mobile Applications (2019)                                       | Cloud          |
-- |       5245 | The Golden Road to Platform independence (2020)                              | Middleware     |
-- |       5246 | Capture the Cloud (2020)                                                     | Cloud          |
-- |       5247 | Shining Through the Cloud: Sun Programming (2020)                            | Programming    |
-- |       5248 | What You Always Wanted to Know About Database, But Were Afraid to Ask (2020) | Database       |
-- |       5249 | Starlight Applications (2020)                                                | Cloud          |
-- |       5250 | Reengineering the Middle Tier (2020)                                         | Middleware     |
-- |       5251 | Thoughts on Revitalizing Ruby (2020)                                         | Programming    |
-- |       5252 | Beyond the Database Veil (2020)                                              | Database       |
-- |       5253 | Virtual Programming for Virtual Environments (2020)                          | Programming    |
-- |       5254 | Coding Style for Maintenance (2021)                                          | Programming    |
-- +------------+------------------------------------------------------------------------------+----------------+

/* YOUR SOLUTION HERE */
SELECT
    BOOK_NUM,
    CONCAT(BOOK_TITLE, ' (', BOOK_YEAR, ')') AS 'BOOK',
    BOOK_SUBJECT
FROM BOOK
ORDER BY BOOK_NUM
