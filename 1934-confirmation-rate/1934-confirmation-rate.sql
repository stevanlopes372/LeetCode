-- # Write your MySQL query statement below
with
total as (
    select
        user_id,
        count(*) as total
    from
        Confirmations
    group by user_id
),


confirmations as (
    select
        user_id,
        count(*) as confirmed
    from
        Confirmations
    where
        action = 'confirmed'
    group by user_id
)

select
    s.user_id,
    ifnull(round(c.confirmed / t.total, 2), 0) as confirmation_rate 
from
    Signups s
left join confirmations c
    using(user_id)
left join total t
    using(user_id)