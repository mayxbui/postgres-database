-- select * from person.person;

--QUIZ
--1 67
select COUNT(DISTINCT jobtitle) from humanresources.employee

--2 26
select jobtitle, count(jobtitle) as cnt from humanresources.employee GROUP BY jobtitle order by cnt desc

--3 Buyer
select jobtitle, count(jobtitle) from humanresources.employee group by jobtitle having count(jobtitle)=9

--4 6700
-- select * from sales.salesperson
select max(bonus) from sales.salesperson

--5 75
select min(bonus) from sales.salesperson where bonus>0

--6 8
select territoryid, bonus from sales.salesperson where bonus>0 group by territoryid, bonus order by bonus asc limit 1

--7 5
select territoryid, bonus from sales.salesperson group by territoryid, bonus order by bonus desc limit 1

--8 34
--select * from sales.specialoffer
select description, length(description) as maxlen from sales.specialoffer order by maxlen desc limit 1

--9 255
--select * from information_schema.columns
select character_maximum_length FROM information_schema.columns where table_name='specialoffer' and column_name='description';

--10 290
--select * from sales.salesorderheader
select salesorderid, orderdate, totaldue from sales.salesorderheader where orderdate>='2012-09-01' and orderdate<'2012-10-01' and totaldue>1000
select count(*) from sales.salesorderheader where orderdate>='2012-09-01' and orderdate<'2012-10-01' and totaldue>=1000

--11
select salesorderid, territoryid, totaldue from sales.salesorderheader where totaldue>=23000 and (salespersonid=279 or territoryid=6)
select count(*) from sales.salesorderheader where totaldue>23000 and (salespersonid=279 or territoryid=6)


--BREAK OUT ROOM
--1
select * from person.person
select lastname, length(lastname) from person.person

--2
select * from production.product
select name, length(name) from production.product

--3
select * from person.emailaddress
select emailaddress, position('@' in emailaddress) from person.emailaddress

--4
select * from humanresources.employee
select jobtitle, position(' ' in jobtitle) from humanresources.employee

--5
select upper(lastname) from person.person

--6
select * from person.address
select distinct upper(city) from person.address

--7
select initcap(jobtitle) as "Proper Job Title" from humanresources.employee

--8
select * from production.productsubcategory
select trim(name) from production.productsubcategory 

--9
select trim(trailing ' ' from firstname) from person.person

--10
select * from person.person
select column_name, data_type from information_schema.columns where table_name='person' and table_schema='person'
