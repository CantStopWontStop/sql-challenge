-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no, emp.first_name, emp.last_name, emp.sex, s.emp_no, s.salary
FROM employees as emp
INNER JOIN salaries as s on 
emp.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name,  hire_date from  employees
WHERE date_part('year',hire_date) = 1986;


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept.dept_no, dept.dept_name,  man.emp_no, emp.first_name, emp.last_name
FROM departments as dept
INNER JOIN dept_manager as man on 
dept.dept_no = man.dept_no
LEFT JOIN employees as emp on
man.emp_no = emp.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM  employees as emp
INNER JOIN dept_emp as dept on
emp.emp_no = dept.emp_no
INNER JOIN departments as dep on
dept.dept_no = dep.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name,  sex from  employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM  employees as emp
INNER JOIN dept_emp as dept on
emp.emp_no = dept.emp_no
INNER JOIN departments as dep on
dept.dept_no = dep.dept_no
WHERE dep.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM  employees as emp
INNER JOIN dept_emp as dept on
emp.emp_no = dept.emp_no
INNER JOIN departments as dep on
dept.dept_no = dep.dept_no
WHERE dep.dept_name = 'Sales' or dep.dept_name = 'Development';

-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT last_name,  COUNT(last_name) AS "Number of Surnames"
FROM  employees
GROUP BY last_name
ORDER BY last_name DESC;