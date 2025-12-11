-- ============================================================
--   JUNK REMOVAL DATABASE - SCHEMA
-- ============================================================

DROP DATABASE IF EXISTS junk_removal_db;
CREATE DATABASE junk_removal_db;
USE junk_removal_db;

-- ===========================
-- CUSTOMER TABLE
-- ===========================
CREATE TABLE CUSTOMER (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(200)
);

-- ===========================
-- EMPLOYEE TABLE
-- ===========================
CREATE TABLE EMPLOYEE (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(20),
    role VARCHAR(50)
);

-- ===========================
-- JOB TABLE
-- ===========================
CREATE TABLE Job (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    job_date DATE NOT NULL,
    job_time TIME NOT NULL,
    status ENUM('Pending', 'In Progress', 'Completed') DEFAULT 'Pending',
    total_cost DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);


-- ===========================
-- JUNK ITEM TABLE
-- ===========================
CREATE TABLE JUNK_ITEM (
    junk_id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT,
    description VARCHAR(225),
    estimated_weight DECIMAL(10,2),
    price DECIMAL(10,2),

    FOREIGN KEY (job_id) REFERENCES JOB(job_id)
);

-- ===========================
-- PAYMENT TABLE
-- ===========================
CREATE TABLE PAYMENT (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(20),

    FOREIGN KEY (job_id) REFERENCES JOB(job_id)
);