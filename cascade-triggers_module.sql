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
(200, "Testing");

insert into Employees values 
(1,"Elena",100),
(2,"Bonnie",100),
(3,"Damon",200);

delete from Departments where DepartmentID=200;

create table dep (empid int primary key, depid int);
insert into dep values(1,1000),(2,2000);
select * from dep;

create table AuditLogs ( 
AuditID int, EmployeeID int, 
OldDepartmentID int, NewDepartmentID int,
ChangeDate timestamp);

Delimiter $$
create trigger auditing_dep_changes 
after update on dep
for each row
BEGIN 
insert into AuditLogs(AuditID, EmployeeID, OldDepartmentID, NewDepartmentID, ChangeDate)
 values (NULL,OLD.empid, OLD.depid, NEW.depid, NOW());
END$$ 
Delimiter ;

SET SQL_SAFE_UPDATES = 0;

update dep set depid=10000 where depid=1000;
select * from AuditLogs;

update dep set depid=20000 where depid=2000;