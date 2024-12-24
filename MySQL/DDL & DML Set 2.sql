-- a
CREATE TABLE student(
	S_Reg_no INT PRIMARY KEY,
    S_Name CHAR(20),
    Dept_Name CHAR(20),
    Avg_Mark INT,
    Grade CHAR(1)
);
INSERT INTO student (S_Reg_no, S_Name, Dept_Name, Avg_Mark, Grade)
VALUES (101, 'Mohan', 'Data Science', 87, 'A'),
	   (102, 'Rohan', 'Mathematics', 78, 'B'),
	   (103, 'Divya', 'Statistics', 93, 'S'),
       (104, 'John', 'Physics', 76, 'B'),
       (105, 'Mohammed', 'Chemistry', 82, 'A'),
       (106, 'Sohan', 'Data Science', 91, 'S'),
       (107, 'Kumar', 'Physics', 65, 'C'),
       (108, 'John', 'Mathematics', 90, 'S');

-- b
UPDATE student 
SET S_Name = 'Keerti' 
WHERE S_Reg_no = 102;

SELECT * FROM student 
WHERE S_Reg_no = 102;

-- c
SELECT S_Reg_no, S_Name 
FROM student 
WHERE Dept_Name = 'Data Science';

-- d
SELECT SUM(Avg_Mark) 	 
FROM student;

-- e
SELECT * 
FROM student 
WHERE Dept_Name = 'Data Science'
AND Grade = 'A';

-- f
ALTER TABLE student
ADD	Address CHAR(40);

UPDATE student
SET Address = 'Tamil nadu'
WHERE S_Reg_no = 101;

UPDATE student
SET Address = 'Delhi'
WHERE S_Reg_no = 102;

UPDATE student
SET Address = 'Kerala'
WHERE S_Reg_no = 103;

UPDATE student
SET Address = 'Kottayam'
WHERE S_Reg_no = 104;

UPDATE student
SET Address = 'Saudi Arabia'
WHERE S_Reg_no = 105;

UPDATE student
SET Address = 'Malaysia'
WHERE S_Reg_no = 106;

UPDATE student
SET Address = 'Goa'
WHERE S_Reg_no = 107;

UPDATE student
SET Address = 'Kerala'
WHERE S_Reg_no = 108;

SELECT * FROM student;