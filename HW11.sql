-- SELECT * FROM production.productsubcategory
-- SELECT * FROM production.productcategory

--1
SELECT 
    s.name "Subcategory Name",
    c.name "Category Name"
FROM
    production.productcategory c
JOIN 
    production.productsubcategory s
ON
    s.productcategoryid = c.productcategoryid
WHERE
    c.name LIKE 'C%'
