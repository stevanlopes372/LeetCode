# Write your MySQL query statement below
with a as (
select
    machine_id,
    activity_type,
    timestamp as start_time,
    lead(timestamp) over(partition by machine_id, process_id order by timestamp) as end_time
from Activity
),

b as (
select
    machine_id,
    end_time - start_time as diff
from
    a
where
    activity_type = 'start'
)

select distinct
    machine_id,
    round(avg(diff) over (partition by machine_id), 3) as processing_time
from
    b