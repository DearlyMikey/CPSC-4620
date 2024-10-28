-- ## Problem 1:
-- The InstantStay House Development team wants to track the extra facilities and/or benefits such 
-- as amenities or insurances, provided with the houses. The team needs you to create a new database
-- table called EXTRA with an intger primary key ExtraID and a 30 character text description field
-- ExtraDescription.
-- 
-- You can use these command to access the MySQL metadata and check your soultion.
-- 		DESCRIBE TABLE EXTRA;	
-- 		SHOW COLUMNS FROM EXTRA;
-- 
-- Just don't include these commands in your solution file!
--
-- 
--
CREATE TABLE EXTRA
(
    ExtraID INTEGER UNIQUE NOT NULL,
    ExtraDescription VARCHAR(30) NOT NULL,
    PRIMARY KEY (ExtraID)
);