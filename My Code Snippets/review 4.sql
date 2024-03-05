create database review3

create table Employee
(eid int primary key,
ename varchar(50),
dept_id int foreign key (dept_id) references department(dept_id));

create table department(
dept_id int primary key,
dname varchar (50))

create table parttime(
eid int foreign key references employee(eid),
hours int)

insert into department values(11,'it'),(12,'sales'),(13,'planning')
insert into Employee values(1,'rama',11),(2,'Shama',12),(3,'harsha',13)
insert into parttime values(3,8),(1,6)

select * from Employee
select * from department


update Employee set dept_id=13 where eid=1

alter table employee
add salary int;

select * from Employee
update Employee set salary = 20000 where eid=1
update Employee set salary = 15000 where eid=2
update Employee set salary = 30000 where eid=3

select * from Employee

delete from Employee where eid=2

select * from Employee

truncate table employee

select * from Employee

--inner join
select e.eid, e.salary,dname ,hours from ((employee as e inner join department as d on e.dept_id=d.dept_id) 
inner join parttime as p on e.eid=p.eid);

--left and right join
select e.eid,ename,hours from Employee as e left join parttime as p on e.eid=p.eid
select e.eid,ename,hours from Employee as e right join parttime as p on e.eid=p.eid
select e.eid,ename,dname from Employee as e right join department as d on e.dept_id=d.dept_id

insert into Employee values(4,'asha',11,50000)

--full join
select e.eid,ename,hours,salary from Employee as e full join parttime as p on e.eid=p.eid

--self join
select e.eid ,e.ename , se.ename from Employee as e,employee as se where e.eid=se.eid
select * from Employee as e,employee as se where e.eid=se.eid

--cross join
select e.eid , d.dname from Employee as e cross join department as d 

select e.eid , d.dname , e.salary from Employee as e join department as d on d.dept_id=e.dept_id where e.salary>20000

select salary from Employee orderby salary desc; 