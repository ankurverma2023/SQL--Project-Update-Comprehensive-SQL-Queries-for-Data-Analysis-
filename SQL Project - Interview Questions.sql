
-- SQL INTERVIEW QUESTIONS AND ANSWERS
-- Project Name - "Comprehensive SQL Queries for Data Analysis"

CREATE DATABASE PROJECT
USE PROJECT

-- Q1- What is SQL?
-- Ans - SQL (Structured Query Language) is a standard language used to manage and manipulate relational databases

-- Q2- What are the different types of SQL commands?
-- DDL (Data Definition Language): CREATE, ALTER, DROP
-- DML (Data Manipulation Language): SELECT, INSERT, UPDATE, DELETE
-- DCL (Data Control Language): GRANT, REVOKE
-- TCL (Transaction Control Language): COMMIT, ROLLBACK, SAVEPOINT

-- Table Create EMPLOYEE
CREATE TABLE EMPLOYEE
(
EmployeeID INT PRIMARY KEY,
Name VARCHAR(50),
Department VARCHAR(50),
Salary DECIMAL(10,2)
)
INSERT INTO EMPLOYEE VALUES(1,'John Doe','Sales',45000),
(2,'Jane Smith','HR',55000),
(3,'Alice Johnson','Sales',48000),
(4,'Bob Brown','IT',60000),
(5,'Charlei Davis','HR',52000)

SELECT * FROM EMPLOYEE

-- Table Create ORDERS
CREATE TABLE ORDERS
(
OrderID INT PRIMARY KEY,
OrderDate DATE,
EmployeeID INT,
FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
)
INSERT INTO ORDERS VALUES(101,'2024-7-24',1),
(102,'2024-7-25',2),
(103,'2024-8-15',3),
(104,'2024-8-16',4),
(105,'2024-9-10',5)

SELECT * FROM ORDERS

--Q3- How to write a SQL query to retrieve all records from a table?
SELECT * FROM EMPLOYEE
SELECT * FROM ORDERS

--Q4- How to filter records based on a condition?
SELECT * FROM EMPLOYEE
WHERE Department = 'Sales'

--Q5- Explain the difference between INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN.
-- INNER JOIN: Returns records with matching values in both tables.
-- LEFT JOIN: Returns all records from the left table and matched records from the right table.
-- RIGHT JOIN: Returns all records from the right table and matched records from the left table.
-- FULL JOIN: Returns records when there is a match in either table.

SELECT EMPLOYEE.Name, ORDERS.OrderID
FROM EMPLOYEE
INNER JOIN ORDERS ON EMPLOYEE.EmployeeID = ORDERS.OrderID

--Q6-  How to aggregate data using SQL?
-- This query groups employees by department and calculates the count and average salary.

SELECT Department, COUNT(*) as Employeecount, AVG(Salary) AS AverageSalary
from EMPLOYEE
Group by Department

--Q7- What is a subquery? (A subquery is a query nested inside another query)
-- This finds employees with a salary higher than the average salary.

SELECT Name
from EMPLOYEE
where Salary > (SELECT AVG(Salary) FROM EMPLOYEE)

--Q8- How to update records in a table?
--This increases the salary of all Sales department employees by 10%

UPDATE EMPLOYEE
SET Salary = Salary * 1.1
WHERE Department = 'Sales'

UPDATE EMPLOYEE
SET Salary = Salary * 1.1
WHERE Department = 'HR'

UPDATE EMPLOYEE
SET Salary = Salary * 1.1
WHERE Department = 'IT'

select * from EMPLOYEE

--Q9- How to delete records from a table?
-- This deletes the employee with EmployeeID 101 from the Employees table.

DELETE FROM EMPLOYEE
WHERE EmployeeID = 101

--Q10- What is the difference between WHERE and HAVING clauses?
-- WHERE: Filters rows before grouping.
-- HAVING: Filters groups after grouping.
-- This finds departments with more than 10 employees.

SELECT Department, COUNT(*) AS EmployeeCOUNT       -- Less Than
FROM EMPLOYEE
GROUP BY Department
HAVING COUNT(*) < 10

SELECT Department, COUNT(*) AS EmployeeCOUNT       -- Greater Then
FROM EMPLOYEE
GROUP BY Department
HAVING COUNT(*) > 10

--Q11- How to sort data in SQL?
-- This sorts employees by salary in descending order.

SELECT Name, Salary 
from EMPLOYEE
ORDER BY Salary DESC

SELECT Name, Salary 
from EMPLOYEE
ORDER BY Salary ASC

--Q12-  What are indexes and why are they used?
-- Indexes are database objects that improve the speed of data retrieval operations on a table

CREATE INDEX IDX_EMPLOYEE_Name ON Employee(Name)

--Q13- How to use CASE statements in SQL?
--This classifies employees' salaries into High, Medium, or Low.

SELECT Name, Salary,
       CASE
	      WHEN Salary > 60000 THEN 'HIGH'
		  WHEN Salary Between 30000 AND 55000 THEN 'MEDIUM'
		  ELSE 'LOW'
	   END AS SalaryRange
from EMPLOYEE