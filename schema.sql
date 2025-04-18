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