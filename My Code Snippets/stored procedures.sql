use CoDb;

select* from Details;

--CREATE PROCEDURE 
create procedure spDisplayDetails
as
begin
select* from Details;
end

create proc stpShort
as
begin
select* from Details
end
go

drop proc stpShort

--EXECUTE PROCEDURE
--execute spdisplaydetails
--exec spshort

--PROCEDURE WITH PARAMETERS
create proc spWithParameters 
@userid int
as
select * from details where user_id=@userid
go

--EXECUTE PROCEUDURES WITH PARAMETERS
exec spWithParameters 3
spwithparameters 4

--VIEW THE STORED PROCEDURE
sp_helptext spshort;  --system defined procedure
--after execution above statement output is given below.......
--create proc spShort  
--as  
--select* from Details  
--go;

--OR RIGHT CLICK ON SP ->SCRIPT->CREATE TO->NEW QUERY WINDOW

--ALTER PROC
alter proc spshort
as
select * from details order by user_name
go

--DELETE THE PROCEDURE
drop proc spshort
--OR delete by right click on the proceure and delete in the object explorer

--ENCRYPTING THE TEXT OF PROCEDURE
alter proc spdisplaydetails
with encryption
as
select * from details
go

sp_helptext spdisplaydetails

--WITH OUTPUT PARAMETER  // keyword == out or output
create proc spShort @uid int , @uname varchar(50) output
as
select @uname=user_name from details where user_id=@uid
go

declare @user_name varchar(50)
exec spShort 5, @user_name output
print @user_name


--SYSTEM DEFINER PROCEDURES
--SP_HELP
sp_help spshort--procedure
sp_help details--table

--SP_HELPTEXT
sp_helptext spshort

--SP_DEPENDS
sp_depends spshort
sp_depends details

--CRUD OPRATION
--INSERT RECORD
create proc spinsertDetails
@uname varchar(50),@uage int
as
insert into details values(@uname,@uage)
go

spinsertdetails yashoda,52
spinsertdetails 'basu',41
spinsertdetails 'savitri',71

--DISPLAY DETAILS
create proc spdisplaydetails
as
select * from Details
go

spdisplaydetails

--UPDATE DETAILS
create proc spUpdateDetails
@uid int , @uname varchar(50)
as
update details
set user_name=@uname
where user_id=@uid
go

spUpdateDetails 5,Geeta

--DELETE RECORDS
create proc spDeleteDetails
@uid int
as
delete from details where user_id=@uid
go

spDeleteDetails 5
spDeleteDetails 9


