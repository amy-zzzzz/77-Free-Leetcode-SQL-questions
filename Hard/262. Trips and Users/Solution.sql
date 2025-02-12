WITH t1 AS
(SELECT t.*, u1.banned AS driver_banned, u2.banned AS client_banned
FROM Trips t
LEFT JOIN Users u1 on t.driver_id=u1.users_id
LEFT JOIN Users u2 on t.client_id=u2.users_id)

SELECT request_at AS Day, ROUND((COUNT(DISTINCT CASE WHEN status like 'cancelled%' THEN id END)/COUNT(DISTINCT id)),2) AS 'Cancellation Rate'
FROM t1
WHERE driver_banned = 'No' AND client_banned = 'No'
GROUP BY request_at
