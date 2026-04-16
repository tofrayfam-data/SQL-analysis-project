-- cte

With cte_example (gender, avg_sal, max_salary, min_salary, count_salary) as
(select gender,
avg(salary),
max(salary),
min(salary),
count(salary)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender)
select*
from cte_example;


With cte_example as
(select gender, avg(salary) avg_sal, max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender)
select*
from cte_example;



With cte_example as
(select gender, avg(salary) avg_sal, max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
    group by gender
)
select avg(avg_sal), avg(max_sal), avg(min_sal), avg(count_sal)
from cte_example
group by gender;
;


With cte_example as
(select avg(salary) avg_sal, max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
)
select avg(avg_sal), avg(max_sal), avg(min_sal), avg(count_sal)
from cte_example
;





Select avg_sal
from
(select gender, avg(salary) as avg_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender) as maam;



select*
from employee_demographics
order by 6;

select*
from employee_demographics
where birth_date>'1985-01-01';


select*
from employee_salary
where salary>50000;



with cte_grace as
(select employee_id, gender, birth_date
from employee_demographics
where birth_date>'1985-01-01'
),
cte_grace2 as
(select employee_id, salary
from employee_salary
where salary>50000)
select*
from cte_grace
join cte_grace2
	on cte_grace.employee_id = cte_grace2.employee_id;