-- SQL Joins Practice for MySQL Workbench

-- Drop tables if they already exist to avoid errors during reruns
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    Amount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample data into Customers
INSERT INTO Customers (CustomerID, Name, City) VALUES 
(1, 'Alice', 'Delhi'),
(2, 'Bob', 'Mumbai'),
(3, 'Charlie', 'Bangalore'),
(4, 'David', 'Kolkata');

-- Insert sample data into Orders
INSERT INTO Orders (OrderID, CustomerID, Product, Amount) VALUES
(101, 1, 'Laptop', 70000),
(102, 2, 'Mobile', 25000),
(103, 1, 'Headphones', 3000);

-- INNER JOIN: Customers with Orders
SELECT Customers.CustomerID, Customers.Name, Orders.OrderID, Orders.Product, Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- LEFT JOIN: All Customers, Orders if any
SELECT Customers.CustomerID, Customers.Name, Orders.OrderID, Orders.Product, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- RIGHT JOIN: All Orders, Customers if any
SELECT Customers.CustomerID, Customers.Name, Orders.OrderID, Orders.Product, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- FULL OUTER JOIN: All Customers and Orders with matches where possible
SELECT Customers.CustomerID, Customers.Name, Orders.OrderID, Orders.Product, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerID, Customers.Name, Orders.OrderID, Orders.Product, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- CROSS JOIN: Cartesian Product
SELECT Customers.Name, Orders.Product
FROM Customers
CROSS JOIN Orders;

-- SELF JOIN: Customers in the same city
SELECT C1.Name AS Customer1, C2.Name AS Customer2, C1.City
FROM Customers C1
INNER JOIN Customers C2 ON C1.City = C2.City AND C1.CustomerID < C2.CustomerID;
