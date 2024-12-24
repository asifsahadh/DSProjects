-- 1
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

CREATE TABLE employee_audit (
    id SERIAL PRIMARY KEY,
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER employee_salary_update_trigger
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary != NEW.salary THEN
        INSERT INTO employee_audit (old_salary, new_salary, changed_at)
        VALUES (OLD.salary, NEW.salary, CURRENT_TIMESTAMP);
    END IF;
END$$
DELIMITER ;

UPDATE employees
SET salary = 8000
WHERE employee_id = 4;

SELECT * FROM employee_audit;

-- 2
CREATE TABLE accounts (
	account_id INT PRIMARY KEY,
    balance DECIMAL(10, 2)
);
INSERT INTO accounts (account_id, balance)
VALUES (101, 400),
	   (102, 800),
	   (103, 200),
	   (104, 250);
       
DELIMITER $$
CREATE TRIGGER prevent_negative_balance
BEFORE UPDATE ON accounts
FOR EACH ROW
BEGIN
    IF NEW.balance < 0
    THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Withdrawal would result in a negative balance';
    END IF;
END$$
DELIMITER ;

UPDATE accounts
SET balance = balance - 900
WHERE account_id = 104;

-- 3 
CREATE TABLE order_items (
	item_id INT PRIMARY KEY,
    quantity INT,
    unit_price DECIMAL(10, 2),
    total_price DECIMAL(10, 2)
);

DELIMITER $$
CREATE TRIGGER calculate_total_price
BEFORE INSERT ON order_items
FOR EACH ROW
BEGIN
    SET NEW.total_price = NEW.quantity * NEW.unit_price;
END$$
DELIMITER ;

INSERT INTO order_items (item_id, quantity, unit_price)
VALUES (11, 2, 20),
       (12, 5, 40),
       (13, 4, 15),
       (14, 7, 24);

SELECT * FROM order_items;

-- 4
CREATE TABLE users (
	user_id INT PRIMARY KEY,
    user_name VARCHAR(30),
    user_role VARCHAR(30)
);
INSERT INTO users (user_id, user_name, user_role)
VALUES (101, 'John', 'Admin'),
       (102, 'Sam', 'Moderator'),
       (103, 'Sara', 'Admin'),
       (104, 'Maurice', 'Member');

DELIMITER $$
CREATE TRIGGER prevent_admin_deletion
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    IF OLD.user_role = 'Admin' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete admin users';
    END IF;
END$$
DELIMITER ;

DELETE FROM users
WHERE user_name = 'Sara';

-- 5
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2),
    discount DECIMAL(5, 2)
);

DELIMITER $$
CREATE TRIGGER enforce_discount_limit
BEFORE INSERT ON sales
FOR EACH ROW
BEGIN
    IF NEW.discount > 50 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Discount cannot exceed 50%';
    END IF;
END$$
DELIMITER ;

INSERT INTO sales (sale_id, product_name, price, discount)
VALUES (101, 'iPhone 15', 120000, 40),
       (102, 'HP Omen 16', 140000, 60),
       (103, 'PS5', 80000, 20),
       (104, 'Beats Studio', 20000, 20);