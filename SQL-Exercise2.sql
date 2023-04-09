/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name AS "Product Name", c.Name AS "Category Name"
FROM products AS p
INNER JOIN categories AS c ON c.CategoryID = p.CategoryID
WHERE c.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating
FROM products AS p
INNER JOIN reviews as r ON p.ProductID = r.ProductID
WHERE r.Rating >= 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, SUM(s.Quantity) AS total 
FROM sales AS s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY total DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS "Department Name", c.Name AS "Category Name"
FROM departments AS d
INNER JOIN categories AS c ON d.DepartmentID = c.DepartmentID
WHERE c.Name = "Appliances" OR c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT p.Name, SUM(s.Quantity) AS "Total Sold", SUM(s.Quantity * s.PricePerUnit) AS "Total Price"
 FROM products AS p
 INNER JOIN sales AS s ON p.ProductID = s.ProductID
 WHERE p.ProductID = 97;
 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
-- Find the Visio TV product ID
-- SELECT p.ProductID FROM products AS p WHERE p.Name = "Visio TV"
SELECT p.Name AS "Product Name", r.Reviewer AS "Reviewer Name", r.Rating, r.Comment
FROM products AS p
INNER JOIN reviews AS r ON p.ProductID = r.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) AS TotalSold
FROM Sales AS s
INNER JOIN products AS p ON s.ProductID = p.ProductID
INNER JOIN employees AS e ON s.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY TotalSold DESC;