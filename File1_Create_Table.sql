CREATE DATABASE SALESFORCE;

USE SALESFORCE;

CREATE TABLE EMPLOYEES(
SALESFORCE_ID INT NOT NULL PRIMARY KEY auto_increment,
NAME VARCHAR(255),
CITY VARCHAR(255),
COMMISSION DOUBLE
);

INSERT INTO EMPLOYEES 
(salesforce_id,name,city,commission) VALUES
(1,"jame","pune",0.5),
(2,"Mog","RAJ",0.8),
(3,"yo","Punj",0.99),
(4,"we","Kolkata",0.89),
(5,"AAKASh","Haryana",0.02),
(6,"gh","up",0.89),
(7,"rohit","Jaipur",0.67),
(8,"pushpa","alwar",0.47),
(9,"qop","hyderabad",0.99),
(10,"tuy","ghar",0.89);

SELECT salesforce_id,name FROM EMPLOYEES
WHERE salesforce_id >= 3 AND salesforce_id <=9
;

SELECT salesforce_id , name, COMMISSION FROM EMPLOYEES
WHERE salesforce_id BETWEEN 2 AND 8
-- --sorting 
ORDER BY COMMISSION;
SELECT salesforce_id,name FROM EMPLOYEES WHERE salesforce_id NOT IN(3,4,7);

-- using select without using from  , Known as (Dual Tables)
SELECT 10 + 2;
SELECT now();
SELECT lcase('PARESH');

-- wildcard characters
SELECT * FROM EMPLOYEES WHERE name  LIKE '_a%';

-- distinct 
SELECT DISTINCT name FROM EMPLOYEES;