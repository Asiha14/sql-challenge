CREATE TABLE titles (
    title_id varchar(5) NOT NULL PRIMARY KEY,
    title varchar(30) NOT NULL
);

drop table titles;
select*from titles;

CREATE TABLE employees (
    emp_no bigint   NOT NULL PRIMARY KEY,
    emp_title_id varchar(5) NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(30)   NOT NULL,
    last_name varchar(30)   NOT NULL,
    sex varchar(1)   NOT NULL,
    hire_date date   NOT NULL,
	FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
);

drop table employees;
select*from employees;



CREATE TABLE salaries (
    emp_no bigint   NOT NULL PRIMARY KEY,
    salary bigint   NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

drop table salaries;
select*from salaries;

CREATE TABLE departments (
    dept_no varchar(5)   NOT NULL PRIMARY KEY,
    dept_name varchar(30)   NOT NULL
);

drop table departments;
select*from departments;



drop table dept_emp;
select*from dept_emp;


CREATE TABLE dept_manager (
    dept_no varchar(5)   NOT NULL,
    emp_no bigint   NOT NULL,
    PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

drop table dept_manager;
select*from dept_manager;

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, 	e.first_name, 	e.last_name, 	e.sex, 	s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees
where hire_date between '1986/01/01' and '1986/12/31';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
Select d.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
From departments d
Join dept_manager dm ON d.dept_no = dm.dept_no
Join employees e On dm.emp_no = e.emp_no;

--List the department of each employee with the following information:
--employee number, last name, first name, and department name.
Select e.emp_no, e.last_name, e.first_name, d.dept_name
From departments d
Join dept_manager dm ON d.dept_no = dm.dept_no
Join employees e On dm.emp_no = e.emp_no;



