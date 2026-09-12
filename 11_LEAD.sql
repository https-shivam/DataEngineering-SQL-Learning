-- ============================================
-- LEAD FUNCTION
-- ============================================

-- LEAD() returns the value from the next row.
-- It is the opposite of LAG().

-- Basic syntax:
-- LEAD(column_name) OVER (
--     PARTITION BY column
--     ORDER BY column
-- )

-- Example table:
-- employee_salary
-- employee | month    | salary
-- Rahul    | January  | 50000
-- Rahul    | February | 55000
-- Rahul    | March    | 60000
-- Rahul    | April    | 58000
-- Priya    | January  | 65000
-- Priya    | February | 68000
-- Priya    | March    | 70000
-- Priya    | April    | 72000

-- 1. Get the next month's salary
SELECT
employee,
month,
salary,
LEAD(salary) OVER (
PARTITION BY employee
ORDER BY month
) AS next_salary
FROM employee_salary;

-- 2. Calculate salary difference with the next month
WITH emp_salary_diff AS (
SELECT
employee,
month,
salary,
LEAD(salary) OVER (
PARTITION BY employee
ORDER BY month
) AS next_salary
FROM employee_salary
)
SELECT
employee,
month,
salary,
next_salary,
next_salary - salary AS salary_difference
FROM emp_salary_diff;

-- Important:
-- LEAD() looks at the next row.
-- The last row for each employee has no next row,
-- so LEAD() returns NULL.
-- LEAD() is commonly used for comparing current
-- records with future records.
