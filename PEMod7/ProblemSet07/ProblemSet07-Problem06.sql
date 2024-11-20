-- ## Problem 6
-- 
-- Write a query to display the manager name, department name, department phone number, employee name,
-- customer name, invoice date, and invoice total for the department manager of the employee who made
-- a sale to a customer whose last name is Hagan on May 18, 2021.
-- 
-- Your results should look like this:
-- +-------------+-------------+-------------+--------------+-------------+-------------+--------------+--------------+------------+-------------+
-- | EMP_FNAME   | EMP_LNAME   | DEPT_NAME   | DEPT_PHONE   | EMP_FNAME   | EMP_LNAME   | CUST_FNAME   | CUST_LNAME   | INV_DATE   |   INV_TOTAL |
-- |-------------+-------------+-------------+--------------+-------------+-------------+--------------+--------------+------------+-------------|
-- | FRANKLYN    | STOVER      | SALES       | 555-2824     | THURMAN     | WILKINSON   | DARELL       | HAGAN        | 2021-05-18 |      315.04 |
-- +-------------+-------------+-------------+--------------+-------------+-------------+--------------+--------------+------------+-------------+
-- 

/* YOUR SOLUTION HERE */
SELECT
    de.EMP_FNAME,
    de.EMP_LNAME,
    de.DEPT_NAME,
    de.DEPT_PHONE,
    e.EMP_FNAME,
    e.EMP_LNAME,
    c.CUST_FNAME,
    c.CUST_LNAME,
    i.INV_DATE,
    i.INV_TOTAL
FROM LGEMPLOYEE e
    JOIN
    (SELECT e.EMP_FNAME,
            e.EMP_LNAME,
            d.DEPT_NAME,
            d.DEPT_PHONE
        FROM LGEMPLOYEE e
        JOIN LGDEPARTMENT d ON d.EMP_NUM = e.EMP_NUM) AS de
    JOIN LGINVOICE i ON e.EMP_NUM = i.EMPLOYEE_ID
    JOIN LGCUSTOMER c ON c.CUST_CODE = i.CUST_CODE
WHERE CUST_LNAME = 'Hagan' AND INV_DATE = '2021-05-18' AND DEPT_NAME = 'Sales'