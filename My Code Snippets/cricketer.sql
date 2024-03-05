Create database Demo;

create table cricketers(
player_id int,
name varchar(50)
);

insert into cricketers(player_id,name) values (1,'virat Kholi');
insert into cricketers(player_id,name) values (2,'Rhohit Sharma');
insert into cricketers(player_id,name) values (3,'Rhohit Sharma');
insert into cricketers(player_id,name) values (4,'Rhohit Sharma');
insert into cricketers(player_id,name) values (5,'Ram');
insert into cricketers(player_id,name) values (6,'hitesh kali');
insert into cricketers(player_id,name) values (12,'Talapati');
insert into cricketers(player_id,name) values (12,'Narayana');
insert into cricketers(player_id,name) values (63,'hitesh');


select * from cricketers;

--SELECT
select name from cricketers;
select distinct name from cricketers;
select count(distinct name) from cricketers;


--WHERE
select * from cricketers where name='Rhohit sharma';
select * from cricketers where player_id>4;
select * from cricketers where player_id<4;
select * from cricketers where player_id>=4;
select * from cricketers where player_id<=4;
select * from cricketers where player_id<>4;
select * from cricketers where player_id between 3 and 6;
select * from cricketers where name like 'r%';
select * from cricketers where name in ('rhohit sharma','ram') ;
select * from cricketers where not player_id>4;
select * from cricketers where not name='rhohit sharma';
select * from cricketers where name='rhohit sharma' or name='ram';
select * from cricketers where not name='rhohit sharma' or name='ram';
select * from cricketers where not name='rhohit sharma' and  name='ram';
select * from cricketers where not (name='rhohit sharma' or name='ram');
select * from cricketers where not name='rhohit sharma' or not name='ram';
select * from cricketers where not name='rhohit sharma' and not name='ram';

--ORDER BY
select * from cricketers order by name;
select * from cricketers order by name desc;
select * from cricketers order by player_id;
select * from cricketers order by player_id desc;
select * from cricketers order by player_id , name;
select * from cricketers order by name ,player_id desc;
select * from cricketers order by name , player_id;
select * from cricketers order by name desc , player_id asc;
select * from cricketers order by name asc , player_id desc;
select * from cricketers order by name desc , player_id desc;

select * from cricketers where player_id=12 and name='narayana';

--CREATE CUSTOMER TABLE
create table Customers(
CustomerName varchar(20),
ContactName varchar(20),
Address varchar(20),
City varchar(20),
PostalCode varchar(10),
Country varchar(20)
);

--INSERT INTO CUSTOMER TABLE
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 23', 'Stavanger', '4006', 'Norway');

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('White Clover Markets','Karl Jablonski','Ave.S.Suite 3B','Seattle','98128','USA');

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Wilman Kala','Matti Karttunen','Keskuskatu 45','Helsinki','21240','Finland');

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Wolski	Zbyszek','ul.',' Filtrowa68','Walla','01-012','Poland');

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal','null','null','Stavanger','null','Norway');

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Berglunds snabbköp','Christina Berglund','Berguvsvägen 8 ','Luleå','S-958 22','Sweden');

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('gardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('saninal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Spain');

INSERT INTO Customers (CustomerName,  Address, City, PostalCode, Country)
VALUES ('sandy', 'Skagen 21', 'Stavanger', '4006', 'Spain');

select * from Customers;

--AND
select * from Customers where city='stavanger'and PostalCode='4006' and address='skagen 23';
select * from Customers where city='stavanger'and CustomerName like'g%';
select * from Customers where country='norway'and CustomerName like'g%' or CustomerName like 'c%';
select * from Customers where country='norway'and (CustomerName like's%' or CustomerName like 'c%');

--OR
select * from Customers where country='norway' or Country = 'spain';
SELECT * FROM Customers WHERE City = 'stavanger' OR CustomerName LIKE 'G%' OR Country = 'Norway';
SELECT * FROM Customers WHERE Country = 'Spain' AND (CustomerName LIKE 's%' OR CustomerName LIKE 'R%');
SELECT * FROM Customers WHERE Country = 'Spain' AND CustomerName LIKE 's%' OR CustomerName LIKE 'b%';

--NOT
select * from Customers where not city='stavanger';
select * from Customers where not CustomerName like 'w%';
select * from Customers where not CustomerName like 'w%' or CustomerName like 'c%';
select * from Customers where not CustomerName like 'w%' and not CustomerName like 'c%';
select * from Customers where Country not in ('norway', 'spain');

select * from cricketers where not player_id between 7 and 100;
--select * from cricketers where player_id between 7 and 100;
select * from cricketers where not player_id < 12;
select * from cricketers where not player_id >4;

--INSERT INTO
--(ALL VALUES)
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Brunala gonjalvis','Brunala', 'Skagen', 'Satara', '4854', 'Spain');

--(NOT ALL COLUMNS)
INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');

--(INSERT MULTIPLE ROWS)
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'),
('Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', '4306', 'Norway'),
('Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK');

select * from Customers;

--SQL NULL VALUES
--(IS NULL)
select customername,country from Customers where Address is null;
select customername,country from Customers where  ContactName is null;
select customername,country from Customers where  ContactName is not null;

--UPDATE
--(UPDATE TABLE)
update Customers set CustomerName='Tina' where country='norway';
--select * from Customers;
update Customers set Address='Dharavhi';

--DELETE(TABLE RECORDS)
delete from Customers where city='satara';
--(DELETING ALL THE RECORDS)
delete from cricketers;
select * from cricketers;
--(DELETE A TABLE)
drop table cricketers;
select * from Customers;

--SQL TOP, LIMIT, FETCH FIRST or ROWNUM Clause
--SELECT TOP
select top 3 * from customers;
select top 50 percent * from Customers;
select top 3 CustomerName from customers where country='norway';
select top 4 * from Customers order by Country desc;
select top 4 * from Customers order by Country ;

--MAX
select min(country) from Customers;
select min(CustomerName) from Customers where country='spain';
--MIN
select max(country)from Customers;
select max(CustomerName) from Customers where country='spain';
--MAX ALIAS
select min(country) as smallestCountryName from Customers;

--COUNT FUNCTION
select count(*) from Customers;
select count(distinct country) from Customers;
select count(country) as [customer name starts with w] from Customers where CustomerName like 'w%';
select count(ContactName) as customer_name_starts_with_w from Customers;

--drop table product;
create table product(
productId int,
price int,
noOfproducts int,
productName varchar(20))

insert into product values(1,30,3,'coconut');
insert into product values(5,10,6,'Maggie'),(8,50,4,'dhal'),(3,20,2,'rava');
insert into product values(5,10,6,'ragie'),(8,50,4,'ghee'),(3,20,2,'rangolie');
insert into product values(1,80,7,'coconut');
insert into product values(15,150,8,'Mainoagie');

select * from product;

--SUM FUNCTION
select sum(price) from product;
select sum(price*noofproducts) as [total price] from product;
select sum(noofproducts) as [total no of products] from product;
select sum(noofproducts*10) as [total no of products] from product;
select sum(price * noofproducts) from product where productId=1;
select sum(price) from product where productId=1;
select sum(noofproducts) from product where productId=1;

--AVG FUNCTION(AVERAGE FUNCTIONS)
select avg(price) [average of prices of products]from product;
select avg(price*noofproducts)from product;
select avg(price)from product where productId=1;
select avg(price*noofproducts)from product where productId=1;
select productName name from product where price>(select avg(price) from product);


--LIKE (USED WITH WILDCARDS)
select * from product where productName like 'r%';
select * from product where productName like 'r__ie';
select * from product where productName like '%g%';
select * from product where productName like 'co%';
select * from product where productName like 'ra%';
select * from product where productName like 'r%' or productName like 'c%' or productName like 'g%';
select * from product where productName like '%ie';
select * from product where productName like 'r%gie';
select * from product where productName like '%ag%';
select * from product where productName like 'g__%';
select * from product where productName like '_o%';
select * from product where productName like 'dhal';
select * from product where productName like 'd%l';






