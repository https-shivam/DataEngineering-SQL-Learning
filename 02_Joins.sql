-- ============================================================
-- 02 JOINS
-- ============================================================

-- INNER JOIN
-- Returns only matching records from both tables.

SELECT
    e.name,
    e.salary,
    d.dept_name
FROM employees e
INNER JOIN departments d
    ON e.dept_id = d.dept_id;


-- LEFT JOIN
-- Keeps every record from the left table.

SELECT
    e.name,
    d.dept_name
FROM employees e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id;


-- Employees without a matching department

SELECT e.name
FROM employees e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;


-- Departments without employees

SELECT d.*
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;


-- Customers without orders

SELECT c.name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;


-- Customers who have orders

SELECT DISTINCT c.name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NOT NULL;


-- Important:
-- NULL should be checked using IS NULL / IS NOT NULL.
-- Do NOT use = NULL.