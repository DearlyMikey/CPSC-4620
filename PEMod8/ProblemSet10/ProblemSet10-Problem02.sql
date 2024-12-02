-- ## Problem 2
-- 
-- Create a trigger named trg_line_prod that automatically updates the quantity 
-- on hand (the P_QOH field) for each product sold after a new LINE row is added.
-- 
-- Check your trigger code by inserting data into the LINE table and verifying that
-- the Product table is updated apprporiately.
-- 
-- Make sure you include the appropriate DELIMITER statements in your solution!
-- 

/* YOUR SOLUTION HERE */
DELIMITER $$

CREATE TRIGGER trg_line_prod
AFTER INSERT ON LINE
FOR EACH ROW
BEGIN
    UPDATE PRODUCT
    SET P_QOH = P_QOH - NEW.LINE_UNITS
    WHERE P_CODE = NEW.P_CODE;
END$$

DELIMITER ;

