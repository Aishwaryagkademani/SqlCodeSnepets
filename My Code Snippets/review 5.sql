use review3

--1)Imagine a table named Products with columns ProductID, ProductName, Price, and StockQuantity. Write SQL queries to:

create table Product(
prod_id int,
prod_name varchar(50),
price int,
stock_quantity int)

insert into Product values(1,'product-1',50,40),(2,'product-2',30,60),(3,'product-3',150,100),(4,'product-4',170,200),(5,'product-5',48,250);
insert into Product values(6,'product-6',68,230)

select * from product

--Select products with a price less than 50.
select * from Product where price<50
select prod_name from Product where price<50;

--Retrieve products with a stock quantity greater than 100.
select * from Product where stock_quantity > 100

--Select products with a price between 20 and 100.
select * from product where price between 20 and 100


--2)Consider a table named Orders with columns OrderID, CustomerID, OrderDate, and TotalAmount. Write SQL queries to:

create table Orders(
orderId int,
customerId int,
orderDate date,
totalAmount int)

insert into Orders values(1,11,'2023/02/20',5000)
insert into Orders values(2,12,'2021/12/03',50)
insert into Orders values(3,12,'2001/02/28',100)
insert into Orders values(4,11,'1999/12/03',250)
insert into Orders values(5,12,'2011/05/07',700)

select * from orders

--Select all orders and arrange them in descending order based on the OrderDate.
select * from orders order by orderDate desc

--Retrieve orders for a specific CustomerID and arrange them in ascending order based on TotalAmount.
select * from orders where customerId=12 order by totalAmount asc

--Select orders with a total amount greater than 500, ordered by TotalAmount in descending order.
select * from orders where totalAmount>500 order by totalAmount desc 


--3)Consider two tables, Customers with columns CustomerID, FirstName, LastName, and Orders with columns OrderID, CustomerID, OrderDate, and TotalAmount. Write SQL queries to:

create table Customers(
customerId int,
Fname varchar(50),
Lname varchar(50))

insert into Customers values(11,'rama','patil'),(12,'tanaya','sharma'),(13,'fara','khan')

select * from Customers

--Retrieve the customer information along with their order details.
select c.customerId,fname,lname,orderId ,orderDate ,totalAmount  from Customers c join Orders o on c.customerId=o.customerId  order by customerId

--Select customers who have not placed any orders.
select c.customerId,fname,lname from Customers c left join Orders o on c.customerId=o.customerId where orderid is null order by customerId

--Find the total amount spent by each customer.
select o.customerId,sum(totalAmount) [total amount of customer] from Customers c join Orders o on c.customerId=o.customerId  group by o.customerId order by customerId



--4)Consider two tables, Customers with columns CustomerID, FirstName, LastName, and Orders with columns OrderID, CustomerID, OrderDate, and TotalAmount. Write SQL queries to:

--Find the average total amount spent by customers.
select o.customerId,avg(totalAmount)[avgerage total amount] from Customers c join Orders o on c.customerId=o.customerId  group by o.customerId order by customerId

--Retrieve a list of customers who have spent more than the average total amount.
create view customer_avg
as
select o.customerId,avg(totalAmount)[avgerage total amount] from Customers c join Orders o on c.customerId=o.customerId  group by o.customerId 

alter view customer_sum
as
select o.customerId,sum(totalAmount) [sum of total amount] from Customers c join Orders o on c.customerId=o.customerId  group by o.customerId


select c.customerId,fname,lname,[avgerage total amount],[sum of total amount] from (Customers c join customer_avg v on c.customerId=v.customerId ) join customer_sum s on 
s.customerId=v.customerId where s.[sum of total amount]>v.[avgerage total amount]


