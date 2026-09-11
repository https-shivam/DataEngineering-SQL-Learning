-- ============================================================
-- 08 ROW_NUMBER()
-- ============================================================

-- ROW_NUMBER assigns a unique sequential number
-- to each row inside a partition.


SELECT
    name,
    dept_id,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS rn
FROM employees;


-- Highest-paid employee from each department

WITH ranked_employees AS (
    SELECT
        name,
        dept_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS rn
    FROM employees
)
SELECT
    name,
    dept_id,
    salary
FROM ranked_employees
WHERE rn = 1;


-- Top 2 employees from each department

WITH ranked_employees AS (
    SELECT
        name,
        dept_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS rn
    FROM employees
)
SELECT
    name,
    dept_id,
    salary
FROM ranked_employees
WHERE rn IN (1, 2);


-- Latest order for every customer

WITH ranked_orders AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date DESC
        ) AS rn
    FROM orders
)
SELECT
    customer_id,
    order_id,
    order_date
FROM ranked_orders
WHERE rn = 1;


-- Important:
-- Window function aliases such as rn cannot normally
-- be filtered directly in WHERE at the same query level.
-- Use a CTE or subquery.