use demo

select * from Employee

begin transaction 
insert into employee values(9,'reshma',3)

select * from Employee

rollback tran

select * from Employee


--using try catch block ( commit or roll back changes )
select * from DemoDetails
create procedure updating_transaction
as
begin
begin try
begin transaction
update employee set fname='roy rhana' where empid=1
update DemoDetails set name='roy rhana' where id=3
commit transaction
end try
begin catch
rollback tran
end catch
end

updating_transaction

select * from Employee
select * from DemoDetails

--transcation with error
alter procedure updating_transaction
as
begin
begin try
begin transaction
update employee set fname='ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddssssssss' where empid='8'
update DemoDetails set name='mahalaxmi' where id=3
commit transaction
end try
begin catch
rollback tran
print 'error occured so rollbacked'
end catch
end

updating_transaction

select * from Employee
select * from DemoDetails

--ACID PROPRERTIES
--1)A-ATOMICITY
--Atomic - All statements in the transaction either completed successfully or they were all rolled back. The task that the set of operations represents 
--is either accomplished or not, but in any case not left half-done.
--above example is applied to atommicity















