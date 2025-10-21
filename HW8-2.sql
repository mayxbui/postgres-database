--1
SELECT FirstName, length(FirstName) AS NameLength FROM Person.Person;

--2
SELECT Name, LENGTH(Name) AS ProductNameLength FROM Production.Product ORDER BY ProductNameLength DESC;

--3
SELECT EmailAddress, POSITION('@' IN EmailAddress) AS AtSymbolPosition FROM person.emailaddress

--4
SELECT JobTitle, POSITION (' ' IN JobTitle) AS FirstSpacePosition FROM HumanResources.Employee;

--5
SELECT LastName, UPPER(LastName) AS LastNameUpper FROM Person.Person;

--6
SELECT distinct upper(City) AS CityUpper FROM Person.Address order by CityUpper; 

--7
SELECT JobTitle, INITCAP(JobTitle) AS "Proper Job Title" FROM HumanResources.Employee;

--8
SELECT Name, TRIM(Name) AS TrimmedName FROM Production.ProductSubcategory;

--9
SELECT Name, TRIM(LEADING ' ' FROM Name) AS NoLeadingSpaces FROM Production.Product;

--10
SELECT FirstName, TRIM(TRAILING ' ' FROM FirstName) AS NoTrailingSpaces FROM Person.Person;

--11
SELECT Name, TRIM(BOTH ' ' FROM Name) AS CleanedName FROM Production.ProductSubcategory;

--12
RTIM()

--13
4

--14
5

--15
ANALYTICS

--16
Data Engineer

--17
the same

--18
SELECT COUNT(DISTINCT City) FROM Person.Address;

--19
SELECT ProductSubcategoryID, AVG(ListPrice) AS AvgPrice FROM Production.Product GROUP BY ProductSubcategoryID;

--20
UPPER
INITCAP
TRIM
LENGTH