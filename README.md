# Pewlett-Hackard-Analysis

## Background

Now that Bobby has proven his SQL chops, his manager has given both of you two more assignments: determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. Then, you’ll write a report that summarizes your analysis and helps prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.

## Purpose 

The purpose of this analysis is to build an employee database with sql by applying data modeling, engineriing and analysis skills to help the manager prepare for the upcoming "silver tsunami." The analysis consists of two technical analysis deliverables and a written report. You will help Bobby create a list of the number of retiring employees by title and the employees eligible for the membership program. 

- Write a query to create a Retirement Titles table that holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955.


- Write a query to create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965 and are eligible to participate in a mentorship program.

# Results

## The Number of Retiring Employees by Title

![The Number of Retiring Employees by Title](https://github.com/yessiez/Pewlett-Hackard-Analysis/blob/master/The%20Number%20of%20Retiring%20Employees%20by%20Title.png?raw=true)

- Of the 300,024 employees within the company, 90,398 are eligible for retirement.

- Senior Engineers, Senior Staff, and Engineers are the positions that will have the most vacancies post "silver tsunami."


## The Employees Eligible for the Mentorship Program

![The Employees Eligible for the Mentorship Program](https://github.com/yessiez/Pewlett-Hackard-Analysis/blob/master/Membership_Eligibility.png?raw=true)

- There are 1,459 employees eligible to participate it the mentorship program.

- The two managers who are eligible for retirement are both eligible to participate in the mentorship program.

## Summary

- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
  - 90,398 roles will need to be filled as the "silver tsunami" begins to make an impact.


- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
  - No, there are only 1,459 retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees.


### Number of female employees at Pewlett Hackard

        -- Female employe count
        SELECT COUNT(first_name)
        FROM employees
        WHERE gender = 'F';

![female count](https://github.com/yessiez/Pewlett-Hackard-Analysis/blob/master/Images/female_count.png?raw=true)

### Females employees who meet the critera for a retirement package by title

    -- Retiring females table
    SELECT DISTINCT ON (e.emp_no) e.emp_no, 
        e.first_name, 
        e.last_name,
        ti.title, 
        e.gender
    INTO female_retirement_titles
    FROM employees AS e
    INNER JOIN titles AS ti
    ON (e.emp_no = ti.emp_no)
    WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
    AND gender = 'F'
    ORDER BY emp_no;

    -- Number of titles from the retiring females table
    SELECT COUNT(emp_no), title
    INTO ri2_females_title
    FROM female_retirement_titles 
    GROUP BY title
    ORDER BY COUNT DESC;

![females by title](https://github.com/yessiez/Pewlett-Hackard-Analysis/blob/master/Images/retiring_female_titles.png?raw=true)

