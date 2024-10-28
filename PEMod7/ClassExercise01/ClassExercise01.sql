-- ## Task 1:
-- 
-- Drivers are essential for InstantRide, and the Driver Relationship team is 
-- responsible for their integration and success. The team requires all the
-- driver detail in the system for creating a new dashboard. You need to 
-- SELECT all available data for the drivers and return back to the team.
SELECT
    *
FROM
    DRIVERS;
-- ## Task 2:
-- 
-- The Driver Relationship team also requests the joining dates of the drivers 
-- to create a timeline. In the table, you only need to return the joining date 
-- of the drivers. You need to only return the DRIVER_START_DATE column inside 
-- a SELECT statement for the DRIVERS table.
--
SELECT
    DRIVER_START_DATE
FROM
    DRIVERS;
-- ## Task 3:
-- 
-- The Driver Relationship team would like the DRIVER_ID and DRIVER_RATING of
-- drivers currently having a rating higher than 4 in descending order.
-- Query all drivers by their driver rating in descending order.
-- 
SELECT
    DRIVER_ID, DRIVER_RATING
FROM
    DRIVERS
ORDER BY DRIVER_RATING DESC;
-- ## Task 4:
-- 
-- The Driver Relationship team would like the DRIVER_ID and DRIVER_RATING of 
-- drivers currently having a rating higher than 4 in descending order.
-- 
SELECT
    DRIVER_ID, DRIVER_RATING
FROM
    DRIVERS
WHERE
    DRIVER_RATING > 4;
-- ## Task 5:
-- 
-- The InstantRide User Satisfaction team is a core team for InstantRide, 
-- and they focus on increasing the customer satisfaction. They want to learn 
-- the travel time for each ride in the system. You need to return the USER_ID
-- and the TRAVEL_TIME column which is calculated using the TIMEDIFF function on
-- the TRAVEL_END_TIME and the TRAVEL_START_TIME.
-- 
SELECT
    USER_ID, TIMEDIFF(TRAVEL_END_TIME, TRAVEL_START_TIME) AS TRAVEL_TIME
FROM
    TRAVELS;
-- ## Task 6:
-- 
-- User Satisfaction team wants to send monthly summaries for each user. 
-- They need the following details with the user ID:
-- - The last day of the month when the users traveled most recently
-- - One week after the last day of the month when the users traveled most recently
-- 
-- You need to return a three-column output with: 
-- 1. USER_ID
-- 2. LAST_TRAVEL_MONTH
-- 3. NOTIFICATION
-- 
-- LAST_TRAVEL_MONTH should be calculated using the MAX of the LAST_DAY of the TRAVEL_END_TIME field. 
-- Similarly, NOTIFICATION should be calculated with DATE_ADD function to add one week.
-- 
SELECT
    USER_ID,
    MAX(LAST_DAY(TRAVEL_END_TIME)) AS LAST_TRAVEL_MONTH, 
	MAX(DATE_ADD(LAST_DAY(TRAVEL_END_TIME),INTERVAL 1 WEEK)) AS NOTIFICATION
FROM
    TRAVELS
GROUP BY USER_ID;
-- ## Task 7:
-- 
-- The Marketing team of InstantRide wants to know that how many discounts have been 
-- offered for each ride. You need to calculate this information for each travel where a 
-- discount is applied and return two columns: TRAVEL_ID and DISCOUNT_AMOUNT.  In addition, 
-- you need to return the calculation as a money value using the ROUND function to 2 decimals.
-- 
SELECT
    TRAVEL_ID, ROUND(TRAVEL_PRICE * TRAVEL_DISCOUNT, 2) AS DISCOUNT_AMOUNT
FROM
    TRAVELS
WHERE
    TRAVEL_DISCOUNT IS NOT NULL;