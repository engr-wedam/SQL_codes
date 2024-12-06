-- CTE(Common Table Expression/same as subquery but this comes on top-~I call it temporary table~)-- 	Advanced 	


WITH CTE_Example AS
(
SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT avg(`AVG(salary)`) 
FROM CTE_Example
;

-- OR THE ABOVE CAN BE WRITTEN AS --
WITH CTE_Example_2 AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal) 
FROM CTE_Example_2
;

WITH CTE_Example_3  AS
(
SELECT first_name, last_name, LEFT(first_name,2) AS 2Firstname
FROM employee_demographics
)
SELECT  first_name, last_name, 2Firstname, CONCAT(2Firstname, last_name)
FROM  CTE_Example_3
;

WITH CTE_Example_3 (NAM, SURMN, 2FN)  AS
(
SELECT first_name, last_name, LEFT(first_name,2) AS 2Firstname
FROM employee_demographics
)
SELECT  NAM, SURMN
FROM  CTE_Example_3 