-- Employee HR Dataset

-- 1. List all employees hired in 2021
SELECT * FROM employee_hr WHERE YEAR(hiredate) = 2021;

-- 2. Find the top 10 highest-paid employees
SELECT employeename, salary FROM employee_hr ORDER BY salary DESC LIMIT 10;

-- 3. What is the average salary for each department?
SELECT department, AVG(salary) AS avg_salary FROM employee_hr GROUP BY department;

-- 4. Find the number of employees in the "IT" department
SELECT COUNT(*) AS it_employees FROM employee_hr WHERE department = 'IT';

-- 5. What is the employee with the highest performance rating?
SELECT employeename, performancerating FROM employee_hr ORDER BY performancerating DESC LIMIT 1;

-- 6. List all employees who have a salary greater than $100,000 and a performance rating of 5
SELECT employeename FROM employee_hr WHERE salary > 100000 AND performancerating = 5;

-- 7. What is the total number of employees hired in the "Sales" department?
SELECT COUNT(*) AS sales_employees FROM employee_hr WHERE department = 'Sales';

-- 8. Find the employee with the longest tenure at the company
SELECT employeename, yearsatcompany FROM employee_hr ORDER BY yearsatcompany DESC LIMIT 1;

-- 9. What is the average salary for employees older than 40 years?
SELECT AVG(salary) AS avg_salary FROM employee_hr WHERE age > 40;

-- 10. List all employees in the "HR" department who have a bonus of $5,000 or more
SELECT employeename FROM employee_hr WHERE department = 'HR' AND bonus >= 5000;

-- 11. Find the top 5 cities with the highest number of employees
SELECT city, COUNT(*) AS employee_count 
FROM employee_hr 
GROUP BY city 
ORDER BY employee_count DESC 
LIMIT 5;

-- 12. What is the average performance rating for employees with more than 5 years at the company?
SELECT AVG(performancerating) AS avg_performance_rating FROM employee_hr WHERE yearsatcompany > 5;

-- 13. Which employees are from the "Finance" department and have a performance rating of 4 or higher?
SELECT employeename FROM employee_hr WHERE department = 'Finance' AND performancerating >= 4;

-- 14. What percentage of employees earn more than $80,000?
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employee_hr)) AS percentage_high_salary
FROM employee_hr 
WHERE salary > 80000;

-- 15. Find the total bonus amount given to employees in the "Marketing" department
SELECT SUM(bonus) AS total_bonus FROM employee_hr WHERE department = 'Marketing';

-- 16. What is the highest salary for any employee in the "Engineering" department?
SELECT employeename, salary FROM employee_hr WHERE department = 'Engineering' ORDER BY salary DESC LIMIT 1;

-- 17. List all employees who have undergone more than 40 hours of training and have a performance rating of 4 or higher
SELECT employeename FROM employee_hr WHERE traininghours > 40 AND performancerating >= 4;

-- 18. What is the correlation between years at the company and performance rating?
SELECT CORR(yearsatcompany, performancerating) AS correlation_years_performance FROM employee_hr;

-- 19. Find the average salary and years at the company for each department
SELECT department, AVG(salary) AS avg_salary, AVG(yearsatcompany) AS avg_years_at_company 
FROM employee_hr 
GROUP BY department;

-- 20. Which 5 employees have the highest performance rating but the lowest salary?
SELECT employeename, performancerating, salary 
FROM employee_hr 
ORDER BY performancerating DESC, salary ASC 
LIMIT 5;
