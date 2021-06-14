--DELIVERABLE 1

--Retirement titles info
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
--INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Number of titles from the Unique Titles table
SELECT COUNT(ut.emp_no), ut.title
INTO title_breakdown
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT DESC;

--DELIVERABLE 2

--Mentorship Eligibility Table
SELECT DISTINCT ON (e.emp_no)
	e.first_name, 
	e.last_name, 
	e.birth_date, 
	de.from_date, 
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;


