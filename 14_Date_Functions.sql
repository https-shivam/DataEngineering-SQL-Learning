-- ============================================
-- 14_Date_Functions.sql
-- Date Functions and Date Filtering
-- ============================================

-- Sample table

CREATE TABLE orders (
    order_id INT,
    customer VARCHAR(50),
    amount INT,
    order_date DATE
);

INSERT INTO orders
(order_id, customer, amount, order_date)
VALUES
(1, 'Rahul', 1500, '2025-01-15'),
(2, 'Priya', 2200, '2025-02-20'),
(3, 'Amit', 1800, '2025-02-25'),
(4, 'Sneha', 3000, '2025-03-10'),
(5, 'Vikram', 2500, '2025-03-18');


-- Extract year, month and day

SELECT
    customer,
    order_date,
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    EXTRACT(DAY FROM order_date) AS order_day
FROM orders;


-- Orders during February 2025

SELECT *
FROM orders
WHERE order_date BETWEEN '2025-02-01' AND '2025-02-28';


-- Using >= and <=

SELECT *
FROM orders
WHERE order_date >= '2025-02-01'
  AND order_date <= '2025-02-28';


-- Timestamp-safe date filtering

SELECT *
FROM orders
WHERE order_date >= '2025-03-01'
  AND order_date < '2025-04-01';


-- Current date

SELECT CURRENT_DATE;


-- Orders after a specific date

SELECT *
FROM orders
WHERE order_date > '2025-02-20';


-- Orders after today

SELECT *
FROM orders
WHERE order_date > CURRENT_DATE;


-- Orders from the last 7 days

SELECT *
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL 7 DAY;


-- Orders from the last 30 days

SELECT *
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL 30 DAY;