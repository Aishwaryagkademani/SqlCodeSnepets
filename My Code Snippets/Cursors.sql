use demo

--create table tblproduct(
--pid int,
--pName varchar(50),
--pPrice int,
--cid int)

----drop table tblproduct

--insert into tblproduct values(11,'bocaly',40,2),(12,'wheat',50,1),(13,'oil',100,2),(14,'jagary',80,3),(15,'pizza',150,1)
insert into tblproduct values(13,'rice',80,4),(14,'egg',40,6),(15,'olive oil',250,7),(16,'berries',1000,5),(17,'rava',400,7)
--select * from tblproduct

--create table Pcustomer(
--cid int primary key,
--cName varchar(50),
--location varchar(50))

--insert into Pcustomer values(1,'ganesh','kanpur'),(2,'tony','london'),(3,'honey','germany')
insert into Pcustomer values(4,'ramesh','india'),(5,'uma','london'),(6,'yanusha','germany'),(7,'sanvi','india')
--select * from Pcustomer

--CURSOR 
--steps to use cursor
declare @prodname varchar(50),@price int;  --declare variable in which the data is to be stored

--1)CREATION OF CURSOR (using declare keyword and cursor data type)
declare prod_cursor cursor for select pname , pprice from tblproduct

--2)open cursor
open prod_cursor;

--3)fetch the data using cursor
fetch next from prod_cursor into @prodname ,@price;

--4)fetch the data till the end of result set
while(@@FETCH_STATUS=0)
begin
	print 'product name = '+ @prodname+'  product price = '+cast(@price as varchar)
	fetch next from prod_cursor into @prodname,@price;
end;

--5)close the cursor
close prod_cursor

--6)deallocate cursor
deallocate prod_cursor



--EXAMPLE= change the price of procduct of customer whose location is london and germany

declare @custId int ;
declare Twotable_cursor cursor for select cid from tblproduct

open twotable_cursor;

fetch next from twotable_cursor into @custid;
declare @loc varchar(50);
while( @@FETCH_STATUS=0)
begin
	 select @loc=location from pcustomer where cid=@custId;
	if(@loc = 'germany')
	begin
		update tblproduct set pprice=pprice-(pprice*50/100) where cid=@custId;
	end;

	if(@loc = 'londan')
	begin
		update tblproduct set pprice=pprice-(pprice*20/100) where cid=@custId;
	end;

	if(@loc = 'india')
	begin
		update tblproduct set pprice=pprice-(pprice*40/100) where cid=@custId;
	end;

	fetch next from twotable_cursor into @custid;
end;

close twotable_cursor;
deallocate twotable_cursor;


select * from tblproduct
select * from Pcustomer

update tblproduct set pPrice=100 where cid=1
--replacing the cursors using joins 
update tblproduct 
set pprice=case
				when location ='germany' then pprice+(pprice*50/100)
				when location ='london' then pprice+(pprice*20/100)
				when location ='india' then pprice+(pprice*40/100)
				else			--if else statement is not there then the columns which don't match with above case statements are updated to null
				pprice
				end
	from tblproduct p join Pcustomer c on p.cid=c.cid

	
select * from tblproduct
select * from Pcustomer
