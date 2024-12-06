-- String Functions --

SELECT length('skyfall');
#############################
SELECT RTRIM('               sky       ');
SELECT LTRIM('               sky       ');
SELECT TRIM('               sky       ');
############################
SELECT first_name, 
length(first_name), 
locate('An',first_name), last_name, substring(last_name,3) AS LN3,
LOWER(CONCAT(first_name,' ', last_name)) AS full_name, 
LEFT(first_name,2), Right(last_name,2), substring(first_name,2), UPPER(substring(first_name,2))
FROM employee_demographics;

-- Case Statements --
SELECT 
first_name, 
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age > 50 THEN 'near death'
END AS Age_Bracket
FROM employee_demographics;

-- Pay Increase and Bonus --
-- < 50000 = 5%
-- > 70000 = 7%
-- Finance = 10%

SELECT *
FROM employee_salary;

SELECT first_name, last_name, salary, dept_id,
CASE
	WHEN salary <= 50000 THEN 1.05*salary
    WHEN salary > 50000 THEN 1.07*salary
END AS New_Salary,
CASE
	WHEN dept_id = 6 THEN salary*1.10
END AS Finance_Bonus,
CASE
	WHEN first_name = 'Leslie' THEN left(first_name,3)
END
FROM employee_salary
;

##################

-- Subqueries --
SELECT * 
FROM employee_demographics
WHERE employee_id IN
					(Select employee_id From employee_salary Where dept_id = 1)
                    ;
-- (trying the union row option : gives you the image of is coming up)--
SELECT * 
FROM employee_demographics
RIGHT Join employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id 
;
