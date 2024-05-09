create database employee_database;

CREATE TABLE Departments (
      department_id INT PRIMARY KEY,
      department_name VARCHAR(100)
    );
    
CREATE TABLE Employees (
      employee_id INT PRIMARY KEY,
      name VARCHAR(100),
      age INT,
      department_id INT,
      FOREIGN KEY (department_id) REFERENCES Departments(department_id)
    );
    
INSERT INTO Departments (department_id, department_name) VALUES
(1, 'Human Resources'),
(2, 'Marketing'),
(3, 'Engineering'),
(4, 'Sales');
    
INSERT INTO Employees (employee_id, name, age, department_id) VALUES
(101, 'Alice Smith', 29, 3),
(102, 'Bob Johnson', 25, 2),
(103, 'Charlie Davis', 32, 3),
(104, 'Diana Evans', 28, 1),
(105, 'Evan Roberts', 34, 4),
(106, 'Fiona Green', 26, 1),
(107, 'George Brown', 30, 2),
(108, 'Hannah White', 27, 4),
(109, 'Ian Clark', 31, 1),
(110, 'Judy Hall', 24, 3);
    
    
    -- Query to list unique department names from the Departments table
SELECT DISTINCT department_name
FROM Departments
JOIN Employees ON Departments.department_id = Employees.department_id;

-- Count the total number of employees in each department
SELECT department_name, COUNT(employee_id) AS employee_count
FROM Employees
JOIN Departments ON Employees.department_id = Departments.department_id
GROUP BY department_name;

-- Retrieve details of employees whose ages are between 25 and 30
SELECT name, age, department_id
FROM Employees
WHERE age BETWEEN 25 AND 30;
