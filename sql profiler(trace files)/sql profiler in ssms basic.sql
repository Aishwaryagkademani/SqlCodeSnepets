use codb
select * from details

use demo
go
select * from Employee

--if executed all the statements above -- then both the execution will be traced in trace file
--if we want to trace only one database activity we can use filters


--applying the filters on talbe employee
select * from Employee
select * from DemoDetails
--after executing this , in text data it show both the query bcz sql execute in batch

select * from Employee
go
select * from DemoDetails
--after execution of the aboue statements only employee table is filtered and in text data it show only employee table query bcz go

--duration of query
select * from Employee
go
select * from DemoDetails
go
select * from DemoTrace1

