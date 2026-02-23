CREATE database company;
use company;

-- Create Employee Table
CREATE TABLE employee (
emp_id int primary key not null unique,
emp_name varchar(50),
gender varchar(10),
department varchar(50),
job_role varchar(30),
salary float, 
join_date date);

-- Insert Data
INSERT INTO employee VALUES
(101, 'Ravi', 'Male', 'IT', 'Developer', 45000, '2022-01-10'),
(102, 'Anita', 'Female', 'HR', 'HR Executive', 35000, '2021-06-15'),
(103, 'Suresh', 'Male', 'Finance', 'Accountant', 40000, '2020-09-20'),
(104, 'Priya', 'Female', 'IT', 'Data Analyst', 55000, '2023-03-01'),
(105, 'Kiran', 'Male', 'Sales', 'Sales Executive', 30000, '2021-11-05'),
(106, 'Neha', 'Female', 'IT', 'Developer', 48000, '2022-07-18'),
(107, 'Arjun', 'Male', 'HR', 'Recruiter', 32000, '2023-01-12'),
(108, 'Meena', 'Female', 'Finance', 'Analyst', 42000, '2020-05-25'),
(109, 'Rohith', 'Male', 'Sales', 'Manager', 60000, '2019-08-30'),
(110, 'Kavya', 'Female', 'IT', 'Tester', 38000, '2021-12-10');


-- Basic Queries
-- Fetch all Records
SELECT * FROM employee;

-- Display Employee name, Department and Salary
SELECT emp_name, department, salary FROM employee;

-- Employees working in IT department
SELECT emp_name FROM employee WHERE department = "IT";

-- Employees salary greater than 40,000
SELECT * FROM employee WHERE salary > 40000;

-- Female Employees
SELECT * FROM employee WHERE gender = "Female";

-- Employees joined after 2022
SELECT * FROM employee WHERE join_date > '2022-12-31';
-- OR
SELECT * FROM employee WHERE year(join_date) > 2022;

-- Employees in IT with salary above 45000
SELECT * FROM employee WHERE department = 'IT' and salary > 45000;

-- Employees from finance or HR department
SELECT * FROM employee WHERE department = 'HR' or department = 'Finance';

-- Employee salary b/w 35000 and 50000
SELECT emp_name as emp, salary FROM employee WHERE salary BETWEEN 35000 and 45000;

-- Sort employees by salary descending order
SELECT * FROM employee ORDER BY salary desc;

-- Top 3 highest paid employees
SELECT emp_name, department as dept, salary 
FROM employee 
ORDER BY salary desc 
LIMIT 3;-

-- Employees sorted by joined_date (oldest first)
SELECT * FROM employee
ORDER BY join_date asc;

-- Total number of employees
SELECT count(*) FROM employee;

-- Highest Salary
SELECT max(salary) FROM employee;

-- Average Salary
SELECT avg(salary) FROM employee;

-- Count employees in each department
SELECT department, count(*) as number_of_emp FROM employee GROUP BY department;

-- count male and female employees
SELECT  gender, count(*) FROM employee GROUP BY gender;

-- average salary per department
SELECT department, avg(salary) FROM employee GROUP BY department;

-- maximum and minimum salary in each department
SELECT department, max(salary), min(salary) FROM employee GROUP BY department;

-- count employees in each department who earn more than 40000
SELECT department, count(*) as no_of_emp from employee 
WHERE salary > 40000 
GROUP BY department;

-- OR  (To get department with 0 employees earn more than 40000)
SELECT department,
sum(case when salary > 40000 then 1 else 0 end) as no_of_emp
FROM employee GROUP BY department;

-- Average salary of IT department only
SELECT avg(salary) as avg_salary_of_IT 
FROM employee 
WHERE department = "IT"
GROUP BY department;

-- Count employees who joined after 2021 in each department
SELECT department, count(*) as no_of_emp
FROM employee
WHERE year(join_date) > 2021 
GROUP BY department;

-- OR
SELECT department,
sum(case when year(join_date) > 2021 then 1 else 0 end) 
FROM employee GROUP BY department;

-- Departments with more than 2 employees
SELECT department FROM employee 
GROUP BY department HAVING count(*) > 2;

-- Departments whose average salary > 45000
SELECT department FROM employee
GROUP BY department HAVING avg(salary) > 45000;

-- Departments with maximum salary above 50000
SELECT department FROM employee 
GROUP BY department HAVING max(salary) > 50000;

-- Count employees by department and gender
SELECT department, gender, count(*) as no_of_emp
FROM employee 
GROUP BY department, gender
ORDER BY department;

-- Average salary by department and job role
SELECT department, job_role, avg(salary) 
FROM employee
GROUP BY department, job_role
ORDER BY department;

-- No of employees by department and join year
SELECT department, year(join_date) as joined_year, count(*) as no_of_emp
FROM employee
GROUP BY joined_year, department
ORDER BY department;