-- ============================================================
-- 01 SQL BASICS
-- Data Engineering SQL Learning
-- ============================================================

-- Basic SELECT
SELECT name, salary
FROM employees;

-- SELECT all columns
SELECT *
FROM employees;

-- WHERE - filter rows
SELECT name, salary
FROM employees
WHERE salary > 60000;

-- Multiple conditions
SELECT name, salary
FROM employees
WHERE salary > 50000
  AND dept_id = 10;

-- ORDER BY
SELECT name, salary
FROM employees
ORDER BY salary DESC;

-- DISTINCT
SELECT DISTINCT dept_id
FROM employees;

-- Column aliases
SELECT name AS employee_name,
       salary AS employee_salary
FROM employees;

-- INSERT
INSERT INTO employees (emp_id, name, dept_id, salary)
VALUES (101, 'Rahul', 10, 70000);

-- UPDATE
UPDATE employees
SET salary = 75000
WHERE emp_id = 101;

-- DELETE
DELETE FROM employees
WHERE emp_id = 101;