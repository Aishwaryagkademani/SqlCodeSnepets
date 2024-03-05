use demo
select * from DemoDetails --table scan(ctrl+l)
select * from DemoDetails where name='lucy';  --table scan before index creation

--INDEXES

--EXAMPLES
--CREATE INDEXES (create [unique][clustered /non clusted] index)
create index IX_salaryRange on demodetails(salary asc)

--ALTER INDEX
alter index IX_salaryRange on demodetails
select salary from DemoDetails where salary between 20000 and 30000

--DROP INDEX
drop index IX_salaryRange on demodetails

--CLUSTER INDEX
sp_helpindex demodetails --INBUILT STORED PROCEDURE SHOWS THE INDEXES AVAILABLE ON THE TABLE

exec sp_helpindex employee --primary key clustur index is automatically created. it arrenges the data in ascending order of primary key
select * from Employee
insert into Employee values (10,'rani',3)
insert into Employee values (8,'ani',2)

--only one clustered index can be created on a table , if want to create another then should drop existing clustered index.

create clustered index IX_clusterIndexOnName on demodetails(name desc)
select * from DemoDetails where name='lucy'

--drop the cluster index
drop index demodetails.IX_clusterIndexOnName

create clustered index IX_OnTwoColumns on demodetails(name asc,salary desc) --create index with two columns
select * from DemoDetails --clustered index scan
--insert into demodetails values(10,'laxmi',45000)
select * from DemoDetails where name like 'l%' and salary between 40000 and 47000 -- clustered index seek


--NON-CLUSTER INDEX
--create non clustered index(without nonclustered keyword by default it is a non-clustered index)
create nonclustered index IX_Name on demodetails(name desc);
select name,salary from DemoDetails;--according to non cluster index IX_Name is executed
select * from DemoDetails --according to cluster index is executed

create nonclustered index IX_Salary on demodetails(salary asc)

select name,salary from DemoDetails;--according to non cluster index IX_salary is executed
select * from DemoDetails where name='laxmi' --clustered index seek (ix-onTwocolumn)
select name , salary from demodetails where name='laxmi' --index seek non clustered (IX_Name)
select name , salary from demodetails where salary between 25000 and 47000--index seek non clustered (IX_Salary)

--alter index
alter index ix_name on demodetails disable
select name from demodetails where name='lucy'  --clustered index seek (ix-onTwocolumn) but not using ix_name index
alter index ix_name on demodetails rebuild
select name from demodetails where name='lucy'  --non clustered index seek using ix_name index

--drop indexs
drop index IX_Name on demodetails

--UNIQUE INDEXES
create unique nonclustered index IX_Uniqueid on employee(empid)
select empid from employee --index scan non clustered using index IX_Uniqueid

drop index IX_Uniqueid on employee

--creates the unique non clustered index 
alter table employee
add constraint unique_id
unique (empid)


--drop clustered index if exist and then create clustered index(by default primary key constraint creates unique clustered index)
--alter table employee
--add constraint unique_id_clustered
--unique clustered (empid)



