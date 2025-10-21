-- SELECT * FROM person.person

-- SELECT * FROM person.personphone

-- --1
-- SELECT p.firstname, p.lastname, ph.phonenumber 
-- FROM person.person p
-- INNER JOIN person.personphone ph
--     ON p.businessentityid = ph.businessentityid
-- --Yes because some people have multiple phone numbers

-- --2
-- SELECT p.FirstName, p.LastName, ph.PhoneNumber , t.PhoneNumberTypeID
-- FROM Person.Person p
-- INNER JOIN Person.PersonPhone ph 
--     ON p.BusinessEntityID=ph.BusinessEntityID
-- INNER JOIN Person.phonenumbertype t
--     ON ph.PhoneNumberTypeID=t.PhoneNumberTypeID
-- --Row count stay the same

-- --3
-- SELECT 
--     p.FirstName,
--     p.LastName,
--     ph.PhoneNumber,
--     t.Name PhoneType
-- FROM Person.Person p
-- INNER JOIN Person.PersonPhone ph
--     ON p.BusinessEntityID=ph.BusinessEntityID
-- INNER JOIN Person.PhoneNumberType t
--     ON ph.PhoneNumberTypeID = t.PhoneNumberTypeID
-- WHERE t.Name='Cell';
-- --people disappear if they don't have cell phone number

-- --4
-- SELECT 
--     t.Name AS PhoneType, 
--     COUNT(*) AS CountTotal
-- FROM Person.PersonPhone ph
-- INNER JOIN Person.PhoneNumberType t
--     ON ph.PhoneNumberTypeID = t.PhoneNumberTypeID
-- GROUP BY t.Name
-- ORDER BY CountTotal DESC;


SELECT * FROM Production.Product
SELECT * FROM Production.productcategory
SELECT * FROM Production.ProductSubcategory

--1
SELECT  
    s.Name SubcategoryName,
    p.Name CategoryName
FROM Production.Product p
JOIN Production.ProductSubcategory s
    ON p.productsubcategoryid = s.productsubcategoryid
--Not every product has a subcategory, some products have NULL in ProductSubcategoryID

--2
SELECT 
    c.Name CategoryName,
    s.Name SubcategoryName
FROM Production.productcategory c
JOIN Production.ProductSubcategory s
    ON c.productcategoryid = s.productcategoryid
--not every category will appear bc some category has no subcategory

--3
SELECT
    p.Name ProductName,
    c.Name CategoryName,
    s.Name SubcategoryName
FROM Production.Product p
JOIN Production.ProductSubcategory s
    ON p.productsubcategoryid = s.productsubcategoryid
JOIN Production.ProductCategory c
    ON s.productcategoryid = c.productcategoryid

--4
SELECT 
    c.Name CategoryName, 
    COUNT(p.Productid) Count
FROM Production.Product p
JOIN Production.ProductSubcategory s
    ON p.productsubcategoryid = s.productsubcategoryid
JOIN Production.ProductCategory c
    ON s.productcategoryid = c.productcategoryid
GROUP BY c.Name
ORDER BY Count DESC;

