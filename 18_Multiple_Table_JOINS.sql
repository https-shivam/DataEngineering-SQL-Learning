-- ============================================
-- 18_Multiple_Table_JOINS.sql
-- Joining Multiple Tables
-- ============================================

CREATE TABLE customers (
    customer_id INT,
    customer VARCHAR(50),
    city_id INT
);

INSERT INTO customers
(customer_id, customer, city_id)
VALUES
(1, 'Rahul', 101),
(2, 'Priya', 102),
(3, 'Amit', 101);


CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    amount INT
);

INSERT INTO orders
(order_id, customer_id, amount)
VALUES
(501, 1, 1000),
(502, 2, 1500),
(503, 3, 2000);


CREATE TABLE cities (
    city_id INT,
    city VARCHAR(50)
);

INSERT INTO cities
(city_id, city)
VALUES
(101, 'Pune'),
(102, 'Mumbai');


-- Multiple LEFT JOINs

SELECT
    o.order_id,
    c.customer,
    ci.city,
    o.amount
FROM customers c
LEFT JOIN orders o
    ON o.customer_id = c.customer_id
LEFT JOIN cities ci
    ON c.city_id = ci.city_id;


-- Multiple INNER JOINs

SELECT
    o.order_id,
    c.customer,
    ci.city,
    o.amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN cities ci
    ON c.city_id = ci.city_id;