-- ## Problem 5:
-- 
-- The Marketing team wants to get the name and email information for all the guests which have
-- been registered into the system so far though not stayed in any property yet. The team is 
-- planning to use the collected information to fill the email templates with first name, 
-- last name and email fields and then send the reminder emails.
-- 
-- +----------------+---------------+--------------------+
-- | GuestFirstName | GuestLastName |     GuestEmail     |
-- +----------------+---------------+--------------------+
-- |     Manuel     |    Gibson     | m.gibson@xmail.com |
-- |      Jada      |     Swan      |  j.swan@xmail.com  |
-- |      Jada      |     Swan      |  j.swan@tmail.com  |
-- |     Ronald     |     Oneil     | r.oneil@tmail.com  |
-- +----------------+---------------+--------------------+

/* YOUR SOLUTION HERE */
SELECT
    GuestFirstName,
    GuestLastName,
    GuestEmail
FROM GUEST left join STAY on GUEST.GuestID = STAY.GuestID
WHERE STAY.GuestID IS NULL;
