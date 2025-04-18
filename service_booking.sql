BEGIN TRANSACTION;

INSERT INTO Customer VALUES (1, 'John Smith', 'john@example.com', '555-1234', '123 Main St');

INSERT INTO Service VALUES (1, 1, 'Lawn Maintenance', '2023-04-20 10:00:00', '2023-04-20 12:00:00');

INSERT INTO Employee VALUES (1, 'Jane Doe', 'Technician', '555-5678', 'jane@example.com');

INSERT INTO CustomerOrder VALUES (1, 1, '2023-04-18 15:30:00', 80.00, 'Scheduled');

INSERT INTO EmployeeAssignment VALUES (1, 1, 1);

INSERT INTO OrderItem VALUES (1, 1, 1, 80.00);

COMMIT; 