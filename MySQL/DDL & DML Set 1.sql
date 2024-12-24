CREATE TABLE Books(
	accno INT PRIMARY KEY,
    ISBN CHAR(20) UNIQUE,
    title CHAR(20) NOT NULL,
    authors CHAR(40),
    publisher CHAR(20) NOT NULL,
    purchaseprice DECIMAL(10, 2),
    purchasedate DATE
);
INSERT INTO Books (accno, ISBN, title, authors, publisher, purchaseprice, purchasedate)
VALUES
    (1, '9780470059029', 'Being Digital', 'Nicholas Negroponte', 'Vintage', 25.00, '2016-11-25'),
    (2, '9780071591065', 'Digital Design', 'M. Morris Mano', 'TMH', 35.50, '2019-03-11'),
    (3, '9780132350884', 'Clean Code', 'Robert C. Martin', 'Tata McGraw Hill', 45.99, '2018-01-15');

CREATE TABLE Membertype(
	type ENUM('Student', 'Staff', 'Research', 'Guest') NOT NULL PRIMARY KEY,
    maxCards INT NOT NULL,
    maxDays INT,
    CONSTRAINT check_membertype_card_book CHECK (
		(TYPE = 'Student' AND maxCards = 5 AND maxDays = 14) OR
        (TYPE = 'Staff' AND maxCards = 10 AND maxDays = 30) OR
        (TYPE = 'Research' AND maxCards = 12 AND maxDays = 90) OR
        (TYPE = 'Guest' AND maxCards = 2 AND maxDays = 7)
    )
);
INSERT INTO Membertype (type, maxCards, maxDays)
VALUES
    ('Student', 5, 14),
    ('Staff', 10, 30),
    ('Research', 12, 90),
    ('Guest', 2, 7);

CREATE TABLE Members(
    memberID INT PRIMARY KEY,
    name CHAR(20) NOT NULL,
    type ENUM('Student', 'Staff', 'Research', 'Guest') NOT NULL DEFAULT 'Student',
    FOREIGN KEY (type) REFERENCES Membertype(type)
);
INSERT INTO Members (memberID, name, type)
VALUES
    (1, 'Alice', 'Student'),
    (2, 'Bob', 'Staff'),
    (3, 'Charlie', 'Research');

CREATE TABLE Cards(
	cardNo INT PRIMARY KEY,
	memberID INT NOT NULL,
    issueDate DATE,
    FOREIGN KEY (memberID) REFERENCES Members(memberID) ON DELETE RESTRICT
);
INSERT INTO Cards (cardNo, memberID, issueDate)
VALUES
    (5002, 1, '2019-02-25'),
    (5003, 2, '2019-02-26'),
    (5004, 3, '2019-02-27');


CREATE TABLE Issues(
    accno INT,
    issueDate DATE,
    cardNo INT NOT NULL,
    PRIMARY KEY (accno, issueDate),
    FOREIGN KEY (accno) REFERENCES Books(accno),
    FOREIGN KEY (cardNo) REFERENCES Cards(cardNo) ON DELETE RESTRICT
);
INSERT INTO Issues (accno, issueDate, cardNo)
VALUES
    (1, '2019-03-01', 5002),
    (2, '2019-03-02', 5003),
    (3, '2019-03-03', 5004);

-- UPDATE STATEMENTS

ALTER TABLE MemberType
DROP CONSTRAINT check_membertype_card_book;

ALTER TABLE Membertype
ADD CONSTRAINT check_membertype_card_book CHECK (
    (type = 'Student' AND maxCards = 5 AND maxDays = 21) OR
    (type = 'Staff' AND maxCards = 10 AND maxDays = 30) OR
    (type = 'Research' AND maxCards = 12 AND maxDays = 90) OR
    (type = 'Guest' AND maxCards = 3 AND maxDays = 7)
);

UPDATE Issues	
SET issueDate = DATE_ADD(issueDate, INTERVAL 7 DAY)
WHERE issueDate BETWEEN '2019-03-01' AND '2019-03-03';
SELECT * FROM Issues;

UPDATE Books
SET publisher = 'Tata McGraw Hill'
WHERE publisher = 'TMH';
SELECT * FROM Books;

-- DELETE STATEMENTS

DELETE FROM Books 
WHERE title = 'Being Digital';
SELECT * FROM Books;


DELETE FROM Books
WHERE publisher = 'Tata McGraw Hill';

DELETE FROM Issues
WHERE cardNo = 5002;
SELECT * FROM Issues;

-- MODIFY STATEMENTS

ALTER TABLE Cards
ADD validityPeriod INT DEFAULT 36;
SELECT * FROM Cards;

ALTER TABLE Books
MODIFY purchasedate DATETIME DEFAULT CURRENT_TIMESTAMP;
SELECT * FROM Books;