-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, 	e.first_name, 	e.last_name, 	e.sex, 	s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees
where hire_date between '1986/01/01' and '1986/12/31';

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
Select d.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
From departments d
Join dept_manager dm ON d.dept_no = dm.dept_no
Join employees e On dm.emp_no = e.emp_no;

--4. List the department of each employee with the following information:
--employee number, last name, first name, and department name.
Select e.emp_no, e.last_name, e.first_name, d.dept_name
From departments d
Join dept_emp de ON d.dept_no = de.dept_no
Join employees e On de.emp_no = e.emp_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select first_name, last_name, sex
From employees
Where first_name = 'Hercules' AND last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select e.emp_no, e.last_name, e.first_name, d.dept_name
From departments d
Join dept_emp de ON d.dept_no = de.dept_no
Join employees e On de.emp_no = e.emp_no
Where d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
Select e.emp_no, e.last_name, e.first_name, d.dept_name
From departments d
Join dept_emp de ON d.dept_no = de.dept_no
Join employees e On de.emp_no = e.emp_no
Where d.dept_name = 'Sales' Or d.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
Select last_name, count(Last_name) From employees
group by last_name
order by last_name DESC;

