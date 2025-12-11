USE junk_removal_db;

-- ============================================
-- QUERY 1: List all jobs with customer + employee names
-- (JOIN between CUSTOMER, EMPLOYEE, JOB)
-- ============================================
SELECT 
    JOB.job_id,
    CUSTOMER.first_name AS customer_first,
    CUSTOMER.last_name AS customer_last,
    EMPLOYEE.name AS employee_name,
    JOB.date,
    JOB.time,
    JOB.status,
    JOB.total_cost
FROM JOB
JOIN CUSTOMER ON JOB.customer_id = CUSTOMER.customer_id
JOIN EMPLOYEE ON JOB.employee_id = EMPLOYEE.employee_id;

-- ============================================
-- QUERY 2: List all junk items for each job
-- (JOIN JOB + JUNK_ITEM)
-- ============================================
SELECT 
    JOB.job_id,
    JUNK_ITEM.description,
    JUNK_ITEM.estimated_weight,
    JUNK_ITEM.price
FROM JUNK_ITEM
JOIN JOB ON JUNK_ITEM.job_id = JOB.job_id;

-- ============================================
-- QUERY 3: Show all completed jobs with payments
-- (JOIN JOB + PAYMENT)
-- ============================================
SELECT 
    JOB.job_id,
    JOB.status,
    PAYMENT.amount,
    PAYMENT.payment_method,
    PAYMENT.payment_date
FROM JOB
JOIN PAYMENT ON JOB.job_id = PAYMENT.job_id
WHERE JOB.status = 'Completed';

-- ============================================
-- QUERY 4: Calculate total revenue earned
-- (SUM function)
-- ============================================
SELECT 
    SUM(amount) AS total_revenue
FROM PAYMENT;

-- ============================================
-- VIEW 1: Customer Job Summary
-- (most common view used by dispatchers)
-- ============================================
CREATE OR REPLACE VIEW view_customer_jobs AS
SELECT 
    CUSTOMER.customer_id,
    CUSTOMER.first_name,
    CUSTOMER.last_name,
    JOB.job_id,
    JOB.date,
    JOB.status,
    JOB.total_cost
FROM CUSTOMER
LEFT JOIN JOB ON CUSTOMER.customer_id = JOB.customer_id;

-- ============================================
-- VIEW 2: Employee Job Assignments
-- (shows which employee worked which job)
-- ============================================
CREATE OR REPLACE VIEW view_employee_jobs AS
SELECT
    EMPLOYEE.employee_id,
    EMPLOYEE.name AS employee_name,
    JOB.job_id,
    JOB.date,
    JOB.status
FROM EMPLOYEE
LEFT JOIN JOB ON EMPLOYEE.employee_id = JOB.employee_id;

-- ============================================
-- EXTRA: Show heaviest junk items
-- ============================================
SELECT 
    description,
    estimated_weight
FROM JUNK_ITEM
ORDER BY estimated_weight DESC
LIMIT 5;

-- ============================================
-- EXTRA: Show customers with unpaid jobs
-- (jobs that have cost but no payment record)
-- ============================================
SELECT 
    CUSTOMER.first_name,
    CUSTOMER.last_name,
    JOB.job_id,
    JOB.total_cost
FROM JOB
LEFT JOIN PAYMENT ON JOB.job_id = PAYMENT.job_id
JOIN CUSTOMER ON JOB.customer_id = CUSTOMER.customer_id
WHERE PAYMENT.payment_id IS NULL
AND JOB.total_cost > 0;
