-- Windows Funtion --(sort of grouping from two windows(tables))
SELECT gender, AVG(salary) OVER()
FROM employee_demographics
JOIN employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id ;
----------------------------------
SELECT gender, AVG(salary) OVER( PARTITION BY gender)
FROM employee_demographics
JOIN employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id ;
-----------------------------------
SELECT dem.first_name, dem.last_name, gender, dem.employee_id, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id),
ROW_NUMBER () OVER (),
ROW_NUMBER () OVER (PARTITION BY gender),
RANK () OVER (PARTITION BY gender ORDER BY salary DESC),
DENSE_RANK () OVER (PARTITION BY gender ORDER BY salary DESC)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id
;