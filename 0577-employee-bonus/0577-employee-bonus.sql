# Write your MySQL query statement below
with a as(
select
    e.empId,
    e.name,
    b.bonus
from Employee e
left join
    Bonus b
    using(empId)
where empId not in (select empId from Bonus where bonus >= 1000)
order by
    empId
)
select name, bonus from a