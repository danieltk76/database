
SELECT s.serviceId, s.description, s.startDate, s.endDate, e.name as AssignedEmployee
FROM Service s
JOIN EmployeeAssignment ea ON s.serviceId = ea.serviceId
JOIN Employee e ON ea.employeeId = e.empId
WHERE s.customerId = 1
ORDER BY s.startDate;

SELECT o.orderId, o.orderDate, o.orderStatus, o.orderCost, 
       i.orderItemId, i.quantity, i.unitPrice
FROM CustomerOrder o
JOIN OrderItem i ON o.orderId = i.orderId
WHERE o.customerId = 1;

-- Monthly rev
SELECT 
    strftime('%Y-%m', orderDate) as Month,
    COUNT(*) as OrderCount,
    SUM(orderCost) as TotalRevenue
FROM CustomerOrder
GROUP BY strftime('%Y-%m', orderDate)
ORDER BY Month; 
