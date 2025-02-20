# Write your MySQL query statement below
SELECT
    s.user_id,
    round(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END)/COUNT(*), 2) as confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
    USING(user_id)
GROUP BY user_id