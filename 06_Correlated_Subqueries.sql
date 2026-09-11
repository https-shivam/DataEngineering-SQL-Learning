-- ============================================================
-- 06 CORRELATED SUBQUERIES
-- ============================================================

-- Problem:
-- Find employees whose salary is greater than
-- the average salary of THEIR OWN department.


SELECT
    e.name,
    e.dept_id,
    e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.dept_id = e.dept_id
);


-- Mental model:
--
-- Outer query:
-- e = current employee
--
-- Inner query:
-- e2 = employees in the same department
--
-- e2.dept_id = e.dept_id
-- connects the inner query to the current outer row.


-- Important:
-- This is different from a normal subquery because
-- the inner query depends on the current row of the outer query.