SELECT * FROM sales.salesterritory
SELECT * FROM sales.salesperson
SELECT * FROM person.person

--1 Include NULL value
SELECT p.businessentityid id,
    t.name territory
FROM sales.salesperson p
    LEFT JOIN sales.salesterritory t ON p.territoryid = t.territoryid
ORDER BY t.name

--optional
SELECT
    p.firstname || ' ' || p.lastname name,
    sp.businessentityid id,
    t.name territory
FROM sales.salesperson sp
    LEFT JOIN sales.salesterritory t ON sp.territoryid = t.territoryid
    INNER JOIN person.person p ON p.businessentityid = sp.businessentityid
ORDER BY t.name


--2 Only return match value, ignore null
SELECT p.businessentityid id,
    t.name territory
FROM sales.salesperson p
    INNER JOIN sales.salesterritory t ON p.territoryid = t.territoryid
ORDER BY t.name

--3
SELECT
    sp.businessentityid id,
    t.name territory_name,
    p.firstname first,
    p.lastname last
FROM 
    sales.salesperson sp
    RIGHT JOIN sales.salesterritory t ON sp.territoryid = t.territoryid
    LEFT JOIN person.person p ON p.businessentityid = sp.businessentityid
ORDER BY t.name

--4
--left
SELECT
    t.name territory,
    sp.businessentityid salepersonID
FROM
    sales.salesterritory t
    LEFT JOIN sales.salesperson sp ON sp.territoryid = t.territoryid

--right
SELECT
    t.name territory,
    sp.businessentityid salepersonID
FROM
    sales.salesterritory t
    RIGHT JOIN sales.salesperson sp ON sp.territoryid = t.territoryid

--full 1
SELECT
    t.name territory,
    sp.businessentityid salepersonID
FROM
    sales.salesterritory t
    FULL JOIN sales.salesperson sp ON sp.territoryid = t.territoryid

--full 2
select
    t.name territory,
    sp.businessentityid salepersonID,
    sp.salesquota quota
FROM sales.salesterritory t
    FULL JOIN sales.salesperson sp ON sp.territoryid = t.territoryid
WHERE sp.salesquota > 250000

