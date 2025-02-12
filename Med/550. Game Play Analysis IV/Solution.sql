WITH a1 AS
(SELECT player_id, MIN(event_date) as first_login
FROM Activity
GROUP BY player_id),

a2 AS
(SELECT a1.*, a2.event_date
FROM a1
LEFT JOIN Activity a2 ON a1.player_id = a2.player_id)

SELECT ROUND(COUNT(DISTINCT CASE WHEN DATEDIFF(a2.event_date, a2.first_login)=1 THEN a2.player_id END)/COUNT(DISTINCT a2.player_id),2) AS fraction
FROM a2;
