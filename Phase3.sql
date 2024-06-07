DROP Table Customer CASCADE CONSTRAINTS;
CREATE TABLE Customer (
    SSN NUMBER(10) ,
    First_Name VARCHAR2(100),
    Last_Name VARCHAR2(100),
    Phone_Number VARCHAR2(10),
    CONSTRAINTS Customer_PK PRIMARY KEY(SSN)
);
-- Table: Customer_Email
DROP Table Customer_Email CASCADE CONSTRAINTS;
CREATE TABLE Customer_Email (
    Email VARCHAR2(100),
    SSN NUMBER(10) ,
    CONSTRAINTS Customer_EmPK PRIMARY KEY(Email),
    CONSTRAINTS Customer_Fk FOREIGN KEY (SSN) REFERENCES Customer(SSN)
);

-- Table: Employee
DROP Table Employee CASCADE CONSTRAINTS;
CREATE TABLE Employee (
    Emp_ID NUMBER(10) PRIMARY KEY,
    Name VARCHAR2(100),
    Salary NUMBER(10, 2),
    State_ VARCHAR2(100),
    Zip VARCHAR2(10),
    City VARCHAR2(100),
    Bdate DATE
);

-- Table: Emp_Service
DROP Table Emp_Service CASCADE CONSTRAINTS;
CREATE TABLE Emp_Service (
    Service VARCHAR2(100),
    Emp_ID NUMBER(10),
    CONSTRAINTS Emp_ServicePK PRIMARY KEY(Service)
); 

ALTER Table Emp_Service ADD CONSTRAINT Emp_Service_FK FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID);

-- Table: Emp_Position
DROP Table Emp_Position CASCADE CONSTRAINTS;
CREATE TABLE Emp_Position (
    Position VARCHAR2(100),
    Emp_ID NUMBER(10),
    CONSTRAINTS Position_EmPK PRIMARY KEY(Position));
	
	ALTER Table Emp_Position ADD CONSTRAINT  EmpPosition_FK FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID);
    -- Table: Supplier
DROP Table Supplier CASCADE CONSTRAINTS;
CREATE TABLE Supplier (
    Supplier_Number NUMBER(10),
    Name VARCHAR2(100),
    Phone_No VARCHAR2(10),
    CONSTRAINTS Supplier_PK PRIMARY KEY(Supplier_Number)
    );
    
    
-- Table: Branch
DROP Table Branch CASCADE CONSTRAINTS;
CREATE TABLE Branch (
    Branch_no NUMBER(3),
    State_ VARCHAR2(100),
    Zip VARCHAR2(10),
    City VARCHAR2(100),
    Supplier_Number NUMBER(10),
    Quantity NUMBER(5),
    CONSTRAINTS Branch_PK PRIMARY KEY(Branch_no),
    CONSTRAINTS Branch_FK FOREIGN KEY (Supplier_Number) REFERENCES Supplier(Supplier_Number)
);

-- Table: Product
DROP Table Product CASCADE CONSTRAINTS;
CREATE TABLE  Product(
    Product_ID NUMBER(10),
    Supplier_Number NUMBER(10),
    Price NUMBER(10, 2),
    CONSTRAINTS Product_PK PRIMARY KEY(Product_ID),
   CONSTRAINTS Pr_FK FOREIGN KEY (Supplier_Number) REFERENCES Supplier(Supplier_Number)
);

-- Table: Book
DROP Table Book CASCADE CONSTRAINTS; 
CREATE TABLE Book (
    SSN NUMBER(10),
    Branch_no NUMBER(3),
    Emp_ID NUMBER(10),
    Timebook  TIMESTAMP DEFAULT SYSDATE ,
    CONSTRAINTS  book_PK  PRIMARY KEY (SSN, Branch_no, Emp_ID),
    CONSTRAINTS  book_fk1 FOREIGN KEY (SSN) REFERENCES Customer(SSN),
    CONSTRAINTS  book_fk2 FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no),
    CONSTRAINTS  book_fk3 FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID)
);

-- Inserting data into the Customer table
INSERT INTO Customer VALUES (111223333, 'Alhanouf', 'Alsharafi', '055000000');

INSERT INTO Customer VALUES (222334444, 'Layan', 'Alanazi', '055000000');

INSERT INTO Customer VALUES (333445555, 'Danah', 'Albadrani', '055000000');

-- Inserting data into the Customer_Email table
INSERT INTO Customer_Email VALUES ('Alhanouf@email.com', 111223333);

INSERT INTO Customer_Email VALUES ('Luna@email.com', 222334444);

INSERT INTO Customer_Email VALUES ('Danah@email.com', 333445555);
-- Inserting data into the Employee table
INSERT INTO Employee VALUES (111, 'Najd', 50000.00, 'Kingdom Saudi Arabia', '12345', 'Ryiadh', TO_DATE('01-01-2004', 'DD-MM-YYYY'));

INSERT INTO Employee VALUES (222, 'Fatemah', 60000.00, 'Kingdom Saudi Arabia', '67890', 'Jeddah', TO_DATE('02-02-2004', 'DD-MM-YYYY'));

INSERT INTO Employee VALUES (333, 'Wesal', 70000.00, 'Kingdom Saudi Arabia', '98765', 'Madenah', TO_DATE('03-03-2004', 'DD-MM-YYYY'));

-- Inserting data into the Emp_Service table
INSERT INTO Emp_Service VALUES ('Make up', 111);

INSERT INTO Emp_Service VALUES ('Hair cut', 222);

INSERT INTO Emp_Service VALUES ('Pedicure and manicure', 333);

-- Inserting data into the Emp_Position table
INSERT INTO Emp_Position VALUES ('MAke up artist', 111);

INSERT INTO Emp_Position VALUES ('Hair Styles', 222);

INSERT INTO Emp_Position VALUES ('Nail Artist', 333);

INSERT INTO Supplier VALUES (101, 'Farah', '055000000');

INSERT INTO Supplier VALUES (102, 'Haya', '055000000');

INSERT INTO Supplier VALUES (103, 'Fahdah', '055000000');
-- Inserting data into the Branch table
INSERT INTO Branch VALUES (1, 'Kingdom Saudi Arabia', '12345', 'Ryiadh', 101, 100);

INSERT INTO Branch VALUES (2 , 'Kingdom Saudi Arabia', '98765', 'Jeddah', 102, 200);
INSERT INTO Branch VALUES (3, 'Kingdom Saudi Arabia', '98765', 'Madenah', 103, 200);

-- Inserting data into the Supplier table


-- Inserting data into the Product table
INSERT INTO Product VALUES (66, 101, 50.00);

INSERT INTO Product VALUES (55, 102, 75.00);

INSERT INTO Product VALUES (44, 103, 100.00);


INSERT INTO Book VALUES (111223333, 1, 111, TO_TIMESTAMP('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Book VALUES (222334444, 2, 222, TO_TIMESTAMP('2023-02-02 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Book VALUES (333445555, 3, 333, TO_TIMESTAMP ('2023-03-03 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));


SELECT * 
FROM Emp_Position
WHERE  Position LIKE '%MAke up artist%';

UPDATE  Customer_Email 
SET Email='alsharafi@gmail.com'
WHERE SSN='111223333';

DELETE FROM  Product   WHERE product_id =1 ;

SELECT Name 
FROM Employee
WHERE Salary > 50000.00
ORDER BY Name ASC;
 
SELECT Emp_ID, COUNT(Service)
FROM Emp_Service
GROUP BY Emp_ID;

SELECT Emp_ID , COUNT(service) 
FROM Emp_Service 
group by Emp_ID HAVING COUNT(service)=2 ;

SELECT E.Name,P. Emp_ID
FROM Employee E , Emp_Position P 
WHERE E. Emp_ID= P. Emp_ID;