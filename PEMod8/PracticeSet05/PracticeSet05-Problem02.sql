-- ## Problem 2:
-- The House Development team wants to combine extras and house information in a separate table.
-- Create a new table called HOUSE_EXTRA with the fields ExtraID and HouseID. 
-- Use foreign keys to add the respective references to the appropriate tables.
-- 
-- In addition, when the IDs of the houses or extras are updated or changed, the changes should be
-- automatically reflected in the HOUSE_EXTRA table with the ON UPDATE CASCADE clause.
-- 
-- Similarly, when the houses or extras are deleted, the corresponding rows from the HOUSE_EXTRA 
-- table will also need to be deleted using the ON DELETE CASCADE clause.

/* YOUR SOLUTION HERE */
CREATE TABLE HOUSE_EXTRA (
    ExtraID INTEGER NOT NULL,
    HouseID INTEGER NOT NULL,
    PRIMARY KEY (ExtraID, HouseID),
    FOREIGN KEY (ExtraID) REFERENCES EXTRA(ExtraID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (HouseID) REFERENCES HOUSE(HouseID) ON UPDATE CASCADE ON DELETE CASCADE
)