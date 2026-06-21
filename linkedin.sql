

create table categories(
category_id int primary key,
name varchar(100)
);



CREATE TABLE contacts (
    id SERIAL PRIMARY KEY,
    
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    alternate_phone VARCHAR(20),
    
    address_line1 VARCHAR(255),
    address_line2 VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100),
    
    date_of_birth DATE,
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    notes TEXT,
    
    is_active BOOLEAN DEFAULT TRUE,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO contacts 
(first_name, last_name, email, phone, alternate_phone, address_line1, city, state, postal_code, country, date_of_birth, gender, notes)
VALUES
('Ali', 'Khan', 'ali.khan@example.com', '+92300-1234567', NULL, 'Street 1', 'Lahore', 'Punjab', '54000', 'Pakistan', '1995-06-15', 'Male', 'Friend from university'),

('Sara', 'Ahmed', 'sara.ahmed@example.com', '+92311-2345678', '+923009876543', 'House 45', 'Karachi', 'Sindh', '75000', 'Pakistan', '1998-03-22', 'Female', 'Colleague'),

('Usman', 'Malik', 'usman.malik@example.com', '+92322-3334455', NULL, 'Block B', 'Islamabad', 'ICT', '44000', 'Pakistan', '1992-11-10', 'Male', 'Business contact'),

('Ayesha', 'Riaz', 'ayesha.riaz@example.com', '+92333-4445566', NULL, 'Street 10', 'Faisalabad', 'Punjab', '38000', 'Pakistan', '2000-01-05', 'Female', 'Client'),

('Hassan', 'Sheikh', 'hassan.sheikh@example.com', '+923445556677', NULL, 'Apartment 12', 'Multan', 'Punjab', '60000', 'Pakistan', '1990-09-30', 'Male', 'Old friend');



select * from contacts;


create table products (
product_id int primary key,
name varchar(100),
price decimal (10, 2),
description varchar (255),
tags varchar(255),
category_id int,
foreign key (category_id) references categories(category_id),
supplier varchar(100)
);


create table customer (
customer_id int primary key,
customer_name varchar(100) not null,
email varchar (100) not null,
phone varchar(20),
address varchar(255),
city varchar(255)
);


create table orders (
orderid int primary key,
customer_id int,
product_id int,
total_qnt int,
total_amount decimal (10, 2),
order_rating decimal (3,1),
legth decimal (5,2),
width decimal (5,2),
order_timestamp timestamp,
delivery_timestamp timestamp,
foreign key(customer_id) references customers(customer_id),
foreign key(product_id) references products(product_id)
);

select * from categories;
select * from products;
select * from customers;
select * from orders;

--in joins we can write multiple joins in one query or we can write filters
--after joins

-- full outer join
select customer_name, total_quantity from customers c 
full outer join orders o on c.customer_id = o.customer_id;

--UNION AND UNION ALL
CREATE TABLE customers2 (
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    per_country VARCHAR(50)
);

CREATE TABLE employees2 (
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    country VARCHAR(50)
);

INSERT INTO customers2 VALUES
('Ali', 'Khan', 'Pakistan'),
('Sara', 'Ahmed', 'UAE'),
('John', 'Smith', 'USA');

INSERT INTO employees2 VALUES
('Sara', 'Ahmed', 'UAE'),
('David', 'Lee', 'Canada'),
('Ali', 'Khan', 'Pakistan');

select * from customers2;
select * from employees2;

SELECT 
	first_name AS firstname,
	last_name AS lastname,
	per_country AS country
FROM customers2
UNION
SELECT
	first_name,
	last_name,
	country
FROM employees2;

-- union all example , it will show all selected data included dublicate rows from 2 tables;

SELECT 
	first_name AS firstname,
	last_name AS lastname,
	per_country AS country
FROM customers2
UNION ALL
SELECT
	first_name,
	last_name,
	country
FROM employees2;

-- ========================================================
-- --Standard Deviation(stddev) in an aggregations function
-- ========================================================

select stddev(total_amount) from orders;

-- ======================================================================
-- --METHAMETICAL FUNCTIONS
-- --ABS() Means absolute function, it will always give the positive value
-- ======================================================================

select abs(-2.6)

-- =====================================================================================
-- --ceil() Function, ya answer ka highest near wali value ko show krta ha (e.g 2.3-->3)
-- =====================================================================================

seelct ceil(2.7);

-- =============================================================================
-- --floor() Function, ya result ka lowest near value ko show krta ha(e.g 2.3-->2)
-- =============================================================================

select floor(2.7);

-- ====================================================================================
-- --round() function , ya dot ka bad wali value ko control krta ha(e.g 5.88888-->5.99)
-- ====================================================================================

select round(2.33333, 2);

-- ======================
-- --sqrt()  Square Root, 
-- ======================

select round(sqrt(.0),2);

-- ==============
-- --DATE FUNCTION
-- ==============

select current_date;

select extract (day from current_date);

--another method

select date_part('day', current_date);

--3 ways to check current month or date

select extract (month from current_date);
select date_part('month', current_date);
select to_char(current_date, 'month');

select extract (year from current_date);

-- you can also use truncate with date,. Data ko Groups mein Baantna ka liye like month ya year

select date_trunc('month', current_date);


select date_trunc('year', current_date);

-- =============
-- --AGE FUNCTION
-- =============


select age(timestamp '2024-01-02');

select age (timestamp '01-01-2023', timestamp '01-01-2026');

--you can change date string, its useless dont foucus on it

select to_date('01/02/2024', 'dd/mm/yyyy');

--you can change the date style 

select to_char(current_date, 'dd-mm-yyyy');


--check time
select current_time;

--check both date and time

select current_timestamp;

-- check local time with time zome

select localtime

select localtimestamp;

select current_date;

--TABLE FOR CONCAT COMMAND

CREATE TABLE concatcommand (
    -- User Info
    user_id INT,
    first_name TEXT,
    middle_name TEXT,
    last_name TEXT,
    email TEXT,
    
    -- Location Info
    city TEXT,
    state TEXT,
    country TEXT,
    
    -- Device / Behavior
    device_type TEXT,
    browser TEXT,
    
    -- Order Info
    order_id INT,
    product_name TEXT,
    category TEXT,
    amount NUMERIC(10,2),
    
    -- Dates / Time
    signup_date DATE,
    order_timestamp TIMESTAMP,
    
    -- File / Pipeline Info
    batch_id INT,
    source_system TEXT,
    
    -- Optional / Messy Data
    referral_code TEXT,
    notes TEXT
);

INSERT INTO concatcommand VALUES
(1, 'Ali', NULL, 'Khan', 'ali@example.com', 'Lahore', 'Punjab', 'PK', 'mobile', 'Chrome', 5001, 'Laptop', 'Electronics', 120000.50, '2024-01-10', '2024-04-01 10:15:00', 101, 'app', NULL, 'First order'),

(2, 'Sara', 'A.', 'Ahmed', 'sara@example.com', 'Karachi', 'Sindh', 'PK', 'desktop', 'Firefox', 5002, 'Phone', 'Electronics', 80000.00, '2024-02-12', '2024-04-02 12:30:00', 101, 'web', 'REF123', NULL),

(3, 'John', NULL, 'Doe', 'john@example.com', 'New York', 'NY', 'US', 'tablet', 'Safari', 5003, 'Shoes', 'Fashion', 150.75, '2024-03-05', '2024-04-03 08:45:00', 102, 'app', NULL, NULL),

(4, 'Fatima', NULL, 'Ali', 'fatima@example.com', NULL, 'Punjab', 'PK', 'mobile', 'Chrome', 5004, 'Bag', 'Fashion', 2500.00, '2024-04-01', '2024-04-04 14:20:00', 102, 'web', NULL, 'Repeat customer'),

(5, NULL, NULL, 'Smith', 'smith@example.com', 'London', NULL, 'UK', NULL, 'Edge', 5005, 'Watch', 'Accessories', 500.00, '2024-05-10', '2024-04-05 16:10:00', 103, 'app', 'REF999', NULL);

select * from concatcommand;

-- ==============================
-- --CONCATENATE COMMAND USECASES
-- -- join first_name and last_name
-- ==============================

select first_name,last_name,
concat(first_name,' ' ,last_name) AS full_name
from concatcommand;

-- =======================
-- -- upper and lower case
-- =======================

select first_name,
lower(first_name) as lower_case
from concatcommand;

--can write multiple query also 
select first_name,last_name,
concat(first_name,' ' ,last_name) AS full_name,
lower(first_name) as lower_case
from concatcommand;

-- ============
-- --upper_case
-- ============

select first_name,
upper(first_name) as upper_case
from concatcommand;

-- ======================================================
-- -- INITCAP FUNCTION, evey first letter will be capital
-- ======================================================

select notes,
INITCAP(notes) 
from concatcommand;

select * from concatcommand

--only first letter of the sentence will be capital
SELECT notes, UPPER(LEFT(notes, 1)) || SUBSTRING(notes FROM 2)
FROM concatcommand;

-- ===========================================================================
-- --LENGTH command is used to check the letters count , it also counts spaces 
-- ===========================================================================

SELECT 
    first_name,
    LENGTH(first_name) AS len_name
FROM concatcommand;

-- ==============
-- --TRIM operator
-- ==============

select
	first_name,
	length(first_name),
	trim(first_name) as trim_name
from concatcommand;
-- it removes spaces from start and end only
SELECT first_name, TRIM(first_name)
FROM concatcommand;

-- rtrim and ltrim is used to remove spaces and letters from left and right side of the word
select rtrim('        hello ')

-- trim is also used to remove letters from start and end of the word
select trim('x' from 'xxdataxx')

--if you permanently want to remove the spaces then, TRIM will remove spaces from start and end.
UPDATE concatcommand
SET first_name = TRIM(first_name);

select * from concatcommand;

--If you want something smarter (common real-world case),
--👉 Remove extra spaces but keep single spaces between words:
--it will make permanent changes 
UPDATE concatcommand
SET first_name = REGEXP_REPLACE(TRIM(first_name), '\s+', ' ', 'g');

--edit_first_name → cleaned version (temporary, only in result)
--👉 Remove extra spaces but keep single spaces between words:
SELECT 
    first_name,
    REGEXP_REPLACE(TRIM(first_name), '\s+', ' ', 'g') AS edit_first_name
FROM concatcommand;

select * from concatcommand;

-- ====================================================
-- -- REPLACE FUNCTION if you want to remove all spaces
-- ====================================================

SELECT 
    notes,
    REPLACE(notes, ' ', '') AS withoutspace
FROM concatcommand;

-- using REPLACE we can change file format
select
	'file.txt' as old_filename,
	REPLACE('file.txt', '.txt', '.csv') as new_filename;
--REPLACE another usecase
SELECT phone,
       REPLACE(phone, '-', '/') AS clean_phone
FROM contacts;

select * from contacts;

-- ================
-- length function
-- ================

select first_name,
length(first_name) as name
from concatcommand;

-- =================
-- --extract funtion
-- =================

select first_name,
left(first_name, 2) as test
from concatcommand;

select first_name,
right(first_name, 2) as test
from concatcommand;

-- ==============================================
-- SUBSTRING FUNCTION;
-- only first letter of the line will be capital
-- ==============================================

SELECT notes,UPPER(LEFT(notes, 1)) ||  SUBSTRING(notes from 2) as test
FROM concatcommand;

-- =====================================
-- SUBSTRING(notes from 2), (from 2 or notes,2) is same thing
-- it will skip first letter
-- =====================================

select first_name,
substring(first_name, 2) as test
from concatcommand;

select * from concatcommand
select * from customers

-- || is used to combine 2 columns
select city || state from concatcommand;

select city || '-' || state from concatcommand;

-- concat command is also used to combine 2 columns, can also use (concat with seperator,concat_ws) to seperate columns
select concat(city, ' ',state) from concatcommand;

select * from contacts

-- ===============================================
-- Position function is used to find a word in sql
-- ===============================================

select notes,
position('university' in notes) from contacts;


-- ============================================================================
-- MASTER TABLE FOR LEARNING / TESTING ALL POSTGRESQL WINDOW FUNCTIONS
-- ============================================================================

CREATE TABLE window_function_data (
    id BIGSERIAL PRIMARY KEY,

    -- Employee / User Info
    employee_name      VARCHAR(100),
    department         VARCHAR(100),
    team               VARCHAR(100),
    manager_name       VARCHAR(100),
    gender             VARCHAR(10),

    -- Geographic Partitioning
    country            VARCHAR(100),
    city               VARCHAR(100),

    -- Date / Time Columns
    hire_date          DATE,
    joining_year       INT,
    record_date        DATE,
    created_at         TIMESTAMP,

    -- Numeric Columns for Analytics
    salary             NUMERIC(12,2),
    bonus              NUMERIC(12,2),
    sales_amount       NUMERIC(12,2),
    profit_amount      NUMERIC(12,2),
    expense_amount     NUMERIC(12,2),

    -- Performance Metrics
    performance_score  NUMERIC(5,2),
    projects_completed INT,
    login_count        INT,
    working_hours      NUMERIC(5,2),

    -- Transaction / Event Data
    order_id           BIGINT,
    transaction_amount NUMERIC(12,2),
    quantity           INT,

    -- Status Columns
    employment_status  VARCHAR(50),
    order_status       VARCHAR(50),

    -- Category Columns
    product_category   VARCHAR(100),
    product_name       VARCHAR(100),

    -- Sequential / Ranking Support
    sequence_no        INT,

    -- Text Column
    remarks            TEXT
);

INSERT INTO window_function_data (
    employee_name,
    department,
    team,
    manager_name,
    gender,
    country,
    city,
    hire_date,
    joining_year,
    record_date,
    created_at,
    salary,
    bonus,
    sales_amount,
    profit_amount,
    expense_amount,
    performance_score,
    projects_completed,
    login_count,
    working_hours,
    order_id,
    transaction_amount,
    quantity,
    employment_status,
    order_status,
    product_category,
    product_name,
    sequence_no,
    remarks
)
VALUES

-- IT Department
('Ali', 'IT', 'Backend', 'Ahmed', 'Male',
 'Pakistan', 'Lahore',
 '2020-01-15', 2020, '2025-01-01', NOW(),
 120000, 15000, 50000, 12000, 5000,
 4.5, 12, 20, 8.5,
 1001, 25000, 2,
 'Active', 'Completed',
 'Electronics', 'Laptop',
 1, 'Top performer'),

('Sara', 'IT', 'Frontend', 'Ahmed', 'Female',
 'Pakistan', 'Karachi',
 '2021-03-20', 2021, '2025-01-02', NOW(),
 110000, 12000, 42000, 10000, 4000,
 4.2, 10, 18, 8.0,
 1002, 18000, 1,
 'Active', 'Completed',
 'Electronics', 'Tablet',
 2, 'Consistent performance'),

('Usman', 'IT', 'Backend', 'Ahmed', 'Male',
 'Pakistan', 'Islamabad',
 '2019-07-10', 2019, '2025-01-03', NOW(),
 130000, 18000, 61000, 15000, 7000,
 4.8, 15, 22, 9.0,
 1003, 32000, 3,
 'Active', 'Pending',
 'Electronics', 'Monitor',
 3, 'Senior engineer'),

-- HR Department
('Ayesha', 'HR', 'Recruitment', 'Fatima', 'Female',
 'Pakistan', 'Lahore',
 '2018-02-11', 2018, '2025-01-01', NOW(),
 90000, 8000, 25000, 6000, 3000,
 4.0, 8, 16, 7.5,
 1004, 12000, 1,
 'Active', 'Completed',
 'Office', 'Chair',
 4, 'HR specialist'),

('Bilal', 'HR', 'Operations', 'Fatima', 'Male',
 'Pakistan', 'Karachi',
 '2022-06-18', 2022, '2025-01-02', NOW(),
 85000, 7000, 20000, 5000, 2500,
 3.8, 6, 14, 7.0,
 1005, 9000, 2,
 'Inactive', 'Cancelled',
 'Office', 'Desk',
 5, 'New employee'),

-- Sales Department
('Hina', 'Sales', 'Retail', 'Kashif', 'Female',
 'Pakistan', 'Faisalabad',
 '2020-09-01', 2020, '2025-01-03', NOW(),
 100000, 20000, 90000, 25000, 9000,
 4.7, 20, 25, 9.5,
 1006, 45000, 5,
 'Active', 'Completed',
 'Furniture', 'Sofa',
 6, 'Excellent sales'),

('Zain', 'Sales', 'Corporate', 'Kashif', 'Male',
 'Pakistan', 'Multan',
 '2021-11-15', 2021, '2025-01-04', NOW(),
 95000, 17000, 75000, 18000, 8500,
 4.3, 17, 21, 8.7,
 1007, 38000, 4,
 'Active', 'Completed',
 'Furniture', 'Table',
 7, 'Corporate specialist'),

('Mariam', 'Sales', 'Retail', 'Kashif', 'Female',
 'Pakistan', 'Lahore',
 '2019-04-05', 2019, '2025-01-05', NOW(),
 105000, 19000, 85000, 22000, 8800,
 4.6, 19, 24, 9.1,
 1008, 41000, 3,
 'Active', 'Pending',
 'Furniture', 'Bed',
 8, 'Strong closer');

 select * from window_function_data;

 select employee_name, id,
 rank() over (partition by id order by salary desc) as rank,salary
 from window_function_data;


  select employee_name, id,
 dense_rank() over (partition by id order by salary desc) as rank,salary
 from window_function_data;

 select employee_name, id,
 row_number() over (partition by id order by salary desc) as row_number1,salary
 from window_function_data;

-- ======================
-- LAG and LEAD Function
-- ======================
 
 SELECT
    employee_name,department,salary,
    LAG(salary,1) OVER (PARTITION BY department ORDER BY salary) AS previous_salary
FROM window_function_data;

SELECT
    employee_name,sales_amount,
    LAG(sales_amount,1) OVER (ORDER BY sales_amount) AS previous_sales,

    sales_amount -
    LAG(sales_amount,1) OVER (ORDER BY sales_amount) AS growth
FROM window_function_data;

-- =============
-- LEAD FUNCTION
-- =============

SELECT employee_name,department,salary,
    LEAD(salary) OVER (PARTITION BY department ORDER BY salary) AS next_salary
FROM window_function_data;

-- =====================
-- SUM and OVER Function
-- =====================

SELECT
    employee_name,
    department,
    sales_amount,
    SUM(sales_amount) OVER (
        PARTITION BY department
        ORDER BY sales_amount
    ) AS department_running_sales
FROM window_function_data;

-- =============
-- SUM FUNCTION
-- =============

SELECT
    employee_name,
    department,
    record_date,
    sales_amount,
    AVG(sales_amount) OVER (
        PARTITION BY department
        ORDER BY record_date
        ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
    ) AS moving_average
FROM window_function_data;

-- ===============================================================================
-- mn ab VIEWS FUNCTION study kr rha ho, is mn 4 tables datawithbara na use kye hn
-- ===============================================================================



-- 1. Create Schema
CREATE SCHEMA IF NOT EXISTS sales;


-- 2. Create Customers Table
CREATE TABLE sales.customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    country VARCHAR(50),
    score INT
);

INSERT INTO sales.customers VALUES
    (1, 'Jossef', 'Goldberg', 'Germany', 350),
    (2, 'Kevin', 'Brown', 'USA', 900),
    (3, 'Mary', NULL, 'USA', 750),
    (4, 'Mark', 'Schwarz', 'Germany', 500),
    (5, 'Anna', 'Adams', 'USA', NULL);

-- 3. Create Employees Table
CREATE TABLE sales.employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    birth_date DATE,
    gender CHAR(1),
    salary INT,
    manager_id INT
);

INSERT INTO sales.employees VALUES
    (1, 'Frank', 'Lee', 'Marketing', '1988-12-05', 'M', 55000, NULL),
    (2, 'Kevin', 'Brown', 'Marketing', '1972-11-25', 'M', 65000, 1),
    (3, 'Mary', NULL, 'Sales', '1986-01-05', 'F', 75000, 1),
    (4, 'Michael', 'Ray', 'Sales', '1977-02-10', 'M', 90000, 2),
    (5, 'Carol', 'Baker', 'Sales', '1982-02-11', 'F', 55000, 3);

-- 4. Create Products Table
CREATE TABLE sales.products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT
);

INSERT INTO sales.products VALUES
    (101, 'Bottle', 'Accessories', 10),
    (102, 'Tire', 'Accessories', 15),
    (103, 'Socks', 'Clothing', 20),
    (104, 'Caps', 'Clothing', 25),
    (105, 'Gloves', 'Clothing', 30);

-- 5. Create Orders Table (Note: TIMESTAMP is used instead of DATETIME2)
CREATE TABLE sales.orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    sales_person_id INT,
    order_date DATE,
    ship_date DATE,
    order_status VARCHAR(50),
    ship_address VARCHAR(255),
    bill_address VARCHAR(255),
    quantity INT,
    sales INT,
    creation_time TIMESTAMP
);

INSERT INTO sales.orders VALUES
    (1, 101, 2, 3, '2025-01-01', '2025-01-05', 'Delivered','9833 Mt. Dias Blv.', '1226 Shoe St.', 1, 10, '2025-01-01 12:34:56'),
    (2, 102, 3, 3, '2025-01-05', '2025-01-10', 'Shipped','250 Race Court',NULL, 1, 15, '2025-01-05 23:22:04'),
    (3, 101, 1, 5, '2025-01-10', '2025-01-25', 'Delivered','8157 W. Book','8157 W. Book', 2, 20, '2025-01-10 18:24:08'),
    (4, 105, 1, 3, '2025-01-20', '2025-01-25', 'Shipped', '5724 Victory Lane', '', 2, 60, '2025-01-20 05:50:33'),
    (5, 104, 2, 5, '2025-02-01', '2025-02-05', 'Delivered',NULL, NULL, 1, 25, '2025-02-01 14:02:41'),
    (6, 104, 3, 5, '2025-02-05', '2025-02-10', 'Delivered','1792 Belmont Rd.',NULL, 2, 50, '2025-02-06 15:34:57'),
    (7, 102, 1, 1, '2025-02-15', '2025-02-27', 'Delivered','136 Balboa Court', '', 2, 30, '2025-02-16 06:22:01'),
    (8, 101, 4, 3, '2025-02-18', '2025-02-27', 'Shipped','2947 Vine Lane','4311 Clay Rd', 3, 90, '2025-02-18 10:45:22'),
    (9, 101, 2, 3, '2025-03-10', '2025-03-15', 'Shipped','3768 Door Way', '', 2, 20,'2025-03-10 12:59:04'),
    (10, 102, 3, 5, '2025-03-15', '2025-03-20', 'Shipped',NULL, NULL, 0, 60,'2025-03-16 23:25:15');

-- ================================
-- these 4 tables for VIEWS in sql
-- ================================

select * from sales.customers;

select * from sales.employees;

select * from sales.products;

select * from sales.orders;

-- ========================================================================================================================
-- first giving an example of CTE(common table expression),
-- it's not part of views,You can reference a CTE multiple times, but only inside the exact same query where it was defined.
-- ========================================================================================================================

WITH cte_monthly_summary AS (
    SELECT 
        date_trunc('month', order_date) AS ordermonth,
        SUM(sales) AS totalsales,
		COUNT(order_id) totalorders,
		SUM(quantity) totalquantity
    FROM sales.orders
    GROUP BY date_trunc('month', order_date)
) 
select
ordermonth,
totalsales,
SUM(totalsales) over (order by ordermonth) as runningtotal
from cte_monthly_summary;

--View: Reusable anywhere, anytime
--Once you create a View, it is saved permanently in the database schema. You can call it in a brand new query tomorrow,
--if you want to save view in the specific schema then write schema name with the view name

CREATE VIEW sales.VIEW_MONTHLY_SUMMARY AS(
    SELECT 
        date_trunc('month', order_date) AS ordermonth,
        SUM(sales) AS totalsales,
		COUNT(order_id) totalorders,
		SUM(quantity) totalquantity
    FROM sales.orders
    GROUP BY date_trunc('month', order_date)
) 

-- =======================================
-- now view has created , lets check it
-- =======================================

SELECT * FROM VIEW_MONTHLY_SUMMARY

select
ordermonth,
totalsales,
SUM(totalsales) over (order by ordermonth) as runningtotal
from VIEW_MONTHLY_SUMMARY;

-- if you want to change the view then you will use 'create or replace' words, e.g below I will remove the count(order_id) totalorders
-- IMPORTANT NOTE: create or replace is only used to add some coulumns or update something in view , but if you want to delete a column then
-- first you will drop the whole view and the create the new view

--TASK: Provide view that combines details from orders, products, customers, and employees

CREATE VIEW sales.V_ORDER_DETAILS AS (
SELECT
    o.order_id,
    o.order_date,
    p.category,
	--COALESCE null ko ktam kr de ga but concat best ha
    --COALESCE(c.first_name) || ' ' || COALESCE(c.last_name) AS customer_name,
	TRIM(CONCAT(c.first_name, ' ', c.last_name)) AS customer_name,
    c.country AS customer_country,
		TRIM(CONCAT(e.first_name, ' ', e.last_name)) AS sales_name,
    o.sales,
    o.quantity
FROM sales.orders o
LEFT JOIN sales.products p 
    ON p.product_id = o.product_id
LEFT JOIN sales.customers c 
    ON c.customer_id = o.customer_id
LEFT JOIN sales.employees e 
ON e.employee_id = o.sales_person_id
);

--=================
--STORED PROCEDURES
--=================
--===========================================================================================================
-- DATAWITHBARAA said wo stored procedure ko big projects mn kbi istimal nahi kre ga balka is kam ka liya wo PYTHON ka use kra ga.
-- CLAUDE ka mutabiq STORED PROCEDURE ko kab ismal kerna chahiya or kb PYTHON, AIRFLOW OR DBT ko.
-- >>>>> 1- Jab Kaam Simple & Repetitive Ho 
-- >>>>> Use Case A: Daily Log Insert
-- Reason: ye kaam har roz SAME HAI, kabhi login change nahi hota, isay PYTHON script mein wrap karna unnecessary overhead hai.

CREATE PROCEDURE log_daily_run(p_status TEXT, p_rows INT)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO etl_log(run_date, status, rows_processed)
	VALUES (CURRENT_DATE, p_status, p_rows);
END;
$$;

-- >>>>> USE CASE B: Basic Validation
-- Reason: Simple rule-based check hai, logic babhi evolve nahi hoga.

CREATE PROCEDURE validate_not_null(p_table TEXT, p_column TEXT)
LANGUAGE plpgsql
AS $$
DECLARE 
	null_count INT;
BEGIN
	EXECUTE format('SELECT COUNT(*) FROM %I WHERE %I IS NULL', p_table, p_column)
	INTO null_count;

	IF null_count >0 THEN
		RAISE EXCEPTION 'Validation failed: % nulls in %' null_count, p_column;
	END IF;
END;
$$;

-- ==> 2- Jab Performance Critical Ho(Data DB se Bahar Na Nikle)
-- >>>>> Use Case A: Bulk Upsert(Lakhon Rows)
-- Reason: Agar ye Python se karte (row by row fetch -> process -> push back), network round_trips ;akhon dafa honge ( bohat slow). DB ke andar hi karna sahi hai.

CREATE PROCEDURE bulk_upsert_orders()
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO fact_orders
	SELECT * FROM staging_orders
	ON CONFLICT (order_id)
	DO UPDATE SET amount = EXCLUDED.amount, updated_at = NOW();
END;
$$;

-- >>>>> Use Case B: Heavy Aggregation
-- Reason: Millions rows ko Python mein load karke aggregate karna memory heavy hai - DB ka query engine isay zyada efficiently karta hai.

CREATE PROCEDURE refresh_daily_summary()
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO daily_summary
	SELECT sale_date, SUM(amount),COUNT(*)
	FROM fact_sales
	WHERE sale_date = CURRENT_DATE
	GROUP BY sale_date;
END;
$$:

-- >>>>> 3- Jab Security Matter Kare (No Direct Table Access)
-- Use Case: Restricted Reporting Access
-- Reason: jb ap sara data kisi ko na show krwana chahta hon.

CREATE PROCEDURE get_sales_report(p_region TEXT)
LANGUAGE plpgsql 
SECURITY DEFINER
AS $$
BEGIN
	-- analyst kno sirf summary milta hai, raw table access nahi
	INSERT INTO report_output
	SELECT region, SUM(amount) FROM fact_sales
	WHERE region = p_region;
END;
$$;

	-- Sirf execute permission do, table access nahi
GRANT EXECUTE ON PROCEDURE get_sales_report(TEXT) TO analyst_role;
REVOKE ALL ON fact_sales FROM analyst_role;
-- =====> Contrast: Jab Python/Airflow/dbt Behtar Hai
-- SCENARIO                      			BEHTAR TOOL
-- APIs se data lana             			PYTHON-- DN SQL APIs call ahi kar sakta
-- (Strip, salesfrce)
-- -----------------------------------------------------------------------
-- Logic jo har hafte change ho             DBT -- Git mein version track hota hai
-- --------------------------------------------------------------------------
-- Multiple databases ko sync karna         Airflow -- cross system orchestration
-- -----------------------------------------------------------------------
-- ML model run karna data pe               PYTHON -- sklearn/panda chahiye (Python Liabaries) (Pandas Manipulation Library-- data ko load, clean, transform, aur analyze karna)
-- (Scikit-learn or sklearn is Machine Learning Library, uses for Data se predictions/patterns nikalna,  ye ML models banane ke liye hai.)
-- ------------------------------------------------------------------------
-- Pipeline fail hone pe Slack alert        Airflow -- built in alert hooks
