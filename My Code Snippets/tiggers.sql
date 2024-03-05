use codb

create trigger beforeInsert
on details
for
insert
--not for replication
as
print 'the trigger for insert statement is executed'


create table test(
id int)


--DDL TRIGGERS
--DATABASE LEVEL
----create table trigger
--create trigger TrgPreventCreateTable
--on database
--for create_table
--as
--begin
--print 'you cannot create a table in this database'
--rollback transaction
--end

--create table test
--(id int)


--for group events such as create,alter,and drop table
alter trigger TrgPreventCreateTable
on database
for create_table,alter_table,drop_table
as
begin
print 'you cannot create or alter or drop a table in this database'
rollback transaction
end

--drop table details


--DDL EVENT GROUPS
--EX: DDL_TABLE_EVENTS,DDL_PROCDURE_EVENTS,DDL_ROLE_EVENTS,DDL_FUNCTIONS_EVENTS......(CREATE,ALTER,DROP)
create trigger trgEventGroup
on database
for ddl_table_events
as
begin
print 'use of event group: you cannot create or alter or drop a table in this database'
rollback transaction
end

create table test2
(id int)

drop table test

alter table test add email varchar(100)

--DDL OPERATION SERVER LEVEL
create database db1
create database db2
create database db3

create trigger trgServerAll
on all server
for ddl_table_events
as
begin
print 'you cannot create, alter or drop tables in any database'
rollback transaction
end

use db1
go
create table test
(id int)

use db2
go
create table test
(id int)

--use db3
--go
--create table test
--(id int)

--drop database db3

use codb

create trigger trgTblDetails_forInsert
on details
for insert
as
begin
select * from inserted    --inserted is a special type of table which is available in the context of the trigger and structure of this table is same as structure of table on which trigger is created(on table) 
end

insert into Details values('amrunata',47);

use db1
--drop trigger trgServerAll
--STORE THE DETAILS IN THE AUDIT TABLE
create table audit_insertedIntoDetails
(id int,auditData varchar(100))

create table tblemp(
id int,name varchar(30))

create trigger trgTblemp_forInsert
on tblemp
for insert
as
begin
declare @id int
select @id=id from inserted
insert into audit_insertedIntoDetails
values(@id,'new employee with id='+cast(@id as nvarchar(5))+'is added at' + cast(GETDATE() as nvarchar(20)))
end

insert into tblemp values(2,'maya')
insert into tblemp values(4,'moni')
insert into tblemp values(3,'raga')
insert into tblemp values(5,'sahana')
insert into tblemp values(10,'kartik')

select * from audit_insertedIntoDetails
select * from tblemp

create trigger trg_insertIdAdd10
on tblemp
instead of insert
as
begin

end

insert into tblemp values(1,'ram')