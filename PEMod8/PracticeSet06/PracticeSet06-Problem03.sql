-- ## Problem 3:
-- 
-- The House Development team collected the extras data and they want you to update the database.
-- Insert the following data into the EXTRA table:
-- 
-- Extra ID	Extra Description		Extra Price
-- --------	-----------------		-----------
--    1		Liability Insurance
--    2		Personal Insurance			100
--    3		Household Insurance			125
--    
-- NOTE: You should test your results with a SELECT statement...
-- but don't include any test SQL in your submission.
-- 

/* YOUR SOLUTION HERE */
INSERT INTO EXTRA
    (ExtraID, ExtraDescription)
VALUES (1, 'Liability Insurance');
INSERT INTO EXTRA
    (ExtraID, ExtraDescription, ExtraPrice)
VALUES
    (2, 'Personal Insurance', 100);
INSERT INTO EXTRA
    (ExtraID, ExtraDescription, ExtraPrice)
VALUES
    (3, 'Household Insurance', 125);

