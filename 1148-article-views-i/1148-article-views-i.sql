# Write your MySQL query statement below
select distinct
    viewer_id as id
from
    Views
where
    viewer_id = author_id
order by id