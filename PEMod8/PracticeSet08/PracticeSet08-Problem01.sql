-- ## Problem 1:
-- 
-- The InstantStay Finance team requested a procedure to calculate the value-added tax (VAT) amount 
-- of the stays reservations in InstantStay. The team also indicated that VAT percentage is currently
-- 18% but can be changed in the future. You need to create a VATCalculator procedure with a VAT
-- Percentage variable. 
-- 
-- You should create the procedure with a single SELECT statement where the price and VAT is calculated.
-- 
-- Once created, you should test it by calling the procedure like:
-- 	CALL VATCalculator();
-- 
-- Your results should look like this:
-- 
-- +---------=-+--------+
-- | StayPrice | VAT    |
-- +-----------+--------+
-- |  110      |  19.8  |
-- |  110      |  19.8  |
-- |  110      |  19.8  |
-- |  110      |  19.8  |
-- |  130      |  23.4  |
-- |  140      |  25.2  |
-- | -120.5    | -21.69 |
-- |  150      |  27    |
-- |  160      |  28.8  |
-- |  125      |  22.5  |
-- |  125      |  22.5  |
-- | -130.25   | -23.45 |
-- |  200      |  36    |
-- +-----------+--------+

/* YOUR SOLUTION HERE */
CREATE PROCEDURE VATCalculator()
BEGIN
    DECLARE VATPercentage FLOAT;
    SET VATPercentage = 0.18;
    SELECT
        StayPrice,
        ROUND(StayPrice * VATPercentage, 2) as VAT
    FROM STAY;
END;

