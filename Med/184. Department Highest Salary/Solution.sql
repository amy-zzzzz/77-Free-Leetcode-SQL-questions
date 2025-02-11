WITH t1 AS
(SELECT departmentId, name, salary, RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rk
FROM Employee
)

SELECT d.name as Department, t1.name as Employee, salary as Salary
FROM t1
LEFT JOIN Department d on t1.departmentId = d.id
WHERE t1.rk=1
