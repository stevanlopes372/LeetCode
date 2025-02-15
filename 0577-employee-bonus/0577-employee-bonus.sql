# Write your MySQL query statement below
select
    e.name,
    b.bonus
from Employee e
left join
    Bonus b
    using(empId)
where empId not in (select empId from Bonus where bonus >= 1000)