USE junk_removal_db;

-- ============================================
-- INSERT CUSTOMERS
-- ============================================
INSERT INTO CUSTOMER (first_name, last_name, email, phone, address)
VALUES
('John', 'Doe', 'john@example.com', '555-1234', '123 Main St'),
('Jane', 'Smith', 'jane@example.com', '555-5678', '456 Oak Ave'),
('Michael', 'Brown', 'mike@example.com', '555-9999', '789 Pine Rd');

-- ============================================
-- INSERT EMPLOYEES
-- ============================================
INSERT INTO EMPLOYEE (name, phone, role)
VALUES
('Carlos Martinez', '555-2222', 'Driver'),
('Sarah Johnson', '555-3333', 'Helper'),
('Emily Davis', '555-4444', 'Dispatcher');

-- ============================================
-- INSERT JOBS
-- ============================================
INSERT INTO JOB (customer_id, employee_id, date, time, status, total_cost)
VALUES
(1, 1, '2025-01-10', '09:00', 'Completed', 150.00),
(2, 2, '2025-01-12', '14:00', 'Scheduled', 0.00),
(3, 1, '2025-01-14', '11:30', 'Completed', 220.75);

-- ============================================
-- INSERT JUNK ITEMS
-- ============================================
INSERT INTO JUNK_ITEM (job_id, description, estimated_weight, price)
VALUES
(1, 'Old couch', 80.5, 75.00),
(1, 'Broken table', 45.3, 50.00),
(2, 'Construction debris', 120.0, 0.00),
(3, 'Mattress', 55.2, 120.75);

-- ============================================
-- INSERT PAYMENTS
-- ============================================
INSERT INTO PAYMENT (job_id, amount, payment_date, payment_method)
VALUES
(1, 150.00, '2025-01-10', 'Credit Card'),
(3, 220.75, '2025-01-14', 'Cash');
