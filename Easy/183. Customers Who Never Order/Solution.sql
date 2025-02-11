--Solution 1:
SELECT c.name AS Customers
FROM Customers c
WHERE c.id NOT IN (SELECT DISTINCT customerId FROM Orders);

--Solution 2:
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL;
