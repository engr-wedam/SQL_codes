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
OR NOT gender = 'male'
;
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