-- ## Problem 12
-- 
-- Write a query to display the patron ID, book number, and days kept for each checkout. 
-- "Days Kept" is the difference from the date on which the book is returned to the date it was
-- checked out. Sort the results by days kept in descending order, then by patron ID, 
-- and then by book number. (68 rows)
-- 
-- [NOTE: Rows omitted from the target results for clarity.  
--  The autograder will check for  ALL required output.]
-- 
-- 
-- +----------+--------+-------------+
-- |   PATRON |   BOOK |   Days Kept |
-- |----------+--------+-------------|
-- |     1160 |   5240 |           9 |
-- |     1160 |   5240 |           9 |
-- |     1165 |   5235 |           9 |
-- |     1183 |   5236 |           8 |
-- |     1184 |   5240 |           8 |
-- |     1185 |   5240 |           8 |
-- |     1202 |   5236 |           8 |
-- |     1203 |   5235 |           8 |
-- |     1204 |   5236 |           8 |
-- |     1207 |   5242 |           8 |
-- |     1209 |   5235 |           8 |
-- |     1219 |   5248 |           8 |
-- |     1222 |   5240 |           8 |
-- |     1226 |   5244 |           8 |
-- |     1165 |   5252 |           7 |
-- |     1185 |   5254 |           7 |
-- |     1218 |   5236 |           7 |
-- |     1222 |   5237 |           7 |
-- |     1228 |   5237 |           7 |
-- |     1172 |   5246 |           6 |
-- |     1181 |   5236 |           6 |
-- ... rows ommitted...
-- |     1210 |   5244 |           0 |
-- |     1213 |   5236 |           0 |
-- |     1214 |   5240 |           0 |
-- |     1172 |   5246 |             |
-- |     1207 |   5249 |             |
-- |     1212 |   5240 |             |
-- |     1228 |   5242 |             |
-- |     1229 |   5238 |             |
-- |     1229 |   5252 |             |
-- +----------+--------+-------------+

/* YOUR SOLUTION HERE */
SELECT
    c.PAT_ID as 'PATRON',
    c.BOOK_NUM as 'BOOK',
    DATEDIFF(c.CHECK_IN_DATE, c.CHECK_OUT_DATE) as 'Days Kept'
FROM CHECKOUT c JOIN PATRON p ON c.PAT_ID = p.PAT_ID
ORDER BY DATEDIFF(c.CHECK_IN_DATE, c.CHECK_OUT_DATE) DESC, c.PAT_ID, c.BOOK_NUM

