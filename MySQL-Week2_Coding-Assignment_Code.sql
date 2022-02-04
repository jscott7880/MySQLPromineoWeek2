#1. I want to know how many employees with each title were born after 1965-01-01.
SELECT t.title as 'Title', count(*) AS "Number of Employees" FROM titles t
INNER JOIN employees e USING (emp_no)
WHERE e.birth_date > '1965-01-01'
GROUP BY title;

#2. I want to know the average salary per title.
SELECT title AS 'Title', avg(salary) AS 'Average Salary' FROM salaries
INNER JOIN titles t USING (emp_no)
GROUP BY title;

#3. How much money was spent on salary for the marketing department between the years 1990 and 1992?
SELECT sum(salary) AS 'Marketing Salary Total 1990-1992' FROM salaries
INNER JOIN dept_emp USING (emp_no)
INNER JOIN departments d USING (dept_no)
WHERE d.dept_name LIKE 'Marketing' AND (year(salaries.from_date) BETWEEN '1990' AND '1992'
OR year(salaries.to_date) BETWEEN '1990' AND '1992')
GROUP BY dept_emp.dept_no;
