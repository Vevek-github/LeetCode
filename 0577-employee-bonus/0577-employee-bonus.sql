# Write your MySQL query statement below
select employee.name,b.bonus from employee 
left join Bonus b
on employee.empID = b.empID 
where b.Bonus <  1000 or b.bonus is null