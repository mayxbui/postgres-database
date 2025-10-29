SELECT 
    *
FROM production.product;

SELECT 
    *
FROM production.productcosthistory;

CREATE OR REPLACE VIEW vw_products AS (
    SELECT
        p.productid,
        p.name,
        p.color,
        p.size,
        p.style,
        h.standardcost,
        h.enddate,
        h.startdate

    FROM
        production.product p
        JOIN production.productcosthistory h ON p.productid = h.productid
)

SELECT
    *
FROM 
    vw_products;