-- stored procedure

create procedure large_salaries()
select*
from employee_salary
where salary>=50000;

Call large_salaries();

-- best practice
Delimiter $$
create procedure large_salaries2()
Begin
	select*
	from employee_salary
	where salary>=50000;

	select*
	from employee_salary
	where salary>=10000;
End $$
Delimiter ;
-- run this also run altered stored procedure

call large_salaries2();

-- Parameters
Delimiter $$
create procedure large_salaries5(par_employee_id INT)
Begin
	select*
	from employee_salary
	where employee_id = par_employee_id;
End $$
Delimiter ;

call large_salaries5(2);


Delimiter $$
create procedure large_salaries6(par_salary INT)
Begin
	select*
	from employee_salary
	where salary = par_salary;
End $$
Delimiter ;

call large_salaries6(70000);