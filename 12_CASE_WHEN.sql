-- ============================================
-- CASE WHEN
-- ============================================

-- CASE WHEN works like IF / ELSE IF / ELSE.

-- Basic syntax:
-- CASE
--     WHEN condition THEN result
--     WHEN condition THEN result
--     ELSE result
-- END

-- 1. Salary classification
SELECT
employee,
salary,
CASE
WHEN salary >= 100000 THEN 'High'
WHEN salary >= 60000 THEN 'Medium'
ELSE 'Low'
END AS salary_category
FROM employees;

-- 2. Data quality classification
SELECT
transaction_id,
amount,
CASE
WHEN amount IS NULL THEN 'Missing Amount'
WHEN amount < 0 THEN 'Invalid Amount'
WHEN amount = 0 THEN 'Zero Amount'
ELSE 'Valid'
END AS data_quality_status
FROM transactions;

-- 3. Conditional counting using SUM(CASE WHEN...)
SELECT
SUM(
CASE
WHEN salary >= 60000 THEN 1
ELSE 0
END
) AS high_earners,

```
SUM(
    CASE
        WHEN salary < 60000 THEN 1
        ELSE 0
    END
) AS low_earners,

COUNT(*) AS total_employees
```

FROM employees;

-- 4. Data quality summary
SELECT
SUM(
CASE
WHEN amount > 0 THEN 1
ELSE 0
END
) AS valid_transactions,

```
SUM(
    CASE
        WHEN amount < 0 THEN 1
        ELSE 0
    END
) AS invalid_transactions,

SUM(
    CASE
        WHEN amount IS NULL THEN 1
        ELSE 0
    END
) AS missing_amounts,

SUM(
    CASE
        WHEN amount = 0 THEN 1
        ELSE 0
    END
) AS zero_amounts
```

FROM transactions;

-- Important pattern:
-- SUM(CASE WHEN condition THEN 1 ELSE 0 END)
-- is commonly used for conditional counting.
