--1 17
select * from sales.salesperson
SELECT count(*) from sales.salesperson

--2 10
select * from sales.salesterritory
SELECT count(*) from sales.salesterritory

--3
--Field: territoryid
--14 records returned ?? bc there are NULLS 
--Relationship: 1:N : 1 territory can have many salesperson
--Primary key: businessentityid
--Foreign key: territoryid
select count(*) from sales.salesperson p join sales.salesterritory t on t.territoryid = p.territoryid

