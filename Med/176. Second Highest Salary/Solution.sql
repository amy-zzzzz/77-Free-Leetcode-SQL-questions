--Solution 1:
SELECT (
    SELECT salary
    FROM (
        SELECT salary, RANK() OVER (ORDER BY salary DESC) AS rnk
        FROM Employee
    ) AS t
    WHERE rnk = 2
    LIMIT 1
) AS SecondHighestSalary;

--Solution 2:
SELECT 
    IF(COUNT(DISTINCT salary) < 2, NULL, (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET 1
    )) AS SecondHighestSalary
FROM Employee;
