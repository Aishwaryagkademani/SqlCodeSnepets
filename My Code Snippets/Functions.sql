use demo

create table DemoDetails(
id int,
name varchar(50),
salary int)

create table DemoDetailsForCustomers(
id int,
name varchar(50),
salary int)


insert into DemoDetailsForCustomers values(1,'varun',20000),
(2,'tamaya',15000),
(3,'rose',30000),
(4,'emali',25000),
(5,'ganesha',45000);

insert into DemoDetails values(1,'harsh',20000),
(2,'uma',15000),
(3,'shama',30000),
(4,'yanari',25000),
(5,'lucy',45000);

select * from DemoDetails;

--FUNCTIONS
--Scaler valued function

--without parameters
create function ReturnWishes()
returns nvarchar(50)
as
begin
return 'happy new year';
end;

--execute
select dbo.returnwishes()

--with parameter
--writing function to give the sum of salary
create function calculateSalaryWith20PerTax(
@salary as int)
returns int
as
begin 
	return @salary*20/100;
end;

--alter function
alter function calculateSalaryWith20PerTax(
@salary as int)
returns int
as
begin 
	return @salary-@salary*20/100;
end;

--calling function 
select dbo.calculateSalaryWith20PerTax(100);

--calling funtion in queries
select dbo.calculateSalaryWith20PerTax(salary) [salary after applying tax] , salary[original salary] from DemoDetails 

drop function dbo.calculateSalaryWith20PerTax

--user defined funtion within the built-in function
select sum(dbo.calculateSalaryWith20PerTax(salary)) [total salary of employees] from DemoDetails

--using if statement
create function UsingIfBlocks(
@salary as int)
returns int
as
begin
if(@salary<20000)
	return @salary;
	return @salary-@salary*20/100;
end;

select dbo.UsingIfBlocks(1000)
select dbo.UsingIfBlocks(50000)

select dbo.usingifblocks(salary) [salary after applying tax] , salary[original salary] from DemoDetails 

--create function UsingIfElseBlock(
--@salary as int,
--@name varchar(50))
--returns varchar(50) 
--as
--begin
--declare @Vname varchar(50)
--if(@salary<20000)
--begin
--	@Vname = @name;
--end
--else
--begin
--	@salTax= @salary-@salary*20/100;
--	@Vname=@name--+' cut salary';
--end
--return @Vname;
--end;

use Demo
insert into DemoDetails values(1,'ragini',20000),
(2,'maha',15000),
(1,'tayana',30000),
(1,'jananai',25000),
(2,'laxmi',45000);


--Table valued function
--creation of single station table valued function 
create function TVF_RetrivingName(@id int)
returns table
as
return select name from DemoDetails where id=@id;

--Executing talbe valued funtion
select * from TVF_RetrivingName(1)
select * from TVF_RetrivingName(2)
select * from TVF_RetrivingName(3)

--altering the function
alter function TVF_RetrivingName(@id int)
returns table
as
return select * from DemoDetails where id=@id;

select * from TVF_RetrivingName(1)
select name,salary from TVF_RetrivingName(1)

alter function TVF_RetrivingName(@id1 int,@id2 int)
returns table
as
return select * from DemoDetails where id between @id1 and @id2;


select * from TVF_RetrivingName(1,3) order by id

--droping function
drop function TVF_RetrivingName

--Multi-Statement Table-Valued Function(MSTVF)
--To define a multi-statement table-valued function, you use a table variable as the return value. Inside the function,
--you execute one or more queries and insert data into this table variable.

create function MSTVFunction()
returns @combined_table table (
id int,
name varchar(50),
salary int,
catogary varchar(50))
as
begin
insert into @combined_table
select id,name,salary,'employee' from DemoDetails ;

insert into @combined_table 
select id,name,salary,'customer' from DemoDetailsForCustomers;

return;
end;



select * from MSTVFunction()

--BUILT-IN FUNCTIONS
select rand()
select CURRENT_TIMESTAMP
select DATEADD(mm,-1,CURRENT_TIMESTAMP);
select DATEADD(mm,1,CURRENT_TIMESTAMP);
select DATEADD(YEAR,2,CURRENT_TIMESTAMP);

select DATEADD(year,23,'2001-06-03');

select datediff(HOUR,'2001-06-03',CURRENT_TIMESTAMP);
select datediff(MONTH,'2001-06-03',CURRENT_TIMESTAMP);
select datediff(DAY,'2001-06-03',CURRENT_TIMESTAMP);
select datediff(year,'2001-06-03',CURRENT_TIMESTAMP);

select sysdatetime();
select cast(67.45445 as int)
select cast(12 as varbinary)
select cast(67 as char)
select cast('a' as image)
select ASCII('a')
select len('triggers where done')
select str('128')
select SUBSTRING('hello hi',2,5)

select CURRENT_USER;
select SESSION_USER
select SYSTEM_USER
select USER_NAME()
