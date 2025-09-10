use DDL_module;
show tables;
select * from Departments;
select * from Employees;

create table Departments(DepartmentID int primary key, DepartmentName varchar(100));
create table Employees(
EmployeeID int primary key,
EmployeeName varchar(100),
DepartmentID int,
foreign key(DepartmentID) references Departments(DepartmentID) on delete cascade
);
insert into Departments values 
(300, "Deploying");

insert into Employees values 
(1,"Elena",100),
(2,"Bonnie",100),
(3,"Damon",200);

delete from Departments where DepartmentID=200;


show create table Employees;
alter table Employees drop foreign key Employees_ibfk_1;
alter table Employees add constraint fk_emp_dep 
foreign key(DepartmentID) references Departments(DepartmentID) on delete cascade on update cascade;

create table AuditLog ( 
	AuditID int auto_increment primary key,
    EmployeeID int,
    OldDepartmentID int,
    NewDepartmentID int,
    ChangeDate timestamp
);

Delimiter $$
create trigger auditlog_employee_changes
after update on Employees
for each row
BEGIN 
insert into AuditLog(EmployeeID, OldDepartmentID, NewDepartmentID, ChangeDate)
 values (OLD.EmployeeID, OLD.DepartmentID, NEW.DepartmentID, NOW());
END $$ 
Delimiter ;

select * from AuditLog;

update Employees set DepartmentID=300 where DepartmentID=100;

show triggers;