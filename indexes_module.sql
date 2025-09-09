use DDL_module;
create table Employees (
FirstName varchar(10),
LastName varchar(10)
);

insert into Employees values("Stefan","Salvatore");
insert into Employees values("Damon","Salvatore");
insert into Employees values("Klaus","Mikaelson");
insert into Employees values("Elijah","Mikaelson");
insert into Employees values("Caroline","Forbes");

select * from Employees;

create index idx_first_last on Employees(FirstName,LastName);

select * from Products;

create index idx_product_id on Products(ProductID);
drop index idx_product_id on Products;