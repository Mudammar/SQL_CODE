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

--Standard Deviation(stddev) in an aggregations function;
select stddev(total_amount) from orders;

--METHAMETICAL FUNCTIONS
--ABS() Means absolute function, it will always give the positive value
select abs(-2.6)

--ceil() Function, ya answer ka highest near wali value ko show krta ha (e.g 2.3-->3)
seelct ceil(2.7);

--floor() Function, ya result ka lowest near value ko show krta ha(e.g 2.3-->2)
select floor(2.7);

--round() function , ya dot ka bad wali value ko control krta ha(e.g 5.88888-->5.99)
select round(2.33333, 2);

--sqrt()  Square Root, 
select round(sqrt(4.0),2);

--DATE FUNCTION
select current_date;

select extract (day from current_date);
--another method
select date_part('day', current_date);

--3 ways to check current month or date
select extract (month from current_date);
select date_part('month', current_date);
select to_char(current_date, 'month');

select extract (year from current_date);

-- you can also use truncate with date
select date_trunc('month', current_date);


select date_trunc('year', current_date);

--AGE FUNCTION
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

--CONCATENATE COMMAND USECASES
-- join first_name and last_name
select first_name,last_name,
concat(first_name,' ' ,last_name) AS full_name
from concatcommand;

-- upper and lower case
select first_name,
lower(first_name) as lower_case
from concatcommand;

--can write multiple query also 
select first_name,last_name,
concat(first_name,' ' ,last_name) AS full_name,
lower(first_name) as lower_case
from concatcommand;

--upper_case
select first_name,
upper(first_name) as upper_case
from concatcommand;

-- evey first letter will be capital
select notes,
INITCAP(notes) 
from concatcommand;

select * from concatcommand

--only first letter of the sentence will be capital
SELECT notes, UPPER(LEFT(notes, 1)) || SUBSTRING(notes FROM 2)
FROM concatcommand;

--LENGTH command is used to check the letters count , it also counts spaces 
SELECT 
    first_name,
    LENGTH(first_name) AS len_name
FROM concatcommand;

--TRIM operator
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
-- REPLACE FUNCTION if you want to remove all spaces
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

-- length function
select first_name,
length(first_name) as name
from concatcommand;

--extract funtion
select first_name,
left(first_name, 2) as test
from concatcommand;

select first_name,
right(first_name, 2) as test
from concatcommand;

--SUBSTRING FUNCTION;
--only first letter of the line will be capital
SELECT notes,UPPER(LEFT(notes, 1)) ||  SUBSTRING(notes from 2) as test
FROM concatcommand;

--SUBSTRING(notes from 2), (from 2 or notes,2) is same thing
--it will skip first letter
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
-- Position function is used to find a word in sql
select notes,
position('university' in notes) from contacts;

