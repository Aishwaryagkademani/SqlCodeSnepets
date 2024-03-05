--create database CoDb;
--use CoDb;

--create table Details(user_id int primary key identity(1,1) not null,
--					 user_name varchar(50) not null,
--					 user_age int not null)

--select * from details;

use Demo;
create table Employee(
empId int primary key not null,
Fname varchar(50),
deptId int );

create table Department(
deptId int ,
dept_name varchar(50),
location varchar(50));

create table PartTimeEmp(
empId int not null,
fname varchar(50),
hours int
);

insert into parttimeemp values(1,'raj',5),(5,'vishal',10),(3,'rahul',6);

insert into employee values(1,'Raj',1),(2,'Tony',3),(3,'Rahul',2),(4,'jyoti',null),(5,'vishal',4),(6,'pradeep',5);
select *from employee;

insert into department values(1,'SQL','mumbai'),(2,'finance','pune'),(3,'sdm','thane'),(4,'mysql','chennai'),(5,'db2','kolkata');
select * from department;

--INNER JOIN AND JOIN
--Both gives the same result
select empId , Fname , dept_name, D.deptId from employee E join department D on E.deptId=D.deptId;

select e.empid,e.fname,dept_name,deptid from Employee e inner join department d on e.deptid = d.deptId;--shows error bcz dept_id is in both table. so we need to specify the table name infront of it.
select e.empid,e.fname,dept_name,d.deptid from Employee e inner join department d on e.deptid = d.deptId;

--join three tables
select e.empid,e.fname,d.deptid,p.hours from (Employee e inner join department d on e.deptid = d.deptid) inner join parttimeemp p on e.empid=p.empid;

--sql LEFT JOIN
--delete from parttimeemp;
select e.empid,e.fname , p.hours from employee e left join parttimeemp p on e.empid=p.empid;
--insert into parttimeemp values(1,'raj',5),(5,'vishal',10),(3,'rahul',6);
--insert into parttimeemp values(10,'tananya',8);
--select * from PartTimeEmp;
select e.empid,e.fname,p.hours from employee e left join PartTimeEmp p on e.empid=p.empid;
select p.empid,p.fname,p.hours from parttimeemp p left join employee e on p.empid=e.empid;

select p.empid,p.fname,p.hours from parttimeemp p left join employee e on p.empid=e.empid order by p.empid;

--sql RIGHT JOIN
select e.empid,e.fname,p.hours from parttimeemp p right join Employee e on e.empId=p.empid;
select p.empid,p.fname,p.hours from employee e right join parttimeemp p on e.empId=p.empid;
select p.empid,p.fname,p.hours from employee e right join parttimeemp p on e.empId=p.empid where p.empid>3;

--sql FULL JOIN
select * from Employee e full join Department d on e.deptid = d.deptid;
select e.empid,e.fname,p.hours from employee e full join parttimeemp p on e.empid=p.empid where hours > 5; 

--sql SELF JOIN
select e1.fname , e2.Fname from employee e1 , employee e2 where e1.empid=e2.empid

--sql CROSS JOIN
select fname,dept_name from employee cross join department;
select d.deptid , e. empid ,hours from employee e cross join Department d cross join parttimeemp p;