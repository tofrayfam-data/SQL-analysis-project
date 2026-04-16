INSERT INTO `parks_and_recreation`.`employee_demographics`
(`employee_id`,
`first_name`,
`last_name`,
`age`,
`gender`,
`birth_date`)
VALUES
(5, 'Jerry', 'Gergich', 61, 'Male', '1962-08-28'),
(15, 'Gerald', 'Onyemaechi', 65, 'Male', '1958-08-28');

select*
from employee_demographics
-- triggers and events

Delimiter $$
create trigger employee_insert
after insert on employee_salary
for each row
begin
insert into employee_demographics (employee_id, first_name, last_name)
values(new.employee_id, new.first_name, new.last_name);
end $$
Delimiter ;

insert into employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
values (14, 'Wale', 'Adeniyi', 'entertainment guru', 800000, null);

select*
from employee_salary;

select*
from employee_demographics;


-- Events
Delimiter $$
Create event delete_retiree
on schedule every 30 second
Do
Begin
select*
from employee_demographics
where age>=30;
end $$
Delimiter $$;

