-- ============================================================
-- 03 GROUP BY AND AGGREGATE FUNCTIONS
-- ============================================================

-- SUM
-- Total salary by department

SELECT
    dept_id,
    SUM(salary) AS total_salary
FROM employees
GROUP BY dept_id;


-- COUNT
-- Number of employees in each department

SELECT
    dept_id,
    COUNT(emp_id) AS employee_count
FROM employees
GROUP BY dept_id;


-- AVG, MIN and MAX

SELECT
    dept_id,
    AVG(salary) AS average_salary,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM employees
GROUP BY dept_id;


-- WHERE with GROUP BY
-- WHERE filters rows BEFORE grouping.

SELECT
    dept_id,
    SUM(salary) AS total_salary
FROM employees
WHERE salary > 50000
GROUP BY dept_id;


-- Practical example:
-- Departments having more than one employee

SELECT
    d.dept_name,
    COUNT(e.emp_id) AS employee_count
FROM employees e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.emp_id) > 1;


-- Key aggregate functions:
-- SUM   -> total
-- COUNT -> count
-- AVG   -> average
-- MIN   -> minimum
-- MAX   -> maximum