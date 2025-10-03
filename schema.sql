-- Departments Table

CREATE TABLE Departments (
    DeptID SERIAL PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);


-- Employees Table

CREATE TABLE Employees (
    EmpID SERIAL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DepartmentID INT REFERENCES Departments(DeptID),
    Salary NUMERIC(10,2)
);
