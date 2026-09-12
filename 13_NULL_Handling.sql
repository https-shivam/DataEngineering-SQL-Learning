-- ============================================
-- NULL HANDLING
-- ============================================

-- NULL means a value is unknown, missing,
-- or not available.
--------------------

-- NULL is NOT:
-- 0
-- ''
-- 'NULL'

-- 1. Find rows where a value is NULL
SELECT *
FROM employees
WHERE salary IS NULL;

-- 2. Find rows where a value is NOT NULL
SELECT *
FROM employees
WHERE salary IS NOT NULL;

-- IMPORTANT:
-- Do NOT use:
-- salary = NULL
----------------

-- Use:
-- salary IS NULL
-----------------

-- And:
-- salary IS NOT NULL

-- 3. NULL in calculations
-- If bonus is NULL:
-- salary + bonus returns NULL.
-------------------------------

-- Example:
-- 60000 + NULL = NULL

-- 4. COALESCE()
-- COALESCE(value, replacement)
-------------------------------

-- If value is NULL, replacement is used.
-- Otherwise the original value is returned.

-- Example:
SELECT
employee,
salary,
COALESCE(bonus, 0) AS bonus
FROM employees;

-- 5. Handle NULL salary and NULL bonus
SELECT
employee,
salary,
COALESCE(bonus, 0) AS bonus,
COALESCE(salary, 0) + COALESCE(bonus, 0) AS total_salary
FROM employees;

-- Example data:
-- employee | salary | bonus
-- Rahul    | 50000  | 5000
-- Priya    | 60000  | NULL
-- Amit     | NULL   | 10000
----------------------------

-- Expected result:
-- employee | salary | bonus | total_salary
-- Rahul    | 50000  | 5000  | 55000
-- Priya    | 60000  | 0     | 60000
-- Amit     | 0      | 10000 | 10000

-- Important:
-- COALESCE() does not permanently change the
-- original column.
-- It replaces NULL only for that expression/calculation.

-- NULL handling is especially important in
-- Data Engineering because source data can contain
-- missing values.
------------------

-- TODO:
-- NULLIF()
-- Division-by-zero handling
-- More advanced NULL handling
