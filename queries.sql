-- ================================
-- Function: Calculate Bonus (Scalar Function)
-- ================================
CREATE OR REPLACE FUNCTION CalculateBonus(emp_salary NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
    RETURN emp_salary * 0.10;
END;
$$ LANGUAGE plpgsql;

-- Usage
SELECT Name, Salary, CalculateBonus(Salary) AS Bonus FROM Employees;

-- ================================
-- Function: Get Employees by Department (Table-valued)
-- ================================
CREATE OR REPLACE FUNCTION GetEmployeesByDept(dept_id INT)
RETURNS TABLE(EmpID INT, Name VARCHAR, Salary NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT EmpID, Name, Salary FROM Employees WHERE DepartmentID = dept_id;
END;
$$ LANGUAGE plpgsql;

-- Usage
SELECT * FROM GetEmployeesByDept(2);

-- ================================
-- Procedure: Increase Salary by Percentage
-- ================================
CREATE OR REPLACE PROCEDURE IncreaseSalary(emp_id INT, percent NUMERIC)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * percent/100)
    WHERE EmpID = emp_id;
END;
$$;

-- Usage
CALL IncreaseSalary(1, 5);

-- ================================
-- Procedure: Transfer Employee
-- ================================
CREATE OR REPLACE PROCEDURE TransferEmployee(emp_id INT, new_dept INT)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE Employees
    SET DepartmentID = new_dept
    WHERE EmpID = emp_id;
END;
$$;

-- Usage
CALL TransferEmployee(3, 4);

-- ================================
-- Example of IN and OUT parameter
-- ================================
CREATE OR REPLACE PROCEDURE GetSalaryInfo(IN emp_id INT, OUT emp_name VARCHAR, OUT emp_salary NUMERIC)
LANGUAGE plpgsql AS $$
BEGIN
    SELECT Name, Salary INTO emp_name, emp_salary FROM Employees WHERE EmpID = emp_id;
END;
$$;

-- Usage
CALL GetSalaryInfo(2, emp_name := NULL, emp_salary := NULL);

-- ================================
-- Trigger Example
-- ================================
CREATE TABLE SalaryAudit (
    AuditID SERIAL PRIMARY KEY,
    EmpID INT,
    OldSalary NUMERIC,
    NewSalary NUMERIC,
    ChangedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION log_salary_changes()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO SalaryAudit(EmpID, OldSalary, NewSalary)
    VALUES(OLD.EmpID, OLD.Salary, NEW.Salary);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER salary_update_trigger
AFTER UPDATE OF Salary ON Employees
FOR EACH ROW
EXECUTE FUNCTION log_salary_changes();
