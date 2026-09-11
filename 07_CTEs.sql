-- ============================================================
-- 07 CTE - COMMON TABLE EXPRESSIONS
-- ============================================================

-- CTE = Common Table Expression
--
-- It creates a temporary named result that can be
-- used by the main query.


-- Basic CTE

WITH salary_data AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT avg_salary
FROM salary_data;


-- Employees earning above average

WITH salary_data AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT
    e.name,
    e.salary
FROM employees e
WHERE e.salary > (
    SELECT avg_salary
    FROM salary_data
);


-- CTE with GROUP BY

WITH dept_sal AS (
    SELECT
        dept_id,
        SUM(salary) AS total_salary
    FROM employees
    GROUP BY dept_id
)
SELECT
    d.dept_name,
    e.total_salary
FROM dept_sal e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id
WHERE e.total_salary > 100000;


-- Highest-paid employee per department
-- WITHOUT ROW_NUMBER()

WITH max_salary AS (
    SELECT
        dept_id,
        MAX(salary) AS max_salary
    FROM employees
    GROUP BY dept_id
)
SELECT
    d.dept_name,
    e.name AS employee_name,
    e.salary
FROM employees e
JOIN max_salary m
    ON e.dept_id = m.dept_id
   AND e.salary = m.max_salary
JOIN departments d
    ON e.dept_id = d.dept_id;