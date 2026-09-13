-- ============================================
-- 15_UNION_UNION_ALL.sql
-- UNION and UNION ALL
-- ============================================

CREATE TABLE sales_online (
    order_id INT,
    customer VARCHAR(50),
    amount INT
);

INSERT INTO sales_online
(order_id, customer, amount)
VALUES
(1, 'Rahul', 1000),
(2, 'Priya', 1500),
(3, 'Amit', 2000);


CREATE TABLE sales_store (
    order_id INT,
    customer VARCHAR(50),
    amount INT
);

INSERT INTO sales_store
(order_id, customer, amount)
VALUES
(4, 'Sneha', 2500),
(5, 'Vikram', 1800),
(3, 'Amit', 2000);


-- UNION ALL
-- Keeps duplicate rows

SELECT order_id, customer, amount
FROM sales_online

UNION ALL

SELECT order_id, customer, amount
FROM sales_store;


-- UNION
-- Removes identical duplicate rows

SELECT order_id, customer, amount
FROM sales_online

UNION

SELECT order_id, customer, amount
FROM sales_store;