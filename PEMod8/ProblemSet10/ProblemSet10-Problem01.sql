-- ## Problem 1
-- 
-- Create a trigger named trg_line_total to write the LINE_TOTAL value in the LINE table
-- every time you add a new LINE row. The LINE_TOTAL value is the product of the LINE_UNITS
-- and LINE_PRICE values.
--
-- Check your trigger code by inserting data into the LINE table and verifying that
-- the LINE_TOTAL field is updated apprporiately.
--
-- Make sure you include the appropriate DELIMITER statements in your solution!
--

/* YOUR SOLUTION HERE */
DELIMITER $$

CREATE TRIGGER trg_line_total
BEFORE INSERT ON LINE
FOR EACH ROW
BEGIN
    SET NEW.LINE_TOTAL = NEW.LINE_UNITS * NEW.LINE_PRICE;
END$$

DELIMITER ;
