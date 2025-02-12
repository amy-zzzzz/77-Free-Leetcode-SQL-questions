--Solution 1:
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

--Solution 2:
WITH FirstLogin AS (
    -- Get each player's first login date
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
)
SELECT 
    ROUND(
        COUNT(DISTINCT a.player_id) / COUNT(DISTINCT f.player_id), 2
    ) AS fraction
FROM FirstLogin f
LEFT JOIN Activity a 
ON f.player_id = a.player_id 
AND DATEDIFF(a.event_date, f.first_login) = 1;
