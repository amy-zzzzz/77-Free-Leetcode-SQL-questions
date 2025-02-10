CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
        SELECT salary
        FROM (
            SELECT salary, RANK() OVER (ORDER BY salary DESC) AS rnk
            FROM Employee
        ) AS ranked
        WHERE rnk = N
        LIMIT 1
  );
END
