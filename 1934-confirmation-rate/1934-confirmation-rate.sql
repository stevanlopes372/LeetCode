# Write your MySQL query statement below
SELECT
    s.user_id,
    -- COUNT(*) AS total,
    -- SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) AS confirmed_status,
    round(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END)/COUNT(*), 2) as confirmation_rate
FROM Signups s

left join Confirmations c
    using(user_id)

GROUP BY user_id