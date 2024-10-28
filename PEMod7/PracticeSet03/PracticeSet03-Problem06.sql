-- ## Problem 6:
-- 
-- The InstantStay Legal team wants to send new General Data Protection Regulation (GDPR) 
-- emails who are registered in the system. Collect the email information for all owners and 
-- guests.
-- 
-- +-----------------------+
-- |      OwnerEmail       |
-- +-----------------------+
-- |   k.logan@xmail.com   |
-- |   r.gibbs@xmail.com   |
-- |   a.burke@xmail.com   |
-- |   k.jones@xmail.com   |
-- |  a.webber@xmail.com   |
-- |   r.snow@xmail.com    |
-- |  d.schmidt@xmail.com  |
-- |  c.castro@xmail.com   |
-- |  k.burris@xmail.com   |
-- | e.tomlinson@xmail.com |
-- | a.carpenter@xmail.com |
-- |   a.tapia@xmail.com   |
-- |  k.harwood@xmail.com  |
-- |   r.oneil@xmail.com   |
-- |  m.gibson@xmail.com   |
-- |   j.swan@xmail.com    |
-- |  b.thorpe@xmail.com   |
-- |   j.swan@tmail.com    |
-- |   r.oneil@tmail.com   |
-- +-----------------------+

/* YOUR SOLUTION HERE */
SELECT OwnerEmail as "OwnerEmail"
FROM OWNER
UNION
SELECT GuestEmail as "OwnerEmail"
FROM GUEST