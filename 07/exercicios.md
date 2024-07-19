1.Agrupe os trabalhadores por data de contratação, para ver se muitas
pessoas foram contratadas no mesmo dia;
A coluna é hire date;

```sql

select hire_date, COUNT (hire_date) as 'employees_by_hire_date'
FROM employees
GROUP BY employees.hire_date
ORDER BY hire_date ASC;


```

2.Agrupe novamente os trabalhadores por data de contratação, porém exiba as datas que tem menos ou 50 colaboradores contratados;

```sql

SELECT hire_date, COUNT (hire_date) as 'employees_by_hire_date'
FROM employees
GROUP BY employees.hire_date
HAVING COUNT(hire_date) < 50;

```