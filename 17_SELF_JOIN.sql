-- ============================================
-- 17_SELF_JOIN.sql
-- Self JOIN
-- ============================================

CREATE TABLE employee (
    employee_id INT,
    employee VARCHAR(50),
    manager_id INT
);

INSERT INTO employee
(employee_id, employee, manager_id)
VALUES
(1, 'Rahul', NULL),
(2, 'Priya', 1),
(3, 'Amit', 1),
(4, 'Sneha', 2);


-- Find employee and their manager

SELECT
    e.employee AS employee,
    m.employee AS manager
FROM employee e
LEFT JOIN employee m
    ON e.manager_id = m.employee_id;