-- BigBasket Capstone
-- Part 1 - Task 3: Foundational SQL Queries


-- Query 1: WHERE
-- Find all orders from Bengaluru

SELECT o.*
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id
WHERE c.city = 'Bengaluru';


-- Query 2: DISTINCT
-- List every distinct product category

SELECT DISTINCT category
FROM products
ORDER BY category;


-- Query 3: ORDER BY + LIMIT
-- Find the 5 highest-value orders

SELECT *
FROM orders
ORDER BY amount_inr DESC
LIMIT 5;


-- Query 4: AS
-- Count all orders and give the result a clear alias

SELECT COUNT(*) AS total_orders
FROM orders;


-- Query 5: IN
-- Find orders paid using UPI or Credit Card

SELECT *
FROM orders
WHERE payment_mode IN ('UPI', 'Credit Card');


-- Query 6: BETWEEN
-- Find orders with amount between ₹500 and ₹1,000

SELECT *
FROM orders
WHERE amount_inr BETWEEN 500 AND 1000;


-- Query 7: NOT BETWEEN
-- Find orders with amount outside ₹500 to ₹1,000

SELECT *
FROM orders
WHERE amount_inr NOT BETWEEN 500 AND 1000;


-- Query 8: IS NULL
-- Find orders where no rating was recorded

SELECT *
FROM orders
WHERE rating IS NULL;