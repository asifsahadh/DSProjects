-- EMPLOYEES
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
(4, 'Elon Musk', 70000, 'Marketing');

-- CUSTOMERS
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50)
);
INSERT INTO customers (customer_id, customer_name, country)
VALUES (1, 'Alice', 'USA'),
       (2, 'Bob', 'India'),
       (3, 'Charlie', 'UK');

-- ORDERS
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    year INT
);
INSERT INTO orders (order_id, customer_id, product_id, order_date, year)
VALUES (1, 1, 101, '2023-01-15', 2023),
       (2, 2, 102, '2022-06-20', 2022),
       (3, 1, 103, '2022-11-03', 2022),
       (4, 3, 104, '2023-03-12', 2023);

-- DEPARTMENTS
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
INSERT INTO departments (department_id, department_name)
VALUES (1, 'Sales'),
       (2, 'Marketing'),
       (3, 'IT');

-- STORE PRODUCTS
CREATE TABLE store_products (
    store_id INT,
    product_id INT,
    PRIMARY KEY (store_id, product_id)
);
INSERT INTO store_products (store_id, product_id)
VALUES (1, 101),
       (2, 101),
       (3, 101),
       (1, 102),
       (2, 103),
       (3, 104);

-- PRODUCTS 1
CREATE TABLE products1 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);
INSERT INTO products1 (product_id, product_name)
VALUES (101, 'Laptop'),
       (102, 'Phone'),
       (103, 'Tablet'),
       (104, 'Monitor');


-- PRODUCTS 2
CREATE TABLE products2 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);
INSERT INTO products2 (product_id, product_name)
VALUES (105, 'Keyboard'),
       (106, 'Mouse'),
       (101, 'Laptop');
       

-- a
SELECT employee_name
FROM employees 
WHERE department != 'Marketing' AND salary > ANY (
	SELECT salary
    FROM employees
	WHERE department = 'Marketing'
);
        
-- b
SELECT employee_name
FROM employees 
WHERE department != 'Sales' AND salary > ALL (
	SELECT salary
    FROM employees
	WHERE department = 'Sales'
);

-- c
SELECT customer_name
FROM customers
WHERE country IN (
	SELECT country 
    FROM customers
    WHERE country IN ('USA', 'UK', 'India')
);

-- d
SELECT department_name
FROM departments
WHERE department_name IN (
	SELECT department 
    FROM employees
);

-- e
SELECT customer_id
FROM customers
WHERE customer_id NOT IN (
	SELECT customer_id 
    FROM orders
);

-- f
SELECT product_name
FROM (
	SELECT product_name
    FROM products1
    UNION
    SELECT product_name
    FROM products2
) combined_products;

-- g
SELECT customer_name
FROM customers
WHERE customer_id IN (
	SELECT customer_id
    FROM ORDERS
    WHERE year = 2022 OR year = 2023
);

-- h
SELECT products1.product_name
FROM products1
JOIN products2
ON products1.product_id = products2.product_id
WHERE products1.product_id IN (
	SELECT product_id
	FROM store_products
	WHERE product_id NOT IN (
		SELECT product_id
		FROM orders
));