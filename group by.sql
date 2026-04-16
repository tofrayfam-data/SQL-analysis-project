select gender
from parks_and_recreation.employee_demographics
group by gender
;

select gender, avg(age)
from parks_and_recreation.employee_demographics
group by gender
;


select gender, avg(age), max(age), min(age), count(age)
from parks_and_recreation.employee_demographics
group by gender
;


select occupation
from parks_and_recreation.employee_salary
group by occupation
;

select occupation, salary
from parks_and_recreation.employee_salary
group by occupation, salary
;

-- order by
select*
from parks_and_recreation.employee_demographics
order by first_name desc
;


select*
from parks_and_recreation.employee_demographics
order by gender, age desc
;

select gender, avg(age)
from parks_and_recreation.employee_demographics
group by gender
having avg(age)>40
;


select occupation, avg(salary)
from parks_and_recreation.employee_salary
group by occupation
having avg(salary) <= 55000
;


select occupation, avg(salary)
from parks_and_recreation.employee_salary
group by occupation
having avg(salary) <= 55000
;


select occupation, avg(salary)
from parks_and_recreation.employee_salary
where occupation like ('%manager%')
group by occupation
having avg(salary) < 90000
;