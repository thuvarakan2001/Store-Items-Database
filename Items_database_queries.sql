--Findind the basic information on items from items table 
SELECT ItemId, ItemName, ItemDesc FROM Items

--Finding the stores that have monthly visitors between 10000 and 40000 monthly visitors 
SELECT StoreName, StoreId FROM Stores
WHERE MonthlyVisitors >= 10000 AND MonthlyVisitors <= 40000

--Finding items named 'Cookies' and order by the item Name and Item description 
SELECT * FROM Items 
WHERE ItemName = 'Cookies' ORDER BY ItemName, ItemDesc

--Finding Walmarts that have more than 10000 monthly visitors 
SELECT * FROM Stores 
WHERE StoreName = 'Walmart' AND MonthlyVisitors >= 10000

--Find associates who make more than 20000$
SELECT * FROM Employees
WHERE Position = 'Associate' AND Salary >= 20000

--Finding for managers and assistant managers who make more than 35000$
SELECT * FROM Employees 
WHERE (Position = 'Manager' OR Position = 'Assistant Manager') 
AND Salary >= 35000

--Queries that result in employees that work as 'Diary associate' and 'stocker'
SELECT * FROM Employees 
WHERE NOT (Position = 'Diary Associate' OR Position = 'Stocker')

--Sort for items that have tomato sauce in the name 
SELECT * FROM Items
WHERE ItemName = 'tomato sauce%'


--Finding the count for the items made in 2021 and are considered baked goods
SELECT COUNT(*) AS "Number of Baked Items made in 2021"
FROM Items 
WHERE ItemDesc = 'Baked good' AND YEAR(ItemDate) = 2021


--Finding the minimum visitors from store named 'Costco' 
SELECT MIN(MonthlyVisitors) AS "Minimum number of visitors from stores" 
FROM Stores
WHERE StoreName = 'Costco'

--Finding the average Salary of Managers that work at the stores 
SELECT AVG(Salary) AS "Average Salary of Managers" 
FROM Employees 
WHERE Position = 'Manager'

--Finding the average Salary of Associates that work in the stores
SELECT AVG(Salary) AS "Average Salary of Associates" 
FROM Employees 
WHERE Position = 'Associate'

--Counting the total number of Diary Associates working between all stores 
SELECT COUNT(Salary) AS "Number of Diary Associates Working currently" 
FROM Employees 
WHERE Position = 'Diary Associate'
GROUP BY EmpName
HAVING COUNT(*) >= 0

--Inner join between Employees, stores and Items to find Items name 'Pasta' that is located in 'Etobicoke' 
SELECT Employees. * FROM Employees INNER JOIN Stores
ON Stores.ManagerID = Employees.ManagerID INNER JOIN Items
ON Items.ItemId = Stores.ItemID
WHERE ItemName = 'Pasta' AND CityLoc = 'Etobicoke'
ORDER BY StoreName

--Finding managers who work in Walmart from employee and stores table
SELECT EmpId, empName,Position FROM Employees
WHERE ManagerID IN 
(SELECT ManagerID FROM Stores 
WHERE StoreName = 'Walmart' 
GROUP BY ManagerID
HAVING COUNT(*) > 0)

--Finding Item ID and Item name of items that are made in the year 2022 
SELECT ItemID, ItemName FROM Items
WHERE ItemDesc IN 
(SELECT ItemId FROM Items
WHERE YEAR(ItemDate) = 2022)

--Looking for employees who have a salary and are greater or equal to 1
SELECT * FROM Employees 
WHERE Salary IN 
(SELECT Salary  FROM Employees
GROUP BY Salary
HAVING COUNT(*) >= 1)

--Inserting new employee into the database 
INSERT INTO Employees
(EmpId,EmpName,Position,Salary,Gender) 
VALUES (11, 'Thuvarakan', 'Associate', '20000', 'M')

--Updating the Salaries of Associates as they got a 5% boost in salary 
UPDATE Employees
SET Position = 'Associate', 
Salary = Salary + (Salary * 0.05)
WHERE Position = 'Associate'

--Deleting the newly added employee in the database
DELETE FROM Employees
WHERE EmpId = '11'







