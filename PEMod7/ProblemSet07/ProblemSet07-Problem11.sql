-- ## Problem 11
-- 
-- Write a query to display the customer code, first name, and last name of all customers who have 
-- had at least one invoice completed by employee 83649 and at least one invoice completed by 
-- employee 83677. Sort the output by customer last name and then first name.
-- 
-- Your results should look like this:
-- +-------------+--------------+--------------+
-- |   CUST_CODE | CUST_FNAME   | CUST_LNAME   |
-- |-------------+--------------+--------------|
-- |         684 | WENDI        | BEAN         |
-- |         684 | WENDI        | BEAN         |
-- |         340 | MARCIA       | BURRIS       |
-- |         211 | GERALD       | CAUDILL      |
-- |         211 | GERALD       | CAUDILL      |
-- |         292 | VALARIE      | DILLARD      |
-- |         293 | CLAIR        | ERICKSON     |
-- |         416 | TATIANA      | HOWE         |
-- |         996 | EZRA         | LYON         |
-- |          98 | VALENTIN     | MARINO       |
-- |          98 | VALENTIN     | MARINO       |
-- |         121 | PETER        | SMALL        |
-- |        1157 | LUCIO        | STALEY       |
-- |         617 | CESAR        | TALLEY       |
-- |         457 | SHAUNA       | WERNER       |
-- |         131 | SAL          | WHALEY       |
-- +-------------+--------------+--------------+
-- 

/* YOUR SOLUTION HERE */
SELECT
    c.CUST_CODE,
    c.CUST_FNAME,
    c.CUST_LNAME
FROM LGCUSTOMER c
    JOIN LGINVOICE i1 ON c.CUST_CODE = i1.CUST_CODE AND i1.EMPLOYEE_ID = 83649
    JOIN LGINVOICE i2 ON c.CUST_CODE = i2.CUST_CODE AND i2.EMPLOYEE_ID = 83677
ORDER BY c.CUST_LNAME, c.CUST_FNAME;

