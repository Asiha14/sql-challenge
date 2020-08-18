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

CREATE TABLE dept_emp (
    emp_no bigint   NOT NULL,
    dept_no varchar(5)   NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

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

