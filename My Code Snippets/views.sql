use demo

select * from employee
select * from department

--CREATE VIEW(VERTUAL TABLE)
create view MembersEmpAndDept
as
select empid,fname,dept_name from Employee as e join Department as d on e.deptId = d.deptId;

--execute view same as table
select * from MembersEmpAndDept

sp_helptext MembersEmpAndDept

--advantages of view
--1) reduce the complexity of database schema (ex giving the view having the complex quries to the non IT users )
--above example will be the example for this advantage

--2)mechanism to row and column level security
create view vw_rowSecurity
as
select empid,fname,dept_name from Employee as e join Department as d on e.deptId = d.deptId where dept_name='sdm';

select * from vw_rowSecurity

create view vw_columnSecurity
as
select empid,dept_name from Employee as e join Department as d on e.deptId = d.deptId;

select * from vw_columnSecurity

--3)present aggregated data and hide details
create view vw_summurisedData_totalNoEmp
as
select dept_name,count(e.empid) [total employee]
from Employee as e join Department as d on e.deptId = d.deptId
group by dept_name

select * from vw_summurisedData_totalNoEmp

--ALTER VIEW
alter view vw_rowSecurity
as
select empid,fname,dept_name from Employee as e join Department as d on e.deptId = d.deptId where dept_name='finance';

select * from vw_rowSecurity

--DROP VIEW
drop view MembersEmpAndDept

--UPDATE , DELETE, INSERT INTO VIEW which will affect the base table
--doing operations on the single table
create view vw_selectSomeColumn
as
select empId,fname from Employee 

--update
update vw_selectSomeColumn 
set Fname='ganu' where empId=6

select * from vw_selectSomeColumn
select * from Employee

--delete
delete from vw_selectSomeColumn where empid=6

select * from vw_selectSomeColumn
select * from Employee

--insert
insert into vw_selectSomeColumn values(6,'ganu')

select * from vw_selectSomeColumn
select * from Employee

--doing operations on multiple tables
create view MembersEmpAndDept
as
select empid,fname,dept_name from Employee as e join Department as d on e.deptId = d.deptId;

select * from MembersEmpAndDept

update MembersEmpAndDept set dept_name='finance' where fname='tony'

select * from employee
select * from department

--these operations on multiple tables will not do changes correctly(the department name has changed incorrectly)
--instead of triggers can be used 


