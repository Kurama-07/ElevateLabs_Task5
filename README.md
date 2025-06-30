# ElevateLabs_Task5
# SQL Developer Internship - Task 5: SQL Joins (Inner, Left, Right, Full)

## 📌 Objective
Learn to combine data from multiple tables using:
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN

## 📊 Tables Created

**1️⃣ Customers**

| CustomerID | Name    | City       |
|------------|---------|------------|
| 1          | Alice   | Delhi      |
| 2          | Bob     | Mumbai     |
| 3          | Charlie | Bangalore  |
| 4          | David   | Chennai    |

**2️⃣ Orders**

| OrderID | CustomerID | Product      |
|---------|------------|--------------|
| 101     | 1          | Laptop       |
| 102     | 2          | Phone        |
| 103     | 1          | Keyboard     |
| 104     | 5          | Mouse        |

## 🛠️ Queries Demonstrated

### INNER JOIN
```sql
SELECT Customers.Name, Orders.Product
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
