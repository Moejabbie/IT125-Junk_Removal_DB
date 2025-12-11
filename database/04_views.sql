-- 04_views.sql
-- Views for Junk Removal Database Project
-- Author: Moe Jabbie

-- View 1: Customer Job History
CREATE OR REPLACE VIEW v_customer_job_history AS
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    j.job_id,
    j.job_date,
    j.job_status,
    j.total_price
FROM customers c
JOIN jobs j ON c.customer_id = j.customer_id
ORDER BY c.customer_id, j.job_date DESC;

-- View 2: Employee Work Summary
CREATE OR REPLACE VIEW v_employee_work_summary AS
SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    COUNT(j.job_id) AS total_jobs_completed,
    SUM(j.total_price) AS total_revenue_generated
FROM employees e
LEFT JOIN jobs j ON e.employee_id = j.employee_id
GROUP BY e.employee_id;

-- View 3: Daily Revenue Report
CREATE OR REPLACE VIEW v_daily_revenue AS
SELECT
    job_date,
    COUNT(job_id) AS jobs_done,
    SUM(total_price) AS revenue
FROM jobs
GROUP BY job_date
ORDER BY job_date DESC;

-- View 4: Active Pending Jobs
CREATE OR REPLACE VIEW v_pending_jobs AS
SELECT 
    j.job_id,
    j.job_date,
    j.total_price,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM jobs j
JOIN customers c ON j.customer_id = c.customer_id
WHERE j.job_status = 'Pending'
ORDER BY j.job_date;
