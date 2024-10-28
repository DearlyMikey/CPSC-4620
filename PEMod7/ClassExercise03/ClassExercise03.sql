-- ## Task 1:
-- 
-- The InstantRide Driver Relationship team wants to analyze the travel information of the low 
-- rated drivers. You will need to provide them with all the travel information of the drivers 
-- with the average rating lower than 4. The team wants to get in touch with the travelers 
-- and analyze their feedback. 
-- 
-- You need to run SELECT query and return all travel data from the TRAVELS table 
-- filtered by the drivers with an average rating lower than 4 in the DRIVERS table.
-- 

SELECT
    *
FROM
    TRAVELS
WHERE
    DRIVER_ID IN (SELECT
    DRIVER_ID
FROM
    DRIVERS
WHERE
    DRIVER_RATING < 4);
	
-- ## Task 2:
-- 
-- The InstantRide Driver Relationship team wants to check if there are any drivers with zero rides. 
-- You need to extract the DRIVER_ID, DRIVER_FIRST_NAME, DRIVER_LAST_NAME of the drivers
-- with zero rides. 
-- 
-- You can use a subquery where the DRIVER_ID from the DRIVERS table is not equal to 
-- distinct DRIVER_ID rows in the TRAVELS table using ALL.
-- 
SELECT
    DRIVER_ID, DRIVER_FIRST_NAME, DRIVER_LAST_NAME
FROM
   DRIVERS
WHERE
    DRIVER_ID != ALL (
		SELECT DISTINCT DRIVER_ID FROM TRAVELS);
		
-- ## Task 3:
-- 
-- The InstantRide Finance team wants to know the average discount amounts for each car in the
-- InstantRide. Calculate the average discount amount as monetary value for the travels where a
-- discount is applied. 
-- 
-- You need to create a subquery over the TRAVELS table to retrieve CAR_ID and
-- DISCOUNT_AMOUNT calculated with 2 decimals using the ROUND function.
-- 
-- To calculate the DISCOUNT_AMOUNT, multiply the TRAVEL_PRICE by the TRAVEL_DISCOUNT 
-- where the TRAVEL_DISCOUNT value is not NULL. Round the result to 2 decimals.
-- 
-- Then you can use this subquery to get the CAR_ID and AVG of DISCOUNT_AMOUNT 
-- values, once again using the ROUND function on the average results. Group the results 
-- by the CAR_ID. Use CAR_ID and DISCOUNT_AMOUNT as column aliases and return it 
-- back to the Finance team.
-- 

SELECT
    p.CAR_ID, ROUND(AVG(DISCOUNT_AMOUNT), 2) AS DISCOUNT_AMOUNT
FROM
    (SELECT
        CAR_ID, ROUND(TRAVEL_PRICE * TRAVEL_DISCOUNT, 2) AS DISCOUNT_AMOUNT
    FROM
        TRAVELS
    WHERE
        TRAVEL_DISCOUNT IS NOT NULL) AS p
GROUP BY CAR_ID;

-- ## Task 4:
-- 
-- The InstantRide Finance team also wants to analyze travels where more than the average 
-- discount rate is applied. They want to look for any correlation between higher discount 
-- amounts against other travel characteristics. 
-- 
-- You need to create a SELECT statement which is filtered with a subquery to calculate 
-- the AVG of the TRAVEL_DISCOUNT column.
-- 

SELECT
    *
FROM
    TRAVELS
WHERE
    TRAVEL_DISCOUNT >= (SELECT AVG(TRAVEL_DISCOUNT) FROM TRAVELS);

-- ## Task 5:
-- 
-- The InstantRide Management team considers creating a new team for Car Maintenance. 
-- The new team needs to find/list the cars that are used more than average with the usage count.
-- Collect the information of all rides and consolidate over the Car IDs. 
-- 
-- You need to create a three level SQL statement. Firstly, you need to COUNT the number 
-- of rows in TRAVELS and GROUP_BY the CAR_ID field. Then you need to calculate the 
-- AVG of the data to find the average usage of the cars. Finally, you need to return 
-- CAR_ID and the TRAVELS count (as the Usages column) filtered to only values 
-- greater than the calculated average.
-- 

SELECT
    CAR_ID, COUNT(TRAVEL_ID) AS Usages
FROM
    TRAVELS
GROUP BY CAR_ID
HAVING COUNT(TRAVEL_ID) > (SELECT AVG(S.T) FROM
        (SELECT COUNT(TRAVEL_ID) AS T FROM TRAVELS
			GROUP BY CAR_ID) S);
		
-- ## Task 6:
-- 
-- The InstantRide Marketing team wants to organize an InstantRide party. The team requires 
-- first name and last name of all the users and drivers in order to create a gate-pass 
-- for their entry. 
-- 
-- You need to join USERS and DRIVERS tables using UNION and return FIRST_NAME and
--  LAST_NAME columns.
-- 
SELECT
    DRIVER_FIRST_NAME AS FIRST_NAME, DRIVER_LAST_NAME AS LAST_NAME
FROM
    DRIVERS
UNION
SELECT
    USER_FIRST_NAME, USER_LAST_NAME
FROM
    USERS;