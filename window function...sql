create database employees;
use employees;
create table employees (
    empid int primary key,
    empname varchar(50),
    department varchar(50),
    salary int
);
desc employees;

insert into employees (empid, empname, department, salary) values
(1, 'amit', 'IT', 60000),
(2, 'priya', 'HR', 50000),
(3, 'rahul', 'IT', 70000),
(4, 'sneha', 'Finance', 65000),
(5, 'karan', 'IT', 70000);
select empid, empname, department, salary,
    rank() over (order by salary desc) as salary_rank
from employees;

select
    empid,
    empname,
    salary,
    max(salary) over () as max_salary,
    min(salary) over () as min_salary
from employees;

select
    empid,
    empname,
    department,
    salary,
    max(salary) over (partition by department) as dept_max_salary,
    min(salary) over (partition by department) as dept_min_salary
from employees;
