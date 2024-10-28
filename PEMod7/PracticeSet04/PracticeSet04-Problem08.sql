-- ## Problem 8:
-- 
-- The InstantStay Owner Relationships team focus on the success of InstantStay by creating strong
-- connection to the owners. They want to send celebration mails to the owners on their joining 
-- date in the system.
-- 
-- They need the combined details which includes name and last name of the owners with their email 
-- addresses. In addition, they are planning to make this as practice for every year. The team
-- requires the day and month of owners joining date to send emails on exact dates every year.
-- 
-- +----------------+---------------------+-------+-----+
-- |      Name      |     OwnerEmail      | Month | Day |
-- +----------------+---------------------+-------+-----+
-- |   Kaya Logan   |  k.logan@xmail.com  |   3   |  8  |
-- |   Ruth Gibbs   |  r.gibbs@xmail.com  |   6   | 26  |
-- | Alberto Burke  |  a.burke@xmail.com  |   8   |  2  |
-- | Kristen Jones  |  k.jones@xmail.com  |   8   |  8  |
-- |  Alec Webber   | a.webber@xmail.com  |   9   | 17  |
-- |  Ronald Snow   |  r.snow@xmail.com   |   4   | 15  |
-- | Donald Schmidt | d.schmidt@xmail.com |   3   | 15  |
-- +----------------+---------------------+-------+-----+

/* YOUR SOLUTION HERE */
SELECT
    CONCAT(OwnerFirstName, ' ', OwnerLastName) AS "Name",
    OwnerEmail,
    EXTRACT(MONTH FROM OwnerJoinDate) AS "Month",
    EXTRACT(DAY FROM OwnerJoinDate) AS "Day"
FROM OWNER