CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
    employee_name VARCHAR(20),
    salary DECIMAL(10, 2),
    department VARCHAR(100)
);
INSERT INTO employees (employee_id, employee_name, salary, department)
VALUES (1, 'John Doe', 50000, 'Sales'),
(2, 'Jane Smith', 60000, 'Marketing'),
(3, 'Bill Gates', 60000, 'Marketing'),
(4, 'Elon Musk', 70000, 'Information Technology');

-- procedure
CALL get_employees_by_department('Marketing');

-- view
CREATE VIEW EmployeeDetails AS
SELECT employee_id, employee_name, department, salary
FROM employees
WHERE salary > 50000;

SELECT * FROM EmployeeDetails;

-- procedure to insert data
CALL add_employee(5, 'Noam Shazeer', 100000, 'Information Technology');
SELECT * FROM employees;