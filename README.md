# Junk Removal Database Project  
IT125 – Database Fundamentals  
Author: Moe Jabbie  

## 📌 Project Overview  
This project is a complete relational database system designed for a Junk Removal business.  
It includes:

- Customer management  
- Employee tracking  
- Job scheduling  
- Junk item tracking  
- Payments  
- Views and sample queries  
- ERD (Entity-Relationship Diagram)  
- SQL scripts for easy setup

This project demonstrates database design, normalization, SQL querying, and documentation.

---

## 📁 Folder Structure


---

## 🗄️ Database Files (Inside /database)

| File | Purpose |
|------|---------|
| **01_schema.sql** | Creates the database and all tables |
| **02_sample_data.sql** | Inserts sample customers, employees, jobs, payments |
| **03_queries.sql** |  SQL queries |
| **04_views.sql** | Contains all SQL VIEW definitions |

---

## 🧱 How to Set Up the Database (MySQL Workbench)

### 1️⃣ Open MySQL Workbench  
### 2️⃣ Run in order:

#### **1. Run: 01_schema.sql**
Creates all tables.

#### **2. Run: 02_sample_data.sql**
Inserts sample data.

#### **3. Run: 03_queries.sql**
Runs analytic queries.

#### **4. Run: 04_views.sql**
Creates views such as:

- `v_customer_job_history`
- `v_employee_job_summary`
- `v_payments_report`

---

## 📊 ERD (Entity-Relationship Diagram)

Below is the ERD for the Junk Removal Database:

![ER Diagram](docs/EER_Diagram_Junk_Removal.png)

---

## 🔍 Example Queries Included

### ✔ Customer Job History  
Shows every customer and their completed jobs.

### ✔ Employee Assignment Report  
Shows each employee and the jobs they worked.

### ✔ Payment Summary  
Monthly revenue and total payments per job.

---

## 🧠 Key Concepts Learned

- How to design normalized tables  
- How to use foreign keys  
- How to create SQL views  
- How to join tables for reporting  
- How to structure a full database project professionally  
- How to document a technical project

---

## 🎯 Features Demonstrated

- 1-to-many relationships (Customers → Jobs)  
- Many-to-many simulated via Jobs + Items  
- Payment tracking per job  
- Database indexing for performance  
- Views to simplify reporting  

---

