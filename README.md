Car Showroom Database
This project implements a comprehensive Car Showroom database using SQL. It covers all aspects of a car showroom business, including customers, cars, services, spare parts, companies, employees, and workshop operations.
Features and Purpose
•	Centralized storage of customer information and their contact details.
•	Management of car inventory, including makes, models, colors, quantities, and pricing.
•	Tracking of company suppliers and showroom branches.
•	Workshop service catalog and associated spare parts management.
•	Employee roles, phone contacts, and hierarchical relationships.
•	Recording of car orders, provisions, and modifications.
•	Sample queries for common business needs (e.g., available cars, service listings).
•	Maintenance scripts to update pricing, restock inventory, and adjust salaries.
Database Schema Overview
Tables
1.	customers: Stores customer personal details.
2.	customers_phone: Multiple contact numbers per customer.
3.	jop: Job roles and salary information.
4.	work_shop: Available services and service pricing.
5.	sparepart: Spare parts linked to workshop services.
6.	car: Car inventory details.
7.	carcolor: Available colors for each car.
8.	company: Supplier and branch details, including workshop links.
9.	employee: Employee records with job roles and company association.
10.	employeephone: Multiple contact numbers per employee.
11.	modification: Car customization records linking employees and parts.
12.	carprovision: Records of cars provided by companies with pricing.
13.	carorder: Customer orders for cars, tracking downpayments.
Relationships and Constraints
•	Primary Keys ensure unique identification of records.
•	Foreign Keys enforce referential integrity between related tables (e.g., customer_id, serialnumber).
•	Composite keys handle many-to-many relationships (e.g., car colors, employee phones).
•	Cascading deletes maintain consistency when parent records are removed.
Setup and Usage
1.	Create Database:
SELECT * FROM car
WHERE Saleprice > 500000;

Join Cars with Available Colors:
 SELECT c.Carname, cc.carcolor
FROM car c
JOIN carcolor cc ON c.Serialnumber = cc.Serialnumber;

Count Total Stock by Brand:
SELECT Brand, SUM(Quantity) AS Total_Stock
FROM car
GROUP BY Brand;

Updates and Maintenance Script Examples
•	Restock and Price Adjust Spare Parts
•	Adjust Car Sale Prices by Year and Brand
•	Apply Salary Raises Based on Role and Salary Level
Clean Up
•	Delete All Tables:
SELECT table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE' AND table_catalog = 'Car_Showroom';

Drop Database:
DROP DATABASE Car_Showroom;
