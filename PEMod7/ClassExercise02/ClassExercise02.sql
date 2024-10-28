-- Task #1
--
-- The InstantRide received some traffic violation tickets from the government. The Legal 
-- team of InstantRide requires the travel information of the respective drivers along 
-- with corresponding Driving License IDs to proceed further. In addition, the team wants 
-- to include the drivers without travel information in the system yet for the completion 
-- of driver list. 
-- 
-- Therefore, you need to return DRIVER_FIRST_NAME, DRIVER_LAST_NAME, DRIVER_DRIVING_LICENSE_ID, 
-- TRAVEL_START_TIME, TRAVEL_END_TIME information from the DRIVERS and TRAVELS data connected by 
-- a LEFT JOIN.
--
SELECT
    DRIVER_FIRST_NAME,
    DRIVER_LAST_NAME,
    DRIVER_DRIVING_LICENSE_ID, 
    TRAVEL_START_TIME,
    TRAVEL_END_TIME
FROM
    DRIVERS D
LEFT JOIN
    TRAVELS T ON T.DRIVER_ID = D.DRIVER_ID;

-- Task #2
--
-- The InstantRide Management team considers setting up a Lost & Found inventory. 
-- In order to start the setup, the team requires the detail of users with their travel 
-- start and end times. The team wants to track potential list of users who may have 
-- forgotten their items on the cars. 
-- 
-- Therefore, you need to return USER_FIRST_NAME, USER_LAST_NAME, TRAVEL_START_TIME, 
-- TRAVEL_END_TIME information from the USERS and TRAVELS tables connected inside a JOIN 
-- statement by the USING function and USER_ID field.
--
SELECT
    USER_FIRST_NAME, USER_LAST_NAME, TRAVEL_START_TIME, TRAVEL_END_TIME
FROM
    USERS
JOIN
    TRAVELS USING (USER_ID);

-- Task #3
--
-- The InstantRide Finance team wants to collect the price and discount information with the 
-- driver names for each travel in the system. 
-- 
-- You need to return the TRAVEL_ID, DRIVER_FIRST_NAME, DRIVER_LAST_NAME, TRAVEL_PRICE and TRAVEL_DISCOUNT 
-- information from the TRAVELS and DRIVERS tables combined over DRIVER_ID field with the ON keyword.
--
SELECT
    TRAVEL_ID, DRIVER_FIRST_NAME, DRIVER_LAST_NAME, TRAVEL_PRICE, TRAVEL_DISCOUNT
FROM
    TRAVELS
JOIN
    DRIVERS ON TRAVELS.DRIVER_ID = DRIVERS.DRIVER_ID;

-- Task #4
--
-- The InstantRide Driver Relationship team wants to create groups for drivers according to their 
-- ratings such as 3+ or 4+. For instance, a driver with the rating 3.8 will be 3+; whereas a driver 
-- with the rating 4.2 will be 4+. 
-- 
-- You need to return a two column output with DRIVER_ID and DRIVER_RATING which has first FLOOR 
-- applied and then CONCAT with a + sign for all drivers with a rating greater than 0.
--
SELECT
    DRIVER_ID, CONCAT(FLOOR(DRIVER_RATING), '+') AS DRIVER_RATING
FROM
    DRIVERS
WHERE
    DRIVER_RATING > 0;

-- Task #5
--
-- The InstantRide User Satisfaction team are looking forward to creating discounts for the users. 
-- However, the team suspects that there could be duplicate users in the system with different emails. 
-- Check for the users with their names and surnames for potential duplicates. 
-- 
-- Therefore, you need to JOIN the USERS table with USERS table and compare for equality of 
-- USER_FIRST_NAME and USER_LAST_NAME and inequality in USER_ID fields.
--
SELECT
    *
FROM
    USERS U
JOIN
    USERS V ON U.USER_FIRST_NAME = V.USER_FIRST_NAME
    AND U.USER_LAST_NAME = V.USER_LAST_NAME
    AND U.USER_ID != V.USER_ID;