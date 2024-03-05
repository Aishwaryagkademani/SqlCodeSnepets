create database ERdiagram
use Erdiagram

create table Employee(
eId int primary key not null,
eName varchar(50),
eSalary int)

create table Department(
eId int foreign key references Employee(eId),
deptName varchar(50),
deptId int )

insert into Employee values(1,'Rama',15000),(2,'Tanaya',25000),(3,'Maya',30000);
insert into Department values(2,'Testing',20),(3,'salses',21);
select * from Employee;
select * from Department;

