.headers on
.mode column

DROP TABLE IF EXISTS OrderItem;
DROP TABLE IF EXISTS EmployeeAssignment;
DROP TABLE IF EXISTS CustomerOrder;
DROP TABLE IF EXISTS Service;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer (
    custId INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255)
);

CREATE TABLE Employee (
    empId INT PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Service (
    serviceId INT PRIMARY KEY,
    customerId INT,
    description VARCHAR(255),
    startDate DATETIME,
    endDate DATETIME,
    FOREIGN KEY (customerId) REFERENCES Customer(custId)
);

CREATE TABLE CustomerOrder (
    orderId INT PRIMARY KEY,
    customerId INT,
    orderDate DATETIME,
    orderCost FLOAT,
    orderStatus VARCHAR(50),
    FOREIGN KEY (customerId) REFERENCES Customer(custId)
);

CREATE TABLE EmployeeAssignment (
    employeeId INT,
    serviceId INT,
    orderId INT,
    PRIMARY KEY (employeeId, serviceId, orderId),
    FOREIGN KEY (employeeId) REFERENCES Employee(empId),
    FOREIGN KEY (serviceId) REFERENCES Service(serviceId),
    FOREIGN KEY (orderId) REFERENCES CustomerOrder(orderId)
);

CREATE TABLE OrderItem (
    orderItemId INT PRIMARY KEY,
    orderId INT,
    quantity INT,
    unitPrice FLOAT,
    FOREIGN KEY (orderId) REFERENCES CustomerOrder(orderId)
);

SELECT 'BEFORE TRANSACTION' as Status;

SELECT 'Customer Table:';
SELECT * FROM Customer;

SELECT 'Service Table:';
SELECT * FROM Service;

SELECT 'CustomerOrder Table:';
SELECT * FROM CustomerOrder;

SELECT 'EmployeeAssignment Table:';
SELECT * FROM EmployeeAssignment;

SELECT 'OrderItem Table:';
SELECT * FROM OrderItem;

BEGIN TRANSACTION;

INSERT INTO Customer VALUES (100, 'John Smith', 'john@example.com', '555-1234', '123 Main St');

INSERT INTO Service VALUES (100, 100, 'Lawn Maintenance', '2023-04-20 10:00:00', '2023-04-20 12:00:00');

INSERT INTO Employee VALUES (100, 'Jane Doe', 'Technician', '555-5678', 'jane@example.com');

INSERT INTO CustomerOrder VALUES (100, 100, '2023-04-18 15:30:00', 80.00, 'Scheduled');

INSERT INTO EmployeeAssignment VALUES (100, 100, 100);

INSERT INTO OrderItem VALUES (100, 100, 1, 80.00);

COMMIT;

SELECT 'AFTER TRANSACTION' as Status;

SELECT 'Customer Table:';
SELECT * FROM Customer;

SELECT 'Service Table:';
SELECT * FROM Service;

SELECT 'CustomerOrder Table:';
SELECT * FROM CustomerOrder;

SELECT 'EmployeeAssignment Table:';
SELECT * FROM EmployeeAssignment;

SELECT 'OrderItem Table:';
SELECT * FROM OrderItem; 