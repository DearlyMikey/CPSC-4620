-- ## Problem 4:
-- 
-- The House Development team mentioned that all the houses in the state of NY already have 
-- Liability Insurance (ID: 1). Add all the houses in NY to the HOUSE_EXTRA table, giving them
-- an ExtraID value of 1.  Do this with with 1 SQL command, an INSERT ... SELECT ...
-- 
-- NOTE: You should test your results with a SELECT statement...
-- but don't include any test SQL in your submission.
-- 

/* YOUR SOLUTION HERE */
INSERT INTO HOUSE_EXTRA (ExtraID, HouseID)
SELECT (Select ExtraID FROM EXTRA WHERE ExtraID = 1), HouseID FROM HOUSE
WHERE HouseState = 'NY';
