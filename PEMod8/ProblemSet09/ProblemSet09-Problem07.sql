-- ## Problem 7
-- 
-- Insert the following customer into the CUSTOMER table, allowing the AUTO_INCREMENT attribute 
-- to generate the customer number automatically:
-- 
-- +--------------+--------------+----------------+
-- | CUST_LNAME   | CUST_FNAME   |   CUST_BALANCE |
-- +--------------+--------------+----------------|
-- | Powers       | Ruth         |            500 |
-- +--------------+--------------+----------------+
-- 

/* YOUR SOLUTION HERE */
INSERT INTO CUSTOMER (CUST_LNAME, CUST_FNAME, CUST_BALANCE)
VALUES ('Powers','Ruth','500')
