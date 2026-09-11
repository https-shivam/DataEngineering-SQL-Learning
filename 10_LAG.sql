-- ============================================================
-- 10 LAG()
-- ============================================================

-- LAG() returns a value from a PREVIOUS row.


-- Basic syntax:
--
-- LAG(column_name) OVER (
--     ORDER BY column_name
-- )


-- Example:
-- monthly_sales
--
-- month   sales
-- Jan     10000
-- Feb     12000
-- Mar     15000
-- Apr     13000


SELECT
    month,
    sales,
    LAG(sales) OVER (
        ORDER BY month
    ) AS previous_sales
FROM monthly_sales;


-- Expected result:
--
-- Jan  10000  NULL
-- Feb  12000  10000
-- Mar  15000  12000
-- Apr  13000  15000


-- LAG with PARTITION BY
--
-- Previous salary for each employee separately.

SELECT
    employee,
    month,
    salary,
    LAG(salary) OVER (
        PARTITION BY employee
        ORDER BY month
    ) AS previous_salary
FROM employee_salary;


-- Salary difference from previous month

WITH monthly_salary AS (
    SELECT
        employee,
        month,
        salary,
        LAG(salary) OVER (
            PARTITION BY employee
            ORDER BY month
        ) AS previous_salary
    FROM employee_salary
)
SELECT
    employee,
    month,
    salary,
    previous_salary,
    salary - previous_salary AS salary_difference
FROM monthly_salary;


-- Important:
--
-- LAG = previous row
-- LEAD = next row
--
-- PARTITION BY = restart calculation for each group/entity
-- ORDER BY = tells SQL what "previous" means