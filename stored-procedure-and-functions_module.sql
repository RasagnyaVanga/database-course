use DDL_module;
select * from Employees;

Delimiter $$ 
create procedure GetEmployeeDetails(emp_id int)
BEGIN 
	select * from Employees where EmployeeID=emp_id;
END $$
Delimiter ;

call GetEmployeeDetails(1);

select * from Employees;

alter table Employees add column salary int;

update Employees set DepartmentID=200 where EmployeeId=2;

Delimiter $$
create function CalculateAnnualSalary(monthly_salary int)
returns int
deterministic
begin 
return monthly_salary*12;
end$$
Delimiter ;

select EmployeeID, EmployeeName, DepartmentID, salary, CalculateAnnualSalary(salary) as annual_salary from Employees;