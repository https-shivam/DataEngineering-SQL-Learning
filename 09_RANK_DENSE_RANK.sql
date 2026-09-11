-- ============================================================
-- 09 RANK() AND DENSE_RANK()
-- ============================================================


-- RANK()
--
-- Ties receive the same rank.
-- Gaps appear after ties.
--
-- Example:
-- Salary: 100, 100, 80, 70
-- Rank:     1,   1,  3,  4


SELECT
    name,
    dept_id,
    salary,
    RANK() OVER (
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


-- DENSE_RANK()
--
-- Ties receive the same rank.
-- No gaps appear.
--
-- Example:
-- Salary: 100, 100, 80, 70
-- Rank:     1,   1,  2,  3


SELECT
    name,
    dept_id,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


-- Top 2 salary levels in every department

WITH top_salary AS (
    SELECT
        name,
        dept_id,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT
    name,
    dept_id,
    salary
FROM top_salary
WHERE salary_rank <= 2;


-- Quick comparison:
--
-- ROW_NUMBER  -> 1, 2, 3, 4
-- RANK        -> 1, 1, 3, 4
-- DENSE_RANK  -> 1, 1, 2, 3