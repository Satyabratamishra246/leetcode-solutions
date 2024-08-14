-- Question 2.  176. Second Highest Salary

-- Write a SQL query to get the second highest salary from the Employee table.
--  If there is no second highest salary, then the query should return null.


-- Solution 1.

SELECT MAX(Salary) AS MaxSalary
FROM Employee 
WHERE salary NOT IN (SELECT MAX(salary) FROM Employee);

-- Solution 2.

WITH RankedTable
AS	(
	SELECT 
		id
		, Salary
		, DENSE_RANK() OVER(ORDER BY salary DESC) AS Rnk
	FROM Employee
	)
SELECT
	DISTINCT salary AS MaxSalary
FROM
	RankedTable
WHERE
	Rnk = 2;

-- Solution 3.

SELECT 
    MAX(e1.Salary) AS MaxSalary
FROM 
    Employee e1
JOIN
    Employee e2 
    ON e1.Salary < e2.Salary;


