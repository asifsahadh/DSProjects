CREATE TABLE customers( 
	C_id INT KEY,
    C_name CHAR(30),
    address CHAR(30),
    salary INT
);
INSERT INTO customers (C_id, C_name, address, salary)
VALUES (1, 'Mohan', 'Delhi', 2300),
       (2, 'Sohan', 'Delhi', 4500),
       (3, 'Rohan', 'Mumbai', 5400),
       (4, 'Mohan', 'Kanpur', 2500),
       (5, 'Peter', 'Delhi', 1500),
       (6, 'Divya', 'Kanpur', 4500);
       
SELECT * FROM customers;

SELECT * FROM orders;



CREATE TABLE orders( 
	O_id INT KEY,
    O_date DATE,
    O_Amount INT,
    C_id INT,
    FOREIGN KEY(C_id) REFERENCES customer(C_id)
);
INSERT INTO orders (O_Id, O_date, O_Amount, C_Id)
VALUES (111, '2020-09-07', 50, 1),
       (222, '2020-09-10', 75, 2),
       (333, '2020-09-07', 35, 4),
       (444, '2020-10-05', 15, 1),
       (555, '2020-09-02', 45, 6);

SELECT * FROM customers;
SELECT * FROM orders;       

-- a
SELECT DISTINCT(customers.c_id), c_name 
FROM customers JOIN orders
ON customers.c_id = orders.c_id
WHERE customers.c_id = orders.c_id;

-- b
SELECT c_name, o_amount 
FROM customers JOIN orders
ON customers.c_id = orders.c_id;

-- c
SELECT DISTINCT(customers.c_id), c_name, COUNT(o_id) FROM customers
JOIN orders ON customers.c_id = orders.c_id
GROUP BY c_name;

-- d
SELECT address, SUM(o_amount) FROM customers
INNER JOIN orders ON customers.c_id = orders.c_id
GROUP BY address;

-- e
SELECT MIN(o_amount), c_name FROM customers JOIN orders 
ON customers.c_id = orders.c_id
GROUP BY c_name
HAVING MIN(o_amount) = (
	SELECT MIN(o_amount)
    FROM orders
);

-- f
SELECT c_name FROM customers
GROUP BY c_name
HAVING COUNT(DISTINCT address) > 1;

-- g
SELECT c_name FROM customers JOIN orders
ON customers.c_id = orders.c_id
WHERE customers.c_id = orders.c_id;

-- h
	SELECT SUM(o_amount) FROM customers JOIN orders 
	ON customers.c_id = orders.c_id
	WHERE address = 'Delhi' AND o_date LIKE '2020-09-%';