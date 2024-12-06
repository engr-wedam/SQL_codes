#WHERE CLAUSE
SELECT *
FROM employee_salary
WHERE salary <= 50000
;

SELECT *
FROM employee_demographics
WHERE gender != 'Female'
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
;

#AND OR NOT#-- Logical Operators
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male'
;
SELECT first_name, last_name, Left (first_name,1) AS L1, Right(last_name,4) AS R4, concat( first_name, last_name)
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male';

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender != 'male'
;
SELECT *
FROM employee_demographics 
WHERE (first_name = 'Leslie' AND age = 44 ) OR age > 55
;

#GROUP BY--
SELECT gender, AVG (age), max(age), min(age), count(age)
FROM employee_demographics 
GROUP BY gender
;

#ORDER BY--
SELECT*
FROM employee_demographics
ORDER BY gender DESC, age
;

#HAVING(aggregated columns) vs WHERE(rows)--
SELECT occupation, avg(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING avg(salary) > 75000
;