-- BigBasket Capstone
-- Part 1 - Task 4: Aggregation and Joins


-- Query 1: INNER JOIN + GROUP BY + Aggregation
-- Calculate order count, total revenue, and average order value by category

SELECT
    p.category,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS average_order_value
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY p.category;


-- Query 2: HAVING
-- Show categories whose total revenue is greater than ₹10,000

SELECT
    p.category,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS average_order_value
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY p.category
HAVING SUM(o.amount_inr) > 10000;


-- Query 3: LEFT JOIN
-- Show every product, including products with zero orders

SELECT
    p.product_id,
    p.product_name,
    COUNT(o.order_id) AS order_count
FROM products AS p
LEFT JOIN orders AS o
    ON p.product_id = o.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY order_count;