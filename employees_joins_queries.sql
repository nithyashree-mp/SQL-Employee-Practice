create database org;
use org;

-- Employees Table
create table employees (
emp_id int primary key not null,
emp_name varchar(50),
dept_id int,
salary float,
manager_id int);

insert into employees values
(1, 'Ravi', 10, 50000, 5),
(2, 'Anita', 20, 60000, 5),
(3, 'Kiran', 10, 45000, 6),
(4, 'Sita', null, 40000, 6),
(5, 'Mahesh', 30, 80000, null),
(6, 'Neha', 40, 70000, null);

select * from employees;

-- Departments Table
create table departments(
dept_id int primary key,
dept_name varchar(50));

insert into departments values
(10, 'HR'),
(20, 'Finance'),
(30, 'IT'),
(50, 'Marketing');

select * from departments;

-- Project Table
create table projects(
project_id int primary key,
project_name varchar(50),
dept_id int);

insert into projects values
(101, 'Payroll System', 20),
(102, 'Recruitment App', 10),
(103, 'Website Redesign', 30),
(104, 'Sales Dashboard', 50);

select * from projects;

-- INNER JOIN QUERIES
-- Display employee name and department name
select e.emp_name, d.dept_name 
from employees e 
inner join departments d
on e.dept_id = d.dept_id;

-- Employees working in HR department
select e.emp_name 
from employees e
inner join departments d 
on e.dept_id = d.dept_id 
where d.dept_name = 'HR';

-- List Employee Name, Department, Salary for emp earning more than 50000
select e.emp_name, d.dept_name, e.salary 
from employees e
inner join departments d 
on e.dept_id = d.dept_id 
where e.salary > 50000;

-- Find employees whose department exists in departments table
select e.emp_id, e.emp_name, e.dept_id, d.dept_name
from employees e
inner join departments d
on e.dept_id = d.dept_id;

-- LEFT JOIN QUERIES
-- Find all employees and their department names
select e.emp_id, e.emp_name, d.dept_name
from employees e
left join departments d
on e.dept_id = d.dept_id;

-- Find employees who are not assigned to any department(invalid dept_id and null values both will appear)
select e.emp_name 
from employees e
left join departments d
on e.dept_id = d.dept_id
where d.dept_id is null;

-- show employees and department names including employees without department.
select e.emp_id, e.emp_name, d.dept_name
from employees e
left join departments d
on e.dept_id = d.dept_id;

-- RIGHT JOIN QUERIES
-- all departments and their employees
select e.emp_name, d.dept_name
from employees e
right join departments d
on e.dept_id = d.dept_id;

-- departments with no employee
select d.dept_name
from employees e
right join departments d
on e.dept_id = d.dept_id
where e.emp_name is null;

-- department name and employee count includes empty department /
-- count number of employees in each department
select d.dept_name, count(e.emp_name) as no_of_employees 
from employees e
right join departments d
on e.dept_id  = d.dept_id
group by d.dept_name;

-- find average salary per department
select d.dept_name, avg(e.salary) as average_salary
from employees e
right join departments d
on e.dept_id  = d.dept_id
group by d.dept_name;

-- Departments having more than one employee
select d.dept_name
from employees e
right join departments d
on e.dept_id  = d.dept_id
group by d.dept_name having count(e.emp_name) > 1;

-- SELF JOIN QUERIES
-- Display employee name and their manager name (self join)
select e.emp_name, m.emp_name as manager_name
from employees e
left join employees m
on m.emp_id = e.manager_id;

-- Employees who do not have manager
select e.emp_name as Employees
from employees e 
left join employees m
on e.manager_id = m.emp_id 
where e.manager_id is null;

-- Show manager wise employee count
select m.emp_name as Manager, count(e.emp_name) as no_of_Employees
from employees e
join employees m
on e.manager_id = m.emp_id
group by m.emp_name;