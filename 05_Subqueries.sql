-- ============================================================
-- 05 SUBQUERIES
-- ============================================================

-- A subquery is a query inside another query.


-- Employees earning below company average

SELECT name
FROM employees
WHERE salary < (
    SELECT AVG(salary)
    FROM employees
);


-- Employees earning above company average

SELECT name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


-- Employees earning above the IT department average

SELECT name
FROM employees
WHERE salary > (
    SELECT AVG(e.salary)
    FROM employees e
    LEFT JOIN departments d
        ON e.dept_id = d.dept_id
    WHERE d.dept_name = 'IT'
);


-- Subquery used as a derived table

SELECT
    x.dept_id,
    x.total_salary
FROM (
    SELECT
        dept_id,
        SUM(salary) AS total_salary
    FROM employees
    GROUP BY dept_id
) x
WHERE x.total_salary > 100000;


-- IN with a subquery

SELECT name
FROM employees
WHERE dept_id IN (
    SELECT dept_id
    FROM departments
    WHERE dept_name IN ('IT', 'HR')
);