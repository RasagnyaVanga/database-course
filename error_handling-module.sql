use ddl_module;
show tables;
select * from Employees;
show function status;
Delimiter $$
create function annual_salary(empID int)
Returns int
Deterministic
Begin
   Declare annualSalary Int;
   Declare continue handler for NOT FOUND
   Begin
      set annualSalary=null;
   End;
   select (salary*12) into annualSalary from Employees where EmployeeId=empID;
   return annualSalary;
End;$$
Delimiter ;
select annual_salary(23) as "Annual Salary";