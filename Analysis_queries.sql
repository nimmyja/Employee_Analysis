-- List the following details of each employee: employee number, last name, first name, sex, and salary.

select employees.emp_no, last_name, first_name, sex, salaries.salary 
from employees
join salaries
on employees.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
select last_name, first_name, hire_date
from employees
where Extract(Year from hire_date) = 1986;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select departments.dept_no, departments.dept_name,employees.emp_no AS manager_emp_no, last_name, first_name from departments
join dept_manager
on departments.dept_no = dept_manager.dept_no
join employees
on dept_manager.emp_no = employees.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no, last_name, first_name, departments.dept_name from departments
join dept_emp
on departments.dept_no = dept_emp.dept_no
join employees
on dept_emp.emp_no = employees.emp_no;


--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select last_name, first_name, sex 
from employees
where first_name = 'Hercules' AND last_name LIKE 'B.%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no, last_name, first_name, departments.dept_name 
from departments
join dept_emp
on departments.dept_no = dept_emp.dept_no
join employees
on dept_emp.emp_no = employees.emp_no
where departments.dept_name='Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
select employees.emp_no, last_name, first_name, departments.dept_name 
from departments
join dept_emp
on departments.dept_no = dept_emp.dept_no
join employees
on dept_emp.emp_no = employees.emp_no
where departments.dept_name IN ('Sales','Development');

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
select last_name, count(last_name) from employees
group by last_name
order by count(last_name) DESC;


