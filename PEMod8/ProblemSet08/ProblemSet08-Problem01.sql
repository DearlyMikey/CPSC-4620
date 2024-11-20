-- ## Problem 1
-- 
-- Write the SQL code that will create only the table structure for a table named EMP_1. 
-- This table will be a subset of the EMPLOYEE table. The EMP_1 table structure is:
-- 
-- Field			TYPE
-- ---------		------------
-- EMP_NUM			varchar(3)
-- EMP_LNAME		varchar(15)
-- EMP_FNAME		varchar(15)
-- EMP_INITIAL		varchar(1)
-- EMP_HIREDATE	DATE
-- JOB_CODE		varchar(3)
-- 
-- Use EMP_NUM as the primary key. Note that the JOB_CODE is the FK to the JOB table, 
-- so be certain to enforce referential integrity. Your code should also prevent null entries 
-- in the EMP_LNAME and EMP_FNAME fields.
-- 

/* YOUR SOLUTION HERE */
CREATE TABLE EMP_1 (
    EMP_NUM       VARCHAR(3) PRIMARY KEY,
    EMP_LNAME     VARCHAR(15) NOT NULL,
    EMP_FNAME     VARCHAR(15) NOT NULL,
    EMP_INITIAL   VARCHAR(1),
    EMP_HIREDATE  DATE,
    JOB_CODE      VARCHAR(3),
    FOREIGN KEY (JOB_CODE) REFERENCES JOB(JOB_CODE)
);
