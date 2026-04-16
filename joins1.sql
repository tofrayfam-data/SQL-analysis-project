/* joins */

select*
from employee_demographics;


select*
from employee_salary;


select*
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
order by age
limit 3,2;



select*
from employee_salary sal
join employee_demographics dem
on sal.employee_id = dem.employee_id;


select*
from employee_salary sal
left  outer join employee_demographics dem
on sal.employee_id = dem.employee_id;



select*
from employee_demographics dem
left outer join employee_salary sal
on dem.employee_id = sal.employee_id;



select*
from employee_demographics dem
right join employee_salary sal
on dem.employee_id = sal.employee_id;



select*
from employee_salary sal1
join employee_salary sal2
on sal1.employee_id = sal2.employee_id;



