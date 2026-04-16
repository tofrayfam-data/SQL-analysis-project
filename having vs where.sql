select gender, avg(age)
from employee_demographics
group by gender
having avg(age) > 38;


select gender, age
from employee_demographics
where age > 38;


select occupation, salary
from employee_salary;


select occupation, avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) > 75000;


select occupation, salary
from employee_salary
where occupation like '%manager%'
;


