# Service Management Database

## Overview
This database system manages customers, employees, services, and orders for a service-based business. It allows for booking services, assigning employees, and generating reports.

## Database Schema
- **Customer**: Stores customer information (ID, name, email, phone, address)
- **Employee**: Manages employee data (ID, name, role, contact info)
- **Service**: Tracks service requests (ID, customer, description, schedule)
- **CustomerOrder**: Records orders placed by customers
- **EmployeeAssignment**: Links employees to services and orders
- **OrderItem**: Contains line items for each order

## Applications
1. **Service Booking Application**
   - Creates a new customer service booking in a transaction
   - Assigns employees to services
   - Creates corresponding orders

2. **Service Reporting Application**
   - Generates customer service history reports
   - Provides order details with items
   - Creates monthly revenue summaries

## How to Run
1. Install SQLite
2. Run the complete application:
   ```
   sqlite3 company.db ".read run_application.sql"
   ```

3. Or run individual components:
   ```
   # Create database schema
   sqlite3 company.db ".read schema.sql"
   
   # Book a service
   sqlite3 company.db ".read service_booking.sql"
   
   # View reports
   sqlite3 company.db ".read service_report.sql"
   ```

## Transaction Handling
The service booking application uses a transaction to ensure all related records are created atomically. If any part fails, the entire operation is rolled back to maintain data integrity.