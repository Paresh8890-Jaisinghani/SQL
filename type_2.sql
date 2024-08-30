SHOW databases;

USE salesforce;

SELECT *FROM Employees;

DELETE FROM EMPLOYEES;
DESC Employees;

INSERT INTO EMPLOYEES (salesforce_id,name,city,commission)
VALUES 
(1,"rohit","Pune",0.99),
(2,"Paresh","ajmer",0.99),
(3,"sid","jungle",0.99),
(4,"unkonown","unknown",0.99),
(5,"he","she",0.99);



CREATE TABLE Customer(
order_id INT PRIMARY KEY,
name varchar(255),
cust_id INT,
salary INT
);

DELETE FROM customer;

INSERT INTO CUSTOMER VALUES
(1,"paresh",1,100),
(2,"temp",2,200),
(3,"temp",3,200),
(4,"temp",4,200),
(5,"temp",20,200),
(6,"temp",21,200),
(7,"temp",23,200);

SELECT * FROM customer;

-- Distinct
SELECT DISTINCT name FROM EMPLOYEES;


-- Group by should br used with aggregate functions to find count,sum,avg,max,min
SELECT  salesforce_id,name , COUNT(*) FROM EMPLOYEES GROUP BY name; 
SELECT  salesforce_id,name , AVG(commission) FROM EMPLOYEES GROUP BY name; 
SELECT  salesforce_id,name , MAX(commission) FROM EMPLOYEES GROUP BY name;
SELECT  salesforce_id,name , MIN(commission) FROM EMPLOYEES GROUP BY name; 


-- Having keyword (used in GROUP BY)
SELECT name , COUNT(*) FROM EMPLOYEES GROUP BY name HAVING COUNT(name) > 2;


-- Unique keyword
-- Name Varchar(255) Unique

-- check keyword
-- CONSTRAINT acc-balance check(balnace >= 1000)


-- Default 
-- balance INT NOT NULL DEFAULT 0

-- ADD COLUMN 
ALTER TABLE customer ADD job varchar(255) NOT NULL default "";

-- modify (change the datatype of column)
AlTER TABLE customer MODIFY salary DOUBLE NOT NULL DEFAULT 0; 

-- describe account
DESC customer;

-- rename  column
ALTER TABLE customer change column salary monthly_salary INT;

-- Drop column
ALTER TABLE customer DROP column monthly_salary;

-- rename  table name
ALTER TABLE customer rename to workers;	

-- DML Command for (selecting, inserting, updating , replacing and deleting)
INSERT INTO Employees values
(15,"Paresh","Ajmer",1.0);

-- Updating
UPDATE Employees SET city = "Hyderabad" , commission = "2.0" WHERE salesforce_id = 15;


-- updating each row
SET SQL_SAFE_UPDATES = 0;
UPDATE EMPLOYEES SET commission = 2;

UPDATE EMPLOYEES SET commission = commission + 1;

-- Deleting row
DELETE FROM EMPLOYEES WHERE salesforce_id = 15;

-- delete table
DELETE FROM CUSTOMER;

delete FROM EMPLOYEES;

-- Replacing (if data already present it will be replaced but if data is not present data will be inserted)
replace INTO customer (order_id,name)
VALUES (2,"aj");

replace INTO customer (order_id,name)
values (4,"paresh");

SELECT * FROM Customer;
SELECT * FROM EMPLOYEES;


-- on delete cascade use (deleting parent row and with it all child rows will also be deleted for same ids
DELETE FROM EMPLOYEES WHERE salesforce_id = 12;

-- on delete set null (deleting parent row but from child similar ids will be set to null);



-- Inner Join (common in both left and right table)
SELECT e.* , c.* FROM EMPLOYEES as e INNER JOIN customer as c
ON cust_id = salesforce_id;

-- Left join (every entry from left table who matched + who not matched from right table)
SELECT e.* , c.* FROM EMPLOYEES as e LEFT JOIN customer as c
ON salesforce_id = cust_id;

-- Right join (every entry from right table who matched + who not matched from left table)
SELECT e.* , c.* FROM EMPLOYEES as e RIGHT JOIN customer as c
ON salesforce_id = cust_id;

-- SET command (for distinct selection from tables)
-- same bw two columns : number of columns, order , datatypes of columns
-- rowwise selection 
CREATE TABLE Dep1(
	empid INT primary key,
    name VARCHAR(255),
    role VARCHAR(255)
);
CREATE TABLE Dep2(
	empid INT primary key,
    name VARCHAR(255),
    role VARCHAR(255)
);

INSERT INTO dep1 Values
(1,"A","Engi"),(2,"B","supp"),(3,"C","mana"),(4,"D","sales"),(5,"E","work");

INSERT INTO dep2 Values
(3,"C","mana"),(6,"F","mark"),(7,"G","sales");

SELECT * FROM dep1
UNION 
SELECT * FROM dep2;

-- union
SELECT * FROM dep1 WHERE role = "sales"
UNION
SELECT * FROM dep2 WHERE role = "sales";

-- intersection
SELECT dep1.* FROM dep1 INNER JOIN dep2 using (empid);

-- Minus operation
select dep1.* FROM dep1 LEFT JOIN dep2 using(empid)
WHERE dep2.empid is NULL;