# COMMIT & ROLLBACK

CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
    employee_name VARCHAR(20),
    salary DECIMAL(10, 2),
    department VARCHAR(100)
);

INSERT INTO employees (employee_id, employee_name, salary, department)
VALUES (090, 'Sachin', 40000, 'SCOPE');
COMMIT;

SELECT * FROM employees;

START TRANSACTION;
UPDATE employees 
SET salary = 90000
WHERE employee_id = 090;

SELECT * FROM employees;

ROLLBACK;
SELECT * FROM employees;

# SAVEPOINT

CREATE TABLE products (
	product_id INT PRIMARY KEY,
    product_name VARCHAR(20)
);

INSERT INTO products (product_id, product_name)
VALUES (01, 'Orange');
INSERT INTO products (product_id, product_name)
VALUES (02, 'Mango');

SELECT * FROM products;

SAVEPOINT sp1;
	
INSERT INTO products (product_id, product_name)
VALUES (03, 'Banana');
SELECT * FROM products;

ROLLBACK TO sp1;
SELECT * FROM products;