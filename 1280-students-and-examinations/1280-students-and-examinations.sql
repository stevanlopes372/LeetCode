# Write your MySQL query statement below
with e as (
    select
        concat(student_id,subject_name) as concatenade
    from
        Examinations
)
select
    s.student_id,
    s.student_name,
    su.subject_name,
    count(e.concatenade) as attended_exams
from
    Students s
cross join
    Subjects su
left join e
    on concat(s.student_id, su.subject_name) = e.concatenade
group by
    s.student_id,
    s.student_name,
    su.subject_name
order by
    s.student_id,
    su.subject_name