-- ==========================================
-- SQL FOR DATA ANALYSIS - ECOMMERCE DATASET
-- ==========================================

-- 1. Display first 10 rows
SELECT * FROM data LIMIT 10;

-- 2. WHERE Clause
SELECT *
FROM data
WHERE Quantity > 10;

-- 3. ORDER BY
SELECT *
FROM data
ORDER BY UnitPrice DESC
LIMIT 10;

-- 4. GROUP BY
SELECT Country,
       COUNT(*) AS TotalOrders
FROM data
GROUP BY Country;

-- 5. Total Revenue by Country
SELECT Country,
       SUM(Quantity * UnitPrice) AS Revenue
FROM data
GROUP BY Country
ORDER BY Revenue DESC;

-- 6. Average Unit Price
SELECT AVG(UnitPrice) AS AveragePrice
FROM data;

-- 7. HAVING Clause
SELECT Country,
       SUM(Quantity * UnitPrice) AS Revenue
FROM data
GROUP BY Country
HAVING Revenue > 10000;

-- 8. Subquery
SELECT *
FROM data
WHERE UnitPrice >
(
    SELECT AVG(UnitPrice)
    FROM data
);

-- 9. Create View
CREATE VIEW country_revenue AS
SELECT Country,
       SUM(Quantity * UnitPrice) AS Revenue
FROM data
GROUP BY Country;

-- 10. View Results
SELECT * FROM country_revenue;

-- 11. Create Index
CREATE INDEX idx_customer
ON data(CustomerID);

-- ==========================================
-- JOINS
-- ==========================================

-- Create Customers Table
CREATE TABLE customers (
    CustomerID INTEGER,
    CustomerName TEXT
);

-- Insert Sample Data
INSERT INTO customers VALUES
(12346,'Rahul'),
(12347,'Priya'),
(12348,'Amit'),
(12349,'Neha'),
(12350,'Arjun');

-- INNER JOIN
SELECT d.CustomerID,
       c.CustomerName,
       d.Country
FROM data d
INNER JOIN customers c
ON d.CustomerID = c.CustomerID;

-- LEFT JOIN
SELECT c.CustomerName,
       d.Country
FROM customers c
LEFT JOIN data d
ON c.CustomerID = d.CustomerID;
