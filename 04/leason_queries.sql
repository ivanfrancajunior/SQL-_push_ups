SELECT * FROM employees.salaries WHERE salary  >= 150000;

SELECT * FROM employees.titles WHERE emp_no >= 11500;

SELECT * FROM employees.salaries WHERE salary BETWEEN 140000 AND 160000 ORDER BY salary ASC LIMIT 100;

SELECT * FROM employees.employees WHERE first_name LIKE 'Parto' AND gender LIKE 'F';

SELECT DISTINCT title FROM employees.titles;

SELECT * FROM employees.salaries WHERE salary BETWEEN 150000 AND 160000 AND from_date < '2000-01-01' ORDER BY salary ASC;

SELECT * FROM employees.titles ORDER BY title ASC LIMIT 5;

SELECT MIN(salary) as menor_salario FROM employees.salaries ;

SELECT MAX(salary) FROM employees.salaries ;

SELECT * FROM employees.salaries ORDER BY salary DESC LIMIT 1;

SELECT COUNT (*) as total_persons FROM employees.salaries WHERE salary >= 145000;

SELECT COUNT(*) AS register_total_number FROM employees.departments;

SELECT AVG (salary) as media_salario FROM employees.salaries;

SELECT SUM(salary) AS sum_of_salary FROM employees.salaries WHERE salary > 100000;

SELECT * FROM employees.employees WHERE first_name LIKE '%Par%' AND gender = 'M';

SELECT * FROM employees.dept_emp WHERE dept_no IN ("d005", "d006", "d007") LIMIT 100;

SELECT * FROM employees.departments WHERE dept_name IN ("Development", "Marketing") LIMIT 100;

SELECT * FROM employees.employees WHERE last_name IN('Facello', 'Peac') ORDER BY first_name ASC;
