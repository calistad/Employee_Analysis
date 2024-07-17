-- Retirement eligibility.
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring.
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create a new table for retiring employees.
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table.
SELECT * FROM retirement_info;

-- Join departments and dept_manager tables.
SELECT d.dept_name,
     	dm.emp_no,
     	dm.from_date,
     	dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
     ON d.dept_no = dm.dept_no;

-- Create a new table by joining retirement_info and dept_emp tables.
SELECT ri.emp_no,
    	ri.first_name,
    	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
     ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number.
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
     ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- Sort the column in descending order by date.
SELECT * FROM salaries
ORDER BY to_date DESC;

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

-- Create 3 new tables.

-- List of employees' information.
SELECT e.emp_no,
    	e.first_name,
	e.last_name,
    	e.gender,
    	s.salary,
    	de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
     ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
     ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
     AND (de.to_date = '9999-01-01');
	
-- List of managers per department.
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
INNER JOIN departments AS d
     ON (dm.dept_no = d.dept_no)
INNER JOIN current_emp AS ce
     ON (dm.emp_no = ce.emp_no);

-- Department List.
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_no
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
     ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
     ON (de.dept_no = d.dept_no)
ORDER BY de.dept_no;

-- List of employees' info in the selected team.
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
FROM current_emp as ce
INNER JOIN dept_emp as de
     ON (ce.emp_no = de.emp_no)
INNER JOIN departments as d
     ON (de.dept_no = d.dept_no)

	-- in sales team
	WHERE d.dept_name = 'Sales';

	-- in sales and development team
	WHERE d.dept_name IN ('Sales', 'Development');

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

-- Retiring employees by titles.
SELECT DISTINCT ON e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN title as t
     ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, t.to_date DESC;

-- Count of retiring employees by titles.
SELECT COUNT(rt.title), rt.title
INTO retiring_titles
FROM retirement_titles as rt
GROUP BY rt.title
ORDER BY COUNT(rt.title) DESC;

-- Find Mentorship Eligibility.
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees as e
JOIN dept_emp as de
     ON (e.emp_no = de.emp_no)
JOIN title as t
     ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') 
     AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no
