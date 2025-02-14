# Write your MySQL query statement below
with
a as (
    select
        id,
        recordDate,
        temperature,
        lag(temperature) over (order by recordDate) as temperature_last_day,
        lag(recordDate) over (order by recordDate) as last_day
    from Weather
)

select
    id
from
    a
where
    datediff(recordDate, last_day) = 1
    and temperature > temperature_last_day