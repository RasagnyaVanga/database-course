use DDL_module;
create table Categories(
CategoryID int primary key,
CategoryName varchar(100)
);
insert into Categories values(1,"Food");
insert into Categories values(2,"Drinks");

create table Products (
ProductID int primary key,
ProductName varchar(100),
CategoryID int,
Price decimal,
StockQuantity int,
foreign key(CategoryID) references Categories(CategoryID)
);

insert into Products values(1, "Pizza", 1, 450, 2);
insert into Products values(2, "Biryani", 1, 450, 2);
insert into Products values(3, "Coke", 1, 150, 2);
insert into Products values(4, "Juice", 1, 150, 2);
set SQL_SAFE_UPDATES =0;
update Products set categoryID=2 where ProductName="Coke";
update Products set categoryID=2 where ProductName="Juice";

create view ProductDetails as 
select ProductID, ProductName, CategoryName, Price from 
Products join Categories using(CategoryID) ;

select * from ProductDetails;

create or replace view ProductDetails as 
select ProductID, ProductName, CategoryName,StockQuantity, Price from 
Products join Categories using(CategoryID) ;