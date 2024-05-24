-- [SECTION TWO]
-- PROBLEM 1
DROP DATABASE IF EXISTS construct;
CREATE DATABASE IF NOT EXISTS construct;
USE construct;


-- PROBLEM 2
DROP TABLE IF EXISTS employee;
CREATE TABLE IF NOT EXISTS employee(
	EMP_FIRST_NAME	VARCHAR(10),
	EMP_LAST_NAME	VARCHAR(10),
	EMP_START_DATE	DATETIME,
	EMP_ID			VARCHAR(255),
 EMP_TENURE     	CHAR(100),
	PRIMARY KEY(EMP_ID)
);


-- PROBLEM 3
INSERT INTO employee (EMP_FIRST_NAME, EMP_LAST_NAME, EMP_START_DATE, EMP_ID, EMP_TENURE) VALUES ('John', 'Smith', '2013-4-23 15:30:45', 1, 10) ON DUPLICATE KEY UPDATE EMP_FIRST_NAME=EMP_FIRST_NAME, EMP_LAST_NAME=EMP_LAST_NAME, EMP_START_DATE=EMP_START_DATE, EMP_ID=EMP_ID, EMP_TENURE=EMP_TENURE;
SELECT * FROM employee;


-- [SECTION THREE]
USE myconstructionco;


-- PROBLEM 1
My evidence / proof
SELECT * FROM employee ORDER BY emp_years;
My own test query
SELECT emp_fname, emp_lname, emp_hiredate, emp_years FROM employee WHERE emp_years > 25 ORDER BY emp_hiredate DESC;
My own tweaked test query
SELECT emp_fname, emp_lname, emp_hiredate, emp_years FROM employee WHERE emp_years > 10 ORDER BY emp_hiredate DESC;


-- PROBLEM 2
SELECT * FROM job ORDER BY job_chg_hour DESC;


-- PROBLEM 3
SELECT assign_num FROM assignment WHERE assign_chg_hr > 84.5 AND assign_charge < 200;


-- PROBLEM 4
SELECT CONCAT(emp_fname, ' ', emp_initial, ' ', emp_lname) AS 'employee name' FROM employee WHERE job_code = 501 ORDER BY emp_fname;


-- PROBLEM 5
SELECT (proj_value - proj_balance) AS 'remaining balance', proj_num, proj_name FROM PROJECT;


-- PROBLEM 6
SELECT assign_num, e.emp_num, assign_hours FROM assignment a JOIN employee e ON a.emp_num = e.emp_num wHERE (assign_job = 501 OR assign_job = 502) AND assign_hours > 3;


-- PROBLEM 7
SELECT emp_fname, emp_lname, emp_initial FROM employee WHERE emp_fname LIKE 'a%';


-- PROBLEM 8
My evidence / proof
SELECT * FROM job
My own test query
SELECT * FROM job WHERE job_description LIKE '%analyst%' AND job_description LIKE '%engineer%';
My own tweaked test query
SELECT * FROM job WHERE job_description LIKE '%applications%' AND job_description LIKE '%designer%';
