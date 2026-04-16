select first_name, last_name, age,
case
	when age<=30 then 'Young'
    when age between 31 and 50 then 'Middle age'
    when age>=51 then 'old'
end age_bracket
    from employee_demographics;


select first_name, last_name, salary, dept_id,
case
	when salary < 50000 then salary*1.05
    when salary >= 50000 then salary*1.07
end New_salary,
case
	when dept_id = 6 then salary*0.1
end Bonus
from employee_salary;
