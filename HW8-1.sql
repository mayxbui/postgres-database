--1
SELECT count(*) from production.product

--2
--Incorrect bc return by product name: SELECT AVG(ListPrice) FROM Production.Product GROUP BY Name;
SELECT AVG(ListPrice) FROM Production.Product;

--3
select sum(OrderQty) from sales.salesorderdetail

--4
select * from production.product
select DISTINCT productsubcategoryid, avg(listprice) from production.product group by productsubcategoryid

--5
select name from production.product order by name asc

--6
select name, listprice from production.product order by listprice desc

--7
select * from production.product where color='Red' and listprice>1000

--8
select productsubcategoryid, count(*) from production.product group by productsubcategoryid

--9
SELECT * FROM Production.Product WHERE Color = 'Red' OR Color = 'Blue';

--10
SELECT distinct City FROM Person.Address;

--11
SELECT DISTINCT Color FROM Production.Product;

--12
select name, listprice from production.product where listprice BETWEEN 100 and 500;

--13
SELECT * FROM Sales.SalesOrderHeader WHERE OrderDate BETWEEN '2013-01-01' AND '2013-12-31';

--14
SELECT Name, Color FROM Production.Product WHERE Color IN ('Red','Blue','Black');

--15
SELECT Name, Color FROM Production.Product WHERE Color NOT IN ('Red','Blue');

--16
SELECT LastName FROM Person.Person WHERE LastName LIKE 'Sm%';

--17
SELECT Name FROM Production.Product WHERE Name LIKE '%Bike';

--18
SELECT NAME FROM production.product WHERE NAME like '__a%';

--19
select * from person.person;
select pg_typeof(suffix) from person.person limit 1;