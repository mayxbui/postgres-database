--1
select * from production.product where color is null

--2
select avg(weight) from production.product where weight is not null

--3
select count(*)
from production.product; --504 count all the rows in table

select count(color) as countcolor
from production.product; --256 doesn't count null value

--4
select * from production.product where color in ('Silver', 'Black', 'Silver/Black')

--5
select * from production.product where color not in ('Silver', 'Black', 'Silver/Black')

--6
select name,listprice from production.product where listprice >=500 and listprice<=1000
select name,listprice from production.product where listprice BETWEEN 500 and 1000

--7
select * 
from sales.salesorderheader
where orderdate between '2013-01-01' and '2013-12-31'

--8
select * 
from production.product
where color in ('Red', 'Blue') or color is null 

--9
select name, color
from production.product
where color is not null;

select name, color
from production.product
where color != null;

--10
SELECT *
FROM person.emailaddress
WHERE emailaddress IS NULL;
