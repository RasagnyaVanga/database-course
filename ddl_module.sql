create database DDL_module;
use DDL_module;
create table Employees(EmployeeID int primary key , FirstName varchar(50) not null, 
LastName varchar(50) not null, HireDate date, Department varchar(50));
describe Employees;

Alter table Employees add column Salary decimal;
alter table Employees modify column Department varchar(100);

drop table Employees;
show tables;

