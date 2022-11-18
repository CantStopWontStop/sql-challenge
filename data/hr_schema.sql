DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_managers;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;



CREATE TABLE titles (
	title_id VARCHAR(30) PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);


CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(30) NOT NULL,	
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date VARCHAR(30) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(10) NOT NULL,
	hire_date VARCHAR(30)
);

-
CREATE TABLE departments (
	dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);



CREATE TABLE dept_emp (
	dept_no VARCHAR(30) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE dept_managers (
	dept_no VARCHAR(30) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

copy titles from 'C:\Digital_Projects\GitHub\GT\Challenges\sql-challenge\data\titles.csv' with csv HEADER;
copy employees from 'C:\Digital_Projects\GitHub\GT\Challenges\sql-challenge\data\employees.csv' with csv HEADER;
copy departments from 'C:\Digital_Projects\GitHub\GT\Challenges\sql-challenge\data\departments.csv' with csv HEADER;
copy dept_emp (emp_no, dept_no) from 'C:\Digital_Projects\GitHub\GT\Challenges\sql-challenge\data\dept_emp.csv' with csv HEADER;
copy dept_manager from 'C:\Digital_Projects\GitHub\GT\Challenges\sql-challenge\data\dept_manager.csv' with csv HEADER;
copy salaries from 'C:\Digital_Projects\GitHub\GT\Challenges\sql-challenge\data\salaries.csv' with csv HEADER;