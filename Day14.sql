--in-class demo for normalization - intro lesson: 3NF

CREATE SCHEMA normalization;


-- =========================================
-- NORMALIZATION
-- =========================================
-- This script creates a simple flat table, populates it with redundant data.
-- The goal is to convert this into 3NF - creating new tables as needed.  


-- ---------- CLEAN SLATE (safe drops) ----------
DROP VIEW  IF EXISTS normalization.v_orders_flat_simple_3nf;
DROP TABLE IF EXISTS normalization.orders;
DROP TABLE IF EXISTS normalization.products;
DROP TABLE IF EXISTS normalization.customers;
DROP TABLE IF EXISTS normalization.orders_flat_simple;

-- ---------- 1) FLAT TABLE (intentionally redundant) ----------
CREATE TABLE normalization.orders_flat_simple (
  order_id        BIGINT,
  order_date      DATE,
  customer_id     BIGINT,
  customer_name   TEXT,
  customer_city   TEXT,
  customer_state  CHAR(2),
  product_id      BIGINT,
  product_name    TEXT,
  unit_price      NUMERIC(12,2),
  quantity        INTEGER,
  line_subtotal   NUMERIC(12,2)
);

INSERT INTO normalization.orders_flat_simple VALUES
-- Alice places 2 orders (duplicated customer data)
(1101, '2023-11-10', 501, 'Alice Smith', 'Indianapolis', 'IN', 2001, 'Coffee Maker',     89.99, 1,  89.99),
(1102, '2023-11-13', 501, 'Alice Smith', 'Indianapolis', 'IN', 2002, 'Espresso Pods 24', 24.50, 3,  73.50),

-- Bob places 2 orders (duplicated customer + product metadata repeated)
(1103, '2023-11-12', 502, 'Bob Johnson', 'Louisville',   'KY', 2003, 'Electric Kettle',  39.95, 1,  39.95),
(1105, '2023-11-17', 502, 'Bob Johnson', 'Louisville',   'KY', 2003, 'Electric Kettle',  39.95, 2,  79.90),

-- Carol places 1 order
(1104, '2023-11-15', 503, 'Carol Diaz',  'Cincinnati',   'OH', 2001, 'Coffee Maker',     89.99, 1,  89.99);

-- Helpful queries to SHOW duplicates in class
SELECT * FROM normalization.orders_flat_simple ORDER BY order_id;
SELECT customer_id, customer_name, COUNT(*) FROM normalization.orders_flat_simple GROUP BY 1,2 ORDER BY 3 DESC;
SELECT product_id, product_name, COUNT(*) FROM normalization.orders_flat_simple GROUP BY 1,2 ORDER BY 3 DESC;

-- repetition: customers (id, name, city, state), products (id, name, price, quantity, line_subtotal)
-- Alice and Bob appear 2 times
-- If city changes, state also changes
-- Which product details are repeated? Why might that become a problem over time?
-- Electric Kettle appears 2 times, Coffee Maker appears 2 times
-- If product name changes, price also changes then..
-- If price or quanity changes, line_subtotal also changes
-- Mixed details: orders, customers, products 
-- If Bob only had 1 order, he would lose all his details (order, product) if it was deleted

-- order_id, customer_id, product_id

CREATE TABLE normalization.customers(
    customer_id     BIGINT,
    customer_name   TEXT,
    customer_city   TEXT,
    customer_state  CHAR(2)
);
INSERT INTO
    normalization.customers
SELECT DISTINCT
    customer_id,
    customer_name,
    customer_city,
    customer_state
FROM normalization.orders_flat_simple;

-- SELECT 
--     *
-- FROM 
--     normalization.customers 
-- ORDER BY 
--     customer_id;

CREATE TABLE normalization.products(
    product_id      BIGINT,
    product_name    TEXT,
    unit_price      NUMERIC(12,2)
);
INSERT INTO
    normalization.products
SELECT DISTINCT 
    product_id,
    roduct_name, 
    unit_price
FROM 
    normalization.orders_flat_simple;

-- SELECT 
--     *
-- FROM 
--     normalization.products
-- ORDER BY
--     product_id;


DROP TABLE IF EXISTS normalization.orders;
CREATE TABLE normalization.orders(
    order_id        BIGINT,
    order_date      DATE,
    customer_id     BIGINT
);
INSERT INTO
    normalization.orders
SELECT
    order_id,
    order_date,
    customer_id
FROM normalization.orders_flat_simple;

-- SELECT 
--     *
-- FROM 
--     normalization.orders 
-- ORDER BY 
--     order_id;

CREATE TABLE normalization.order_items(
    order_id        BIGINT,
    product_id      BIGINT,
    quantity        INTEGER,
    line_subtotal   NUMERIC(12,2)
);
INSERT INTO
    normalization.order_items
SELECT
    order_id,
    product_id,
    quantity,
    line_subtotal
FROM normalization.orders_flat_simple;

-- SELECT 
--     *
-- FROM 
--     normalization.order_items