create table customers (
customer_id int primary key,
name varchar(100),
city varchar(100)
);
insert into customers (customer_id,name,city) values
(1,'Aman','Delhi'),
(2, 'Priya', 'Mumbai');

select * from customers;

SELECT * FROM employees;

--IN operator
SELECT * FROM employees
where city IN ('Delhi','Mumbai');

-- find employees who not lived in Mumbai
select * from employees
where city <> 'Mumbai';

--AND operator e.g find employess who's salary is more than 50000 and from Mumbai.
select name,city,salary
from employees
where city = 'Mumbai' and salary > 50000;

--OR operator used where at least one condition is true
select name,city
from employees
where city = 'Mumbai' or city ='Delhi';

--IN operator is used when you want to check multiple values for the same column
select name,city
from employees
where city IN ('Delhi', 'Bangalore');

-- between operator is used to select values within a range.
select name,salary
from employees
where salary between 50000 and 70000;

--LIKE operator is used to search for a pattern in text (strings like names ,citires,emails)
select name,city
from employees
where name like 'A%';

select * from employees;

-- count how many employees are in the complany from each city,
select city, count(*) from employees
group by city;

--What’s the average salary in your company?
select round(avg(salary),2) from employees;

-- check the munimum salary in the company
select min(salary) from employees;

-- check the max salary in the company
select max(salary) from employees;

--"SUM" Example check the total salay you have given to the employees
select sum(salary) as total_salary
from employees;

--GROUP BY , group by means putting similar things into groups
-- e.g find how many employees are from each city?
select city, count(*)
from employees
group by city;

select city,count(name)
from employees
group by city;


--use having operator when you want to use greater than or less than from results
-- find cities with more than 2 employees?
select city, count(name)
from employees
group by city
having count(name) > 2;


-- order by operator, by defalt it will be asending order.
select * from employees
order by salary desc;

-- limit topic
select * from employees
limit 10;

-- order by and limit ka use kr ka 1 interview question ata ha;
--find 2 employess with the highest salary
select * from employees
order by salary desc
limit 2;

--What are Subqueries?
--Show all employees whose salary is more than the average salary of all employees.
SELECT Name, Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary) 
    FROM Employees
);

--Q1. Write a query to get the second highest salary from the employees table.
-- here LIMIT is used
SELECT * 
FROM Employees 
ORDER BY Salary DESC 
LIMIT 1 OFFSET 1;

--Q1. Write a query to get the second highest salary from the employees table
--here subquery is used
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (SELECT MAX(salary) FROM employees)
);

--here i change column revenue from varchar to integer


ALTER Table employees
alter column revenue type varchar;

select * from employees;

--if you want to change the column name
--Alter Table tablename
-- RENAME COLUMN salary TO PAYMENT

--if i want to insert amount 5400 in id=1
UPDATE employees
set revenue=5400
where emp_id=1;

--Add new column
ALTER TABLE employees
ADD column income varchar;

-- HERE delete the column named INCOME
alter table employees
DROP column income; 

UPDATE employees SET revenue = 5000 WHERE emp_id = 1;
UPDATE employees SET revenue = 7200 WHERE emp_id = 2;
UPDATE employees SET revenue = 4830 WHERE emp_id = 3;
UPDATE employees SET revenue = 4660 WHERE emp_id = 4;
UPDATE employees SET revenue = 4220 WHERE emp_id = 5;
UPDATE employees SET revenue = 4000 WHERE emp_id = 6;
UPDATE employees SET revenue = 4770 WHERE emp_id = 7;
UPDATE employees SET revenue = 4330 WHERE emp_id = 8;
UPDATE employees SET revenue = 4990 WHERE emp_id = 9;
UPDATE employees SET revenue = 4030 WHERE emp_id = 10;
UPDATE employees SET revenue = 4820 WHERE emp_id = 11;
UPDATE employees SET revenue = 4740 WHERE emp_id = 12;
UPDATE employees SET revenue = 4920 WHERE emp_id = 13;
UPDATE employees SET revenue = 4840 WHERE emp_id = 14;
UPDATE employees SET revenue = 4580 WHERE emp_id = 15;

--found the employees who's salary is more than the average salary?
select * from employees 
where salary > ( select avg(salary) from employees);


--Q2. You have a sales table with columns (region, month, revenue).
--Find the region that had the highest average revenue across all months.
SELECT city, AVG(revenue) AS avg_revenue
FROM employees
GROUP BY city
ORDER BY AVG(revenue) DESC
LIMIT 1;

--Q3. Given a students table with (student_id, course_id, score), write a query to
--find all course_ids where more than 10 students have scored above 80.
CREATE TABLE students2 (
student_id INT,
course_id VARCHAR(10),
score INT
);
INSERT INTO students2 (student_id, course_id, score) VALUES
(1, 'C101', 85),
(2, 'C101', 91),
(3, 'C102', 76),
(4, 'C101', 88),
(5, 'C102', 93),
(6, 'C103', 67),
(7, 'C101', 81),
(8, 'C103', 89),
(9, 'C101', 82),
(10, 'C102', 84),
(11, 'C101', 90);

select course_id
from students2
where score > 80
group by course_id
having count(*)>10;

select * from students2;

--Q4. In a products table with (category, price), write a query to find the top 3
--categories with the highest total price value.
CREATE TABLE products (
product_id INT,
category VARCHAR(50),
price INT
);
INSERT INTO products (product_id, category, price) VALUES
(1, 'Electronics', 45000),
(2, 'Home', 15000),
(3, 'Electronics', 30000),
(4, 'Fashion', 7000),
(5, 'Home', 12000),
(6, 'Fashion', 9000),
(7, 'Electronics', 60000);
select category, sum(price) as total
from products
group by category
order by total desc
limit 3;

select * from products;

-- JOINS TOPIC
-- create 2 emp_1 and emp_2 tables
create table emp_1 (emp_id int);
insert into emp_1 (emp_id) values
(1),(2),(3),(4),(5),(6),(7),(8);
--delete 4,6 rows
delete from emp_1 
where emp_id IN (4,6);

select * from emp_1;

create table emp_2 (emp_id int);
insert into emp_2 (emp_id) values
(1),(2),(3),(4),(5),(6),(7),(8);
--delete 3,5 rows
delete from emp_2
where emp_id IN (3,5);

select * from emp_2;

--inner join
select * from emp_1 as e1 inner join emp_2 as e2 on e1.emp_id = e2.emp_id;

-- left join
select * from emp_1 as e1 left join emp_2 as e2 on e1.emp_id = e2.emp_id;

-- right join
select * from emp_1 as e1 right join emp_2 as e2 on e1.emp_id = e2.emp_id;

--full outer join
select * from emp_1 as e1 full outer join emp_2 as e2 on e1.emp_id = e2.emp_id;


--case statement
--“Write a query to add a column in the result that says 'High Earner'
--if salary is more than 60,000 — otherwise show 'Regular'”
select *,
		case when salary > 60000 then 'Hight earner' else 'Regular' end as status
		from employees;
		
--another data eng level case statement example
select *,
case
when salary < 58000 then 'Low'
when salary between 58000 and 72000 then 'Medium'
else 'High'
end as Salary_Status
from employees;


-- self join question, self join is like inner join;
CREATE TABLE developers (
dev_id INT PRIMARY KEY,
dev_name VARCHAR(50),
salary INT,
lead_id INT
);
INSERT INTO developers (dev_id, dev_name, salary, lead_id) VALUES
(1, 'Aakash', 70000, 3),
(2, 'Meera', 80000, 4),
(3, 'Rahul', 60000, NULL),
(4, 'Tanya', 90000, NULL);

select * from developers;

--Write a solution to find the developers who earn more than their team leads. 
--Return the result table in any order.
select d.dev_name as developer_name, d.salary
from developers d inner join developers l on d.lead_id = l.dev_id
where d.salary > l.salary;

--✅ 2. List Subscribers Who Never Watched Any Video
--Write a solution to find all subscribers who never streamed any content.
SELECT s.*
FROM subscribers s left join streaming_logs l on s.id = l.sub_id
where l.sub_id IS NULL;

--✅ 3. List Dates With Higher COVID Cases Than Previous Day
--Write a solution to find all dates with more reported cases than the previous day.
-- ya question inner join sa ma na kiya ha , lakin this question ka (BEST METHOD WINDOW FUNCTION LAG()ha).
select c1.id 
from covid c1 join covid c2 on c1.reportdate = c2.reportdate + INTERVAL '1 DAY'
where c1.datereport > c2.reportdate;

--✅ Q4. Find Courses With Zero Enrollment,
--there are 2 methods to solve this problem, left join and case statement
-- with subquery method
select c.course_id
from courses c
WHERE NOT EXISTS (
	SELECT 1
	FROM Enrollments e
	WHERE e.course_id = c.cuse_id
)
ORDER BY c.course_id;

-- second method LEFT JOIN
SELECT c.course_id
FROM Courses c
LEFT JOIN Enrollmets e
ON c.course_id = e.course_id
WHERE e.course_id IS NULL
ORDER BY c.course_id;

--Flip ACTIVE and INACTIVE Status in a single Update
--write a solution to flip all Active values to Inactive and vice versa using a single update query.
UPDATE vendors
SET status = CASE
WHEN status ='Active' THEN 'Inactive' ELSE 'Active'
END;

--students table for window function
CREATE TABLE students (
student_id INT,
name VARCHAR(50),
class VARCHAR(10),
marks INT
);
INSERT INTO students (student_id, name, class, marks) VALUES
(1, 'Aman', '10A', 95),
(2, 'Priya', '10A', 88),
(3, 'Rohit', '10A', 95),
(4, 'Meera', '10A', 80),
(5, 'Karan', '10A', 75),
(1, 'Riya', '10B', 95),
(2, 'Siya', '10B', 88),
(3, 'Jiya', '10B', 95),
(4, 'Ram', '10B', 80),
(5, 'Sam', '10B', 75);

select * from students;

select *, rank() over (partition by class order by marks desc) as rank 
from students;

select *, dense_rank() over (partition by class order by marks desc) as rank 
from students;

select *, row_number() over (partition by class order by marks desc) as rank 
from students;



--LAG & LEAD Example – Marks Change
CREATE TABLE exam_scores (
student_id INT,
exam_month DATE,
marks INT
);
INSERT INTO exam_scores VALUES
(1, '2024-01-01', 80),
(1, '2024-02-01', 85),
(1, '2024-03-01', 78);

select * from exam_scores;

--lead and lag
--lag
select *, lag (marks, 1,0) over (partition by student_id order by exam_month),
(marks -lag (marks, 1,0) over (partition by student_id order by exam_month)) as change
from exam_scores ;


--lead 
select *, lead (marks, 1,0) over (partition by student_id order by exam_month),
(marks -lead (marks, 1,0) over (partition by student_id order by exam_month)) as change
from exam_scores ;

--Q1. From the students table, list the top 2 students by marks in each class.
select * from students;
select *, dense_rank() over(partition by class order by marks desc ) as rank
from students;

--cte temporary table
with a as (
select *, dense_rank() over(partition by class order by marks desc ) as rank
from students
)
select * from a 
where rank <=2;

--example Imagine you have sales data for the year and you want to:
--1. Get total sales per salesperson.
--2. Find the top salesperson in each region.

CREATE TABLE sales (
emp_id INT,
emp_name VARCHAR(50),
region VARCHAR(20),
revenue INT);
INSERT INTO sales VALUES
(1, 'Aman', 'North', 120000),
(2, 'Priya', 'North', 110000),
(3, 'Rohit', 'South', 150000),
(4, 'Meera', 'South', 150000),
(5, 'Karan', 'East', 90000);

select * from sales;

select emp_name, sum(revenue) as total_sales
from sales 
group by emp_name;

select *, dense_rank() over( partition by region order by revenue desc) as rank
from sales;

with a as(
select *, dense_rank() over( partition by region order by revenue desc) as rank
from sales
)
select * from a
where rank=1