#LIMIT_#ALIASING--Intermediate
SELECT *
FROM employee_demographics
LIMIT 3
;
SELECT *
FROM employee_demographics
LIMIT 3, 4
;
SELECT employee_id, age, gender AS sex
FROM employee_demographics
LIMIT 3, 2
;

#INNER JOIN is same as default JOIN
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id
    ;
    
    #counteroppositioning of left and right, change FROM and JOIN
SELECT *
FROM employee_salary AS sal
LEFT JOIN employee_demographics AS dem
    ON dem.employee_id = sal.employee_id
    
#UNION-- works for row data manipulation
;
SELECT first_name, last_name, 'Old Man' AS Label
FROM employee_demographics
WHERE age > 40 and gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics
WHERE age > 40 and gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000 
ORDER BY first_name, last_name