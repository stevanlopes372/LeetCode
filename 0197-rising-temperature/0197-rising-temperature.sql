# Write your MySQL query statement below
with
a as (
    select
        id,
        recordDate,
        temperature,
        lag(temperature) over (order by recordDate) as temperature_last_day
    from Weather
)

select
    id
from
    a
where
    temperature > temperature_last_day