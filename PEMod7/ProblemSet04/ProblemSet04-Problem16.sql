-- ## Problem 16
-- 
-- Write a query to display the author ID, book number, title, and subject for each book. 
-- Sort the results by book number and then author ID. (25 rows)
-- 
-- [NOTE: Your SQL does not need to center any result output.]
--  
-- +---------+------------+-----------------------------------------------------------------------+----------------+
-- |   AU_ID |   BOOK_NUM | BOOK_TITLE                                                            | BOOK_SUBJECT   |
-- |---------+------------+-----------------------------------------------------------------------+----------------|
-- |     273 |       5235 | Beginner's Guide to JAVA                                              | Programming    |
-- |     383 |       5236 | Database in the Cloud                                                 | Cloud          |
-- |     185 |       5237 | Mastering the database environment                                    | Database       |
-- |     603 |       5238 | Conceptual Programming                                                | Programming    |
-- |     229 |       5239 | J++ in Mobile Apps                                                    | Programming    |
-- |     460 |       5239 | J++ in Mobile Apps                                                    | Programming    |
-- |     592 |       5239 | J++ in Mobile Apps                                                    | Programming    |
-- |     218 |       5240 | iOS Programming                                                       | Programming    |
-- |     460 |       5241 | JAVA First Steps                                                      | Programming    |
-- |     559 |       5241 | JAVA First Steps                                                      | Programming    |
-- |     581 |       5242 | C# in Middleware Deployment                                           | Middleware     |
-- |     251 |       5243 | DATABASES in Theory                                                   | Database       |
-- |     262 |       5244 | Cloud-based Mobile Applications                                       | Cloud          |
-- |     284 |       5244 | Cloud-based Mobile Applications                                       | Cloud          |
-- |     394 |       5245 | The Golden Road to Platform independence                              | Middleware     |
-- |     251 |       5246 | Capture the Cloud                                                     | Cloud          |
-- |     394 |       5247 | Shining Through the Cloud: Sun Programming                            | Programming    |
-- |     229 |       5248 | What You Always Wanted to Know About Database, But Were Afraid to Ask | Database       |
-- |     262 |       5249 | Starlight Applications                                                | Cloud          |
-- |     383 |       5250 | Reengineering the Middle Tier                                         | Middleware     |
-- |     438 |       5250 | Reengineering the Middle Tier                                         | Middleware     |
-- |     460 |       5251 | Thoughts on Revitalizing Ruby                                         | Programming    |
-- |     262 |       5252 | Beyond the Database Veil                                              | Database       |
-- |     185 |       5253 | Virtual Programming for Virtual Environments                          | Programming    |
-- |     559 |       5254 | Coding Style for Maintenance                                          | Programming    |
-- +---------+------------+-----------------------------------------------------------------------+----------------+


/* YOUR SOLUTION HERE */
SELECT
    a.AU_ID,
    b.BOOK_NUM,
    b.BOOK_TITLE,
    b.BOOK_SUBJECT
FROM AUTHOR a
    JOIN WRITES w on a.AU_ID = w.AU_ID
    JOIN BOOK b on w.BOOK_NUM = b.BOOK_NUM
ORDER BY b.BOOK_NUM, a.AU_ID