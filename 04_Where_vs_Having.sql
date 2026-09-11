-- ============================================================
-- 04 WHERE VS HAVING
-- ============================================================

-- WHERE filters individual rows BEFORE GROUP BY.

SELECT
    dept_id,
    SUM(salary) AS total_salary
FROM employees
WHERE salary > 50000
GROUP BY dept_id;


-- HAVING filters groups AFTER GROUP BY.

SELECT
    dept_id,
    SUM(salary) AS total_salary
FROM employees
GROUP BY dept_id
HAVING SUM(salary) > 130000;


-- Practical problem:
-- Find departments where:
-- 1. Total salary > 130000
-- 2. More than one employee

SELECT
    dept_id,
    SUM(salary) AS total_salary,
    COUNT(emp_id) AS employee_count
FROM employees
GROUP BY dept_id
HAVING SUM(salary) > 130000
   AND COUNT(emp_id) > 1;


-- Remember:
--
-- WHERE  -> filters rows
-- GROUP BY -> creates groups
-- HAVING -> filters groups