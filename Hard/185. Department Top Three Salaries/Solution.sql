WITH e1 AS
(SELECT name, salary, departmentId, DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rk
FROM Employee)

SELECT d.name AS Department, e1.name AS Employee, e1.salary AS Salary
FROM e1
LEFT JOIN Department d ON e1.departmentId = d.id
WHERE e1.rk<=3
