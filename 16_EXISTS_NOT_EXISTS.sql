-- ============================================
-- 16_EXISTS_NOT_EXISTS.sql
-- EXISTS and NOT EXISTS
-- ============================================

CREATE TABLE customers (
    customer_id INT,
    customer VARCHAR(50)
);

INSERT INTO customers
(customer_id, customer)
VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit'),
(4, 'Sneha');


CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    amount INT
);

INSERT INTO orders
(order_id, customer_id, amount)
VALUES
(101, 1, 1000),
(102, 1, 1500),
(103, 2, 2000),
(104, 3, 1200);


-- Customers who have at least one order

SELECT
    c.customer_id,
    c.customer
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);


-- Customers who do not have any orders

SELECT
    c.customer_id,
    c.customer
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);