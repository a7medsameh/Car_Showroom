-------------- Create Database ----------------
create database Car_Showroom
use Car_Showroom
----------------- Tables --------------------

-- Custmers --
create table custmers
(
Custmer_id  varchar(255) primary key not null ,
First_name varchar(100) not null,
Second_name varchar(100),
Birth_Date date ,
Adress varchar(100),
ZIP_code int ,
City varchar(100) ,
);

-- Custmers Phone --
create table Cutmers_phone
(
Custmer_id  varchar(255),
Phone_number varchar(50) primary key ,

foreign key (Custmer_id) references custmers (Custmer_id) 

);

-- Jop -- 
create table jop 
(
Jop_id varchar(255) primary key ,
Jop_Discreption text ,
Salary int,
);

-- Work Shop --
create table work_shop
(
Work_Shop_ID varchar(255) primary key ,
Servic varchar(100),
Service_Price decimal (10,2),
);

-- Spare Part --
create table sparepart (
Sparepart_id varchar(200)  primary key not null,
Price  decimal(10,2),
Brand varchar(100),
Description varchar(100),
Quantity int,
Work_Shop_ID varchar(255) ,

foreign key (Work_Shop_ID) references work_shop(Work_Shop_ID)
);

-- Car -- 
create table car 
(
Serialnumber varchar(255) primary key not null,
Brand varchar(100),
Carname varchar(100),
Model char(100),
Yearofmanufacture varchar(100),
Saleprice decimal (10,2),
Quantity int,
);

-- Car Color --
create table carcolor 
(
Serialnumber varchar(255) not null,
carcolor varchar(255),
primary key (serialnumber, carcolor),
foreign key (serialnumber) references car(serialnumber)
on delete cascade
);

-- Company --
create table company 
(
company_id varchar(255) not null,
companyname varchar(100),
city varchar(100),
address char(100),
zipcode int,
phone varchar(100),
email varchar(100),
headquarter_id varchar(255),
Work_Shop_ID varchar(255),
primary key (company_id),
foreign key (headquarter_id) references company(company_id),
foreign key (Work_Shop_ID) references work_shop(Work_Shop_ID)
);
-- Emplyee --
create table employee 
(
employee_id varchar(255) not null,
firstname char(100),
lastname char(100),
email varchar(100),
city char(100),
zipcode char(100),
address varchar(100),
Jop_id varchar(255),
manager_id varchar(255),
company_id varchar(255),
primary key (employee_id),
foreign key (Jop_id) references jop(Jop_id),
foreign key (manager_id) references employee(employee_id),
foreign key (company_id) references company(company_id)
);



-- Modification --
create table modification
(
modification_id varchar(255) primary key,
modification_name varchar(255),
descripe varchar(255),
cost int,
required_time time,
modification_type varchar(255),
Work_Shop_ID varchar(255),
Sparepart_id  varchar(200),
employee_id   varchar(255),
foreign key (Work_Shop_ID) references work_shop(Work_Shop_ID),
foreign key (Sparepart_id) references sparepart(Sparepart_id),
foreign key (employee_id) references employee(employee_id)
);



-- Car provision --
create table carprovision 
(
Company_id varchar(255),
Serialnumber varchar(255),
Processdate date,
Totalprice decimal(10,2),
primary key (company_id, serialnumber),
foreign key (company_id) references company(company_id),
foreign key (serialnumber) references car(serialnumber)
);


-- Car Order --
create table carorder 
(
Custmer_id varchar(255),
employee_id varchar(255),
orderdate date,
downpayment varchar(255),
serialnumber varchar(255),
primary key (Custmer_id, employee_id, serialnumber),
foreign key (Custmer_id) references custmers(Custmer_id),
foreign key (employee_id) references employee(employee_id),
foreign key (serialnumber) references car(serialnumber)
);

-- Emplyee Phone --
create table employeephone 
(
employee_id varchar(255),
phonenumber varchar(255),
primary key (employee_id, phonenumber),
foreign key (employee_id) references employee(employee_id) on delete cascade
);



----------------------- Insert --------------------------

-- Custmers --
insert into custmers (Custmer_id, First_name, Second_name, Birth_Date, Adress, ZIP_code, City)
values
('C001', 'Mano', 'Elhosiny', '2004-02-13', '123 Elm Street', 12345, 'Cairo'),
('C002', 'Ahmed', 'Hassan', '1990-07-22', '456 Nile Road', 23456, 'Alexandria'),
('C003', 'Sara', 'Mohamed', '1993-11-10', '789 Pyramids Ave', 34567, 'Giza'),
('C004', 'Mona', 'Tarek', '1987-01-25', '101 Ramses Street', 45678, 'Cairo'),
('C005', 'Khaled', 'El-Sayed', '1985-09-30', '202 Tahrir Square', 56789, 'Giza'),
('C006', 'Yasmine', 'Abdel-Rahman', '1998-02-17', '303 Maadi Road', 67890, 'Maadi'),
('C007', 'Omar', 'Shahin', '1992-12-05', '404 Heliopolis Street', 78901, 'Heliopolis'),
('C008', 'Fatma', 'Fathy', '1990-08-14', '505 Shubra St.', 89012, 'Shubra'),
('C009', 'Ahmed', 'El-Gohary', '1989-03-11', '606 Cairo-Alex Road', 90123, 'Cairo'),
('C010', 'Hany', 'Mostafa', '1996-06-18', '707 Dokki St.', 10123, 'Dokki'),
('C011', 'Sami', 'Kamal', '1994-05-10', '808 October Street', 11234, '6th of October'),
('C012', 'Nour', 'Hussein', '1997-04-23', '909 Zamalek Road', 12345, 'Zamalek'),
('C013', 'Maha', 'Taha', '1993-09-29', '1000 City Center', 23456, 'Cairo'),
('C014', 'Ramy', 'Hossam', '1992-11-19', '1100 Mansoura St.', 34567, 'Mansoura'),
('C015', 'Laila', 'Gaber', '1991-10-03', '1200 Maadi Gardens', 45678, 'Maadi'),
('C016', 'Ahmed', 'Ali', '1988-12-12', '1300 Nasr City St.', 56789, 'Nasr City'),
('C017', 'Eman', 'Shams', '1995-07-30', '1400 Mohandessin St.', 67890, 'Mohandessin'),
('C018', 'Ayman', 'Hassan', '1994-01-01', '1500 Tanta Road', 78901, 'Tanta'),
('C019', 'Dalia', 'Khalil', '1996-09-25', '1600 Fayoum St.', 89012, 'Fayoum'),
('C020', 'Sherif', 'Khaled', '1991-06-12', '1700 Mansoura Road', 90123, 'Mansoura'),
('C021', 'Tamer', 'Magdy', '1990-04-09', '1800 Alexandria St.', 10123, 'Alexandria'),
('C022', 'Rania', 'Mohamed', '1997-08-21', '1900 Sharm El-Sheikh Road', 11234, 'Sharm El-Sheikh'),
('C023', 'Mona', 'Ahmed', '1992-03-17', '2000 Port Said Road', 12345, 'Port Said'),
('C024', 'Marwan', 'Abdalla', '1995-10-10', '2100 Luxor St.', 23456, 'Luxor'),
('C025', 'Ranya', 'Mahmoud', '1993-06-26', '2200 Hurghada Rd', 34567, 'Hurghada');

-- Custmers Phone --
insert into Cutmers_phone (Custmer_id, Phone_number)
values
('C001', '01012345678'),
('C002', '01123456789'),
('C003', '01234567890'),
('C004', '01545678901'),
('C005', '01056789012'),
('C006', '01167890123'),
('C007', '01278901234'),
('C008', '01589012345'),
('C009', '01090123456'),
('C010', '01112398765'),
('C011', '01223487654'),
('C012', '01534576543'),
('C013', '01045665432'),
('C014', '01156754321'),
('C015', '01267843210'),
('C016', '01578932109'),
('C017', '01089021098'),
('C018', '01190110987'),
('C019', '01212309876'),
('C020', '01523498765'),
('C021', '01034587654'),
('C022', '01145676543'),
('C023', '01256765432'),
('C024', '01567854321'),
('C025', '01078943210');

-- Jop --
insert into jop (Jop_id, Jop_Discreption, Salary)
values
('J001', ' (AI) Engenering', 80000),
('J002', 'Data Scientist', 12000),
('J003', 'System Administrator', 7000),
('J004', 'Network Engineer', 9000),
('J005', 'Project Manager', 15000),
('J006', 'Database Administrator', 9500),
('J007', 'UX/UI Designer', 7500),
('J008', 'Quality Assurance Engineer', 6500),
('J009', 'Business Analyst', 11000),
('J010', 'Graphic Designer', 6000),
('J011', 'Cloud Engineer', 13000),
('J012', 'Product Manager', 14000),
('J013', 'Web Developer', 8500),
('J014', 'SEO Specialist', 6000),
('J015', 'Mobile App Developer', 9500),
('J016', 'Marketing Manager', 12000),
('J017', 'Customer Support Specialist', 5000),
('J018', 'Content Writer', 4000),
('J019', 'HR Manager', 11000),
('J020', 'Legal Advisor', 13500),
('J021', 'Financial Analyst', 11500),
('J022', 'Sales Manager', 12000),
('J023', 'Operations Manager', 12500),
('J024', 'Research Scientist', 13000),
('J025', 'Security Analyst', 10000);


-------- Work Shop ---------
insert into  work_shop (Work_Shop_ID, Servic, Service_Price)
values
('WS001', 'Oil Change', 100.00),
('WS002', 'Tire Replacement', 150.00),
('WS003', 'Brake Service', 200.00),
('WS004', 'Engine Repair', 500.00),
('WS005', 'Battery Replacement', 120.00),
('WS006', 'Wheel Alignment', 80.00),
('WS007', 'Transmission Repair', 600.00),
('WS008', 'AC Repair', 250.00),
('WS009', 'Windshield Replacement', 180.00),
('WS010', 'Suspension Repair', 300.00),
('WS011', 'Exhaust System Repair', 220.00),
('WS012', 'Clutch Repair', 350.00),
('WS013', 'Fuel System Cleaning', 150.00),
('WS014', 'Air Filter Replacement', 50.00),
('WS015', 'Timing Belt Replacement', 400.00),
('WS016', 'Headlight Restoration', 70.00),
('WS017', 'Alternator Repair', 180.00),
('WS018', 'Car Detailing', 100.00),
('WS019', 'Paint Repair', 250.00),
('WS020', 'Wheel Balancing', 60.00),
('WS021', 'Power Steering Repair', 250.00),
('WS022', 'Radiator Repair', 200.00),
('WS023', 'Computer Diagnostics', 90.00),
('WS024', 'Vehicle Inspection', 50.00),
('WS025', 'Tune-Up', 150.00);

-- Spare Part --
insert into sparepart (Sparepart_id, Price, Brand, Description, Quantity, Work_Shop_ID)
values 
('SP001', 5000.00, 'Toyota', 'Air Filter', 100, 'WS001'),
('SP002', 1200.00, 'Ford', 'Brake Pads', 75, 'WS002'),
('SP003', 2000.00, 'Honda', 'Tire', 50, 'WS003'),
('SP004', 1500.00, 'Nissan', 'Spark Plugs', 200, 'WS004'),
('SP005', 3000.00, 'BMW', 'Alternator', 40, 'WS005'),
('SP006', 4000.00, 'Mercedes-Benz', 'AC Compressor', 30, 'WS006'),
('SP007', 3500.00, 'Audi', 'Clutch Kit', 20, 'WS007'),
('SP008', 1800.00, 'Volkswagen', 'Brake Disc', 60, 'WS008'),
('SP009', 700.00, 'Hyundai', 'Windshield Wiper', 150, 'WS009'),
('SP010', 1000.00, 'Chevrolet', 'Starter Motor', 90, 'WS010'),
('SP011', 8000.00, 'Kia', 'Fuel Filter', 200, 'WS011'),
('SP012', 120.00, 'Subaru', 'Shock Absorber', 80, 'WS012'),
('SP013', 2500.00, 'Mazda', 'Radiator', 30, 'WS013'),
('SP014', 1500.55, 'Porsche', 'Timing Belt', 40, 'WS014'),
('SP015', 2000.00, 'Peugeot', 'Fuel Pump', 50, 'WS015'),
('SP016', 5000.00, 'Renault', 'Transmission Kit', 25, 'WS016'),
('SP017', 600.00, 'Fiat', 'Battery', 100, 'WS017'),
('SP018', 900.00, 'Jeep', 'Car Battery', 120, 'WS018'),
('SP019', 750.00, 'Land Rover', 'Brake Fluid', 80, 'WS019'),
('SP020', 3500.00, 'Chrysler', 'Exhaust Pipe', 40, 'WS020'),
('SP021', 2200.00, 'Lexus', 'Headlights', 60, 'WS021'),
('SP022', 2800.00, 'Tesla', 'Fuel Injector', 70, 'WS022'),
('SP023', 4000.00, 'Jaguar', 'Suspension Kit', 50, 'WS023'),
('SP024', 1000.00, 'Ferrari', 'Windshield Glass', 90, 'WS024'),
('SP025', 1200.00, 'Lamborghini', 'Tire Valve', 200, 'WS025');

-- Car -- 
insert into car (Serialnumber, Brand, Carname, Model, Yearofmanufacture, Saleprice, Quantity)
values
('SN001', 'Toyota', 'Corolla', 'XLE', '2021', 250000.00, 10),
('SN002', 'Ford', 'Mustang', 'GT', '2022', 3500000.00, 5),
('SN003', 'Honda', 'Civic', 'EX-L', '2020', 220000.00, 8),
('SN004', 'BMW', '3 Series', '320i', '2021', 400000.00, 3),
('SN005', 'Mercedes-Benz', 'C-Class', 'C300', '2021', 4500000.00, 6),
('SN006', 'Audi', 'A4', 'Premium Plus', '2022', 3800000.00, 4),
('SN007', 'Volkswagen', 'Golf', 'GTI', '2020', 2800000.00, 7),
('SN008', 'Chevrolet', 'Camaro', 'SS', '2021', 42000.00, 5),
('SN009', 'Hyundai', 'Elantra', 'Limited', '2021', 23000.00, 9),
('SN010', 'Kia', 'Optima', 'SX Turbo', '2021', 260000.000, 8),
('SN011', 'Subaru', 'Impreza', 'WRX', '2020', 2900000.000, 4),
('SN012', 'Mazda', 'Mazda3', 'Sport', '2022', 2500000.00, 10),
('SN013', 'Porsche', '911', 'Carrera', '2021', 9000000.00, 2),
('SN014', 'Peugeot', '508', 'GT', '2022', 3800000.00, 3),
('SN015', 'Renault', 'Megane', 'RS', '2021', 3700000.00, 6),
('SN016', 'Fiat', '500X', 'Trekking', '2020', 2200000.00, 7),
('SN017', 'Jeep', 'Wrangler', 'Unlimited', '2021', 5500000.00, 3),
('SN018', 'Land Rover', 'Range Rover', 'Velar', '2021', 7000000.00, 2),
('SN019', 'Chrysler', 'Pacifica', 'Hybrid', '2022', 4700000.00, 4),
('SN020', 'Lexus', 'RX', '350', '2021', 5200000.00, 5),
('SN021', 'Tesla', 'Model S', 'Plaid', '2022', 1100000.00, 1),
('SN022', 'Jaguar', 'F-Type', 'Coupe', '2022', 8000000.00, 2),
('SN023', 'Ferrari', '488', 'GTB', '2021', 2800000.00, 1),
('SN024', 'Lamborghini', 'Huracan', 'Evo', '2022', 3000000.00, 1),
('SN025', 'Ford', 'Explorer', 'Platinum', '2021', 520000.00, 4);


-- Car Color --
insert into carcolor (Serialnumber, carcolor) 
values
('SN001', 'Crimson Red'),
('SN002', 'Royal Blue'),
('SN003', 'Emerald Green'),
('SN004', 'Jet Black'),
('SN005', 'Pearl White'),
('SN006', 'Metallic Silver'),
('SN007', 'Canary Yellow'),
('SN008', 'Slate Gray'),
('SN009', 'Tangerine Orange'),
('SN010', 'Amethyst Purple'),
('SN011', 'Blush Pink'),
('SN012', 'Chocolate Brown'),
('SN013', 'Champagne Beige'),
('SN014', 'Sparkling Gold'),
('SN015', 'Copper Bronze'),
('SN016', 'Anthracite Gray'),
('SN017', 'Turquoise Blue'),
('SN018', 'Midnight Indigo'),
('SN019', 'Teal Green'),
('SN020', 'Burgundy Maroon'),
('SN021', 'Lavender Purple'),
('SN022', 'Aqua Cyan'),
('SN023', 'Olive Green'),
('SN024', 'Lilac Lavender'),
('SN025', 'Ivory Cream');


-- Company --
insert into company (company_id, companyname, city, address, zipcode, phone, email, headquarter_id, Work_Shop_ID)
values
('C001', 'AutoDrive Inc.', 'Cairo', '123 Auto St, Cairo', 12345, '01012345678', 'contact@autodrive.com', NULL, 'WS001'),
('C002', 'Speedy Motors', 'Alexandria', '456 Speed St, Alexandria', 23456, '01198765432', 'info@speedymotors.com', NULL, 'WS002'),
('C003', 'CarMasters', 'Giza', '789 Master Blvd, Giza', 34567, '01234567890', 'support@carmasters.com', NULL, 'WS003'),
('C004', 'Elite Auto Works', 'Tanta', '101 Elite Rd, Tanta', 45678, '01555555555', 'elite@auto.works', 'C001', 'WS004'),
('C005', 'AutoZone', 'London', '55 High St, London', 56789, '+442071234567', 'info@autozone.co.uk', NULL, 'WS005'),
('C006', 'German Car Co.', 'Berlin', '101 Berlin Ave, Berlin', 67890, '+493012345678', 'contact@germancar.de', NULL, 'WS006'),
('C007', 'SpeedStar Ltd.', 'Paris', '33 Champs-Elysees, Paris', 78901, '+33123456789', 'info@speedstar.fr', NULL, 'WS007'),
('C008', 'MotorTrend', 'New York', '200 5th Ave, New York', 89012, '+12121234567', 'support@motortrend.com', NULL, 'WS008'),
('C009', 'CarZone Inc.', 'San Francisco', '400 Bay St, San Francisco', 90123, '+14151234567', 'info@carzone.com', NULL, 'WS009'),
('C010', 'AutoXpress', 'Dubai', '123 Al Sufouh Rd, Dubai', 23456, '+97143216545', 'contact@autoxpress.ae', NULL, 'WS010'),
('C011', 'Luxury Motors', 'Los Angeles', '102 Sunset Blvd, Los Angeles', 56789, '+13234567890', 'info@luxurymotors.com', NULL, 'WS011'),
('C012', 'Rapid Motors', 'Toronto', '220 Bay St, Toronto', 67890, '+14161234567', 'support@rapidmotors.ca', NULL, 'WS012'),
('C013', 'Perfect Wheels', 'Milan', '33 Via Roma, Milan', 78901, '+390212345678', 'info@perfectwheels.it', NULL, 'WS013'),
('C014', 'EuroCars', 'Madrid', '55 Gran Via, Madrid', 89012, '+34911234567', 'contact@eurocars.es', NULL, 'WS014'),
('C015', 'DriveForce', 'Rome', '120 Colosseum Rd, Rome', 90123, '+390612345678', 'info@driveforce.it', NULL, 'WS015'),
('C016', 'Global Motors', 'Sydney', '210 George St, Sydney', 12345, '+61212345678', 'support@globalmotors.com.au', NULL, 'WS016'),
('C017', 'AutoWorld', 'Tokyo', '12 Shibuya, Tokyo', 23456, '+81312345678', 'contact@autoworld.jp', NULL, 'WS017'),
('C018', 'MotoGear', 'Los Angeles', '305 Wilshire Blvd, Los Angeles', 34567, '+13234567890', 'support@motogear.com', NULL, 'WS018'),
('C019', 'DriveMax', 'New York', '500 Park Ave, New York', 45678, '+12123456789', 'info@drivemax.com', NULL, 'WS019'),
('C020', 'AutoFlex', 'Miami', '150 Ocean Dr, Miami', 56789, '+13051234567', 'contact@autoflex.com', NULL, 'WS020'),
('C021', 'CarWorld', 'Cape Town', '100 Nelson Rd, Cape Town', 67890, '+27211234567', 'info@carworld.co.za', NULL, 'WS021'),
('C022', 'VeloCity Motors', 'Paris', '120 Rue de Rivoli, Paris', 78901, '+33123456789', 'contact@velocitymotors.fr', NULL, 'WS022'),
('C023', 'AutoPride', 'Beijing', '66 Wangfujing St, Beijing', 89012, '+86123456789', 'support@autopride.cn', NULL, 'WS023'),
('C024', 'QuickRide', 'Singapore', '88 Orchard Rd, Singapore', 90123, '+6567890123', 'info@quickride.sg', NULL, 'WS024'),
('C025', 'Speedy Wheels', 'Dubai', '55 Sheikh Zayed Rd, Dubai', 23456, '+97144223344', 'contact@speedywheels.ae', NULL, 'WS025');



-- Emplyee --
insert into employee (employee_id, firstname, lastname, email, city, zipcode, address, Jop_id, manager_id, company_id)
values
('E001', 'Ahmed', 'Ali', 'ahmed.ali@example.com', 'Cairo', '12345', '123 Nile Street', 'J001', NULL, 'C022'),
('E002', 'Mona', 'Hassan', 'mona.hassan@example.com', 'Alexandria', '54321', '456 Beach Road', 'J002', 'E001', 'C001'),
('E003', 'Tariq', 'Mohamed', 'tariq.mohamed@example.com', 'Giza', '67890', '789 Pyramid Street', 'J003', 'E002', 'C004'),
('E004', 'Sarah', 'Youssef', 'sarah.youssef@example.com', 'Cairo', '23456', '987 Freedom St', 'J004', 'E002', 'C005'),
('E005', 'Karim', 'Sami', 'karim.sami@example.com', 'Cairo', '34567', '135 El-Tahrir St', 'J005',null,'C025'),
('E006', 'Nadia', 'Fathy', 'nadia.fathy@example.com', 'Cairo', '45678', '246 El-Mohandeseen', 'J006', 'E004', 'C017'),
('E007', 'Omar', 'Ibrahim', 'omar.ibrahim@example.com', 'Giza', '56789', '654 King Farouk St', 'J007', 'E006', 'C019'),
('E008', 'Fatma', 'Saleh', 'fatma.saleh@example.com', 'Cairo', '67890', '321 El-Marg St', 'J008', 'E007', 'C008'),
('E009', 'Sami', 'Ahmed', 'sami.ahmed@example.com', 'Tanta', '78901', '123 Nile Corniche', 'J009', 'E007', 'C009'),
('E010', 'Layla', 'Hussein', 'layla.hussein@example.com', 'Mansoura', '89012', '654 El-Kasr El-Aini St', 'J010', 'E009', 'C021'),
('E011', 'Khaled', 'Gamal', 'khaled.gamal@example.com', 'Sharm El-Sheikh', '90123', '456 Sea View St', 'J011', 'E010', 'C011'),
('E012', 'Mariam', 'Zaki', 'mariam.zaki@example.com', 'Hurghada', '01234', '789 Red Sea Rd', 'J012', 'E010', 'C012'),
('E013', 'Hassan', 'Sherif', 'hassan.sherif@example.com', 'Suez', '12345', '101 Industrial Zone', 'J013', 'E012', 'C013'),
('E014', 'Rasha', 'Mekki', 'rasha.mekki@example.com', 'Ismailia', '23456', '102 El-Gala St', 'J014', 'E013', 'C007'),
('E015', 'Youssef', 'Fawzy', 'youssef.fawzy@example.com', 'Port Said', '34567', '203 Marine St', 'J015', 'E014', 'C024'),
('E016', 'Dina', 'Nabil', 'dina.nabil@example.com', 'Luxor', '45678', '504 Valley St', 'J016', 'E015', 'C016'),
('E017', 'Mohamed', 'Taha', 'mohamed.taha@example.com', 'Aswan', '56789', '609 Oasis St', 'J017', 'E016', 'C010'),
('E018', 'Maha', 'El-Sharif', 'maha.el-sharif@example.com', 'Minya', '67890', '310 Nile Rd', 'J018', 'E017', 'C020'),
('E019', 'Ali', 'Salem', 'ali.salem@example.com', 'Beni Suef', '78901', '715 El-Mansoura St', 'J019', 'E018', 'C023'),
('E020', 'Eman', 'Sayed', 'eman.sayed@example.com', 'Assiut', '89012', '850 Ashwaq St', 'J020', 'E019', 'C014'),
('E021', 'Fayza', 'Abdelrahman', 'fayza.abdelrahman@example.com', 'Cairo', '90123', '101 El-Tahrir St', 'J021', 'E020', 'C015'),
('E022', 'Mounir', 'Hussein', 'mounir.hussein@example.com', 'Giza', '01234', '202 Pyramid Rd', 'J022', 'E021', 'C002'),
('E023', 'Samira', 'Mansour', 'samira.mansour@example.com', 'Tanta', '12345', '303 Suez Canal St', 'J023', 'E022', 'C003'),
('E024', 'Ramy', 'Gaber', 'ramy.gaber@example.com', 'Damanhur', '23456', '404 Al-Mansoura St', 'J024', 'E023', 'C009'),
('E025', 'Nour', 'Ahmed', 'nour.ahmed@example.com', 'Fayoum', '34567', '505 New Cairo St', 'J025', 'E024', 'C018');

ALTER TABLE modification
ALTER COLUMN required_time VARCHAR(255);
--Modification--
INSERT INTO modification (modification_id, modification_name, descripe, cost, required_time, modification_type, Work_Shop_ID, Sparepart_id, employee_id) 
VALUES 
('M001', 'Install Smart Screen', 'Install smart touch screen with Bluetooth and GPS', 4500, '2 hours', 'Interior', 'WS001', 'SP003', 'E001'),
('M002', 'Window Tinting', 'Apply heat and UV protection window tint', 1500, '1 hour', 'Protection', 'WS002', 'SP002', 'E002'),
('M003', 'Install Sport Rims', 'Replace original rims with stylish sport rims', 8000, '3 hours', 'Cosmetic', 'WS003', 'SP006', 'E003'),
('M004', 'ECU Tuning', 'Reprogram ECU to boost engine performance', 10000, '1 day', 'Performance', 'WS004', NULL, 'E004'),
('M005', 'Install Sport Exhaust', 'Install a high-performance sport exhaust system', 6000, '4 hours', 'Performance', 'WS003', 'SP005', 'E005'),
('M006', 'Full Interior Upholstery', 'Upgrade seats and trims to luxury leather', 7000, '1 day', 'Interior', 'WS001', 'SP008', 'E006'),
('M007', 'Sound System Upgrade', 'Install premium speakers and subwoofer', 5500, '5 hours', 'Interior', 'WS003', 'SP009', 'E007'),
('M008', 'Rear Camera Installation', 'Install rearview camera with integrated display', 2500, '2 hours', 'Protection', 'WS002', 'SP010', 'E008'),
('M009', 'Full Car Repainting', 'Complete body repaint with new color', 12000, '2 days', 'Cosmetic', 'WS004', NULL, 'E009'),
('M010', 'Paint Protection Coating', 'Apply nano-ceramic paint protection layer', 7000, '1 day', 'Protection', 'WS001', 'SP011', 'E010'),
('M011', 'Install Body Kit', 'Install custom body kit including bumpers and skirts', 15000, '2 days', 'Cosmetic', 'WS002', 'SP015', 'E011'),
('M012', 'Turbocharger Installation', 'Add turbocharger for better acceleration', 25000, '3 days', 'Performance', 'WS003', 'SP016', 'E012'),
('M013', 'Brake Upgrade', 'Replace with high-performance brake system', 9000, '5 hours', 'Performance', 'WS001', 'SP017', 'E013'),
('M014', 'Suspension Upgrade', 'Install sport suspension for better handling', 12000, '6 hours', 'Performance', 'WS002', 'SP018', 'E014'),
('M015', 'Roof Wrapping', 'Apply matte black vinyl wrap on roof', 3000, '3 hours', 'Cosmetic', 'WS003', NULL, 'E015'),
('M016', 'LED Headlights Upgrade', 'Install LED headlight system', 4000, '2 hours', 'Protection', 'WS001', 'SP019', 'E016'),
('M017', 'Engine Bay Cleaning', 'Deep clean and polish engine bay area', 2000, '2 hours', 'Maintenance', 'WS004', NULL, 'E017'),
('M018', 'Interior Detailing', 'Deep clean seats, carpet, and dashboard', 2500, '5 hours', 'Maintenance', 'WS003', NULL, 'E018'),
('M019', 'Underbody Rust Protection', 'Spray anti-rust protective layer under car', 3500, '4 hours', 'Protection', 'WS002', NULL, 'E019'),
('M020', 'Dashboard Upgrade', 'Install new dashboard trim and panels', 6000, '1 day', 'Interior', 'WS004', 'SP020', 'E020'),
('M021', 'Custom Exhaust Tip', 'Install decorative stainless steel exhaust tip', 1500, '1 hour', 'Cosmetic', 'WS001', 'SP021', 'E021'),
('M022', 'Remote Start System', 'Install remote engine start system', 5000, '3 hours', 'Interior', 'WS002', 'SP022', 'E022'),
('M023', 'Sunroof Installation', 'Install electric sunroof system', 20000, '2 days', 'Cosmetic', 'WS003', 'SP023', 'E023'),
('M024', 'Wireless Charging Pad', 'Add built-in wireless phone charger', 2000, '2 hours', 'Interior', 'WS004', 'SP024', 'E024'),
('M025', 'Install GPS Tracker', 'Install GPS anti-theft tracking device', 3500, '2 hours', 'Protection', 'WS001', 'SP025', 'E025');



-- Car provision --
insert into carprovision (Company_id, Serialnumber, Processdate, Totalprice)
values
('C001', 'SN001', '2025-04-01', 25000.00),
('C002', 'SN002', '2025-04-02', 22000.00),
('C003', 'SN003', '2025-04-03', 27000.00),
('C004', 'SN004', '2025-04-04', 23000.00),
('C005', 'SN005', '2025-04-05', 28000.00),
('C006', 'SN006', '2025-04-06', 30000.00),
('C007', 'SN007', '2025-04-07', 32000.00),
('C008', 'SN008', '2025-04-08', 35000.00),
('C009', 'SN009', '2025-04-09', 31000.00),
('C010', 'SN010', '2025-04-10', 24000.00),
('C011', 'SN011', '2025-04-11', 26000.00),
('C012', 'SN012', '2025-04-12', 23000.00),
('C013', 'SN013', '2025-04-13', 28000.00),
('C014', 'SN014', '2025-04-14', 29000.00),
('C015', 'SN015', '2025-04-15', 35000.00),
('C016', 'SN016', '2025-04-16', 30000.00),
('C017', 'SN017', '2025-04-17', 27000.00),
('C018', 'SN018', '2025-04-18', 26000.00),
('C019', 'SN019', '2025-04-19', 24000.00),
('C020', 'SN020', '2025-04-20', 25000.00),
('C021', 'SN021', '2025-04-21', 32000.00),
('C022', 'SN022', '2025-04-22', 33000.00),
('C023', 'SN023', '2025-04-23', 31000.00),
('C024', 'SN024', '2025-04-24', 30000.00),
('C025', 'SN025', '2025-04-25', 35000.00);
 


INSERT INTO Car (CarID, Brand, Model, ManufacturingYear, ColorID, Price, Mileage, IsAvailable) 
VALUES
(1, 'Toyota', 'Corolla', 2023, 4, 25000.00, 1500, TRUE),
(2, 'Honda', 'Civic', 2022, 3, 22000.00, 8500, TRUE),
(3, 'Ford', 'Mustang', 2023, 1, 42000.00, 500, FALSE),
(4, 'BMW', 'X5', 2023, 5, 65000.00, 200, TRUE),
(5, 'Tesla', 'Model 3', 2023, 2, 45000.00, 1000, TRUE),
(6, 'Nissan', 'Altima', 2022, 10, 23000.00, 12000, TRUE),
(7, 'Mercedes', 'C-Class', 2023, 3, 48000.00, 300, TRUE),
(8, 'Hyundai', 'Elantra', 2021, 7, 18000.00, 25000, FALSE),
(9, 'Kia', 'Sorento', 2023, 6, 38000.00, 5000, TRUE),
(10, 'Chevrolet', 'Malibu', 2022, 9, 21000.00, 18000, TRUE);


----- Dellete datat -----
DELETE FROM employee;

-- Car Order --
insert into carorder (Custmer_id, employee_id, orderdate, downpayment, serialnumber)
values
('C001', 'E001', '2025-04-28', '2000', 'SN001'),
('C002', 'E002', '2025-04-29', '3000', 'SN002'),
('C003', 'E003', '2025-04-30', '1500', 'SN003'),
('C004', 'E004', '2025-05-01', '2500', 'SN004'),
('C005', 'E005', '2025-05-02', '1000', 'SN005'),
('C006', 'E006', '2025-05-03', '500', 'SN006'),
('C007', 'E007', '2025-05-04', '1200', 'SN007'),
('C008', 'E008', '2025-05-05', '1800', 'SN008'),
('C009', 'E009', '2025-05-06', '2200', 'SN009'),
('C010', 'E010', '2025-05-07', '800', 'SN010'),
('C011', 'E011', '2025-05-08', '700', 'SN011'),
('C012', 'E012', '2025-05-09', '1600', 'SN012'),
('C013', 'E013', '2025-05-10', '1100', 'SN013'),
('C014', 'E014', '2025-05-11', '900', 'SN014'),
('C015', 'E015', '2025-05-12', '1300', 'SN015'),
('C016', 'E016', '2025-05-13', '1500', 'SN016'),
('C017', 'E017', '2025-05-14', '2500', 'SN017'),
('C018', 'E018', '2025-05-15', '3500', 'SN018'),
('C019', 'E019', '2025-05-16', '1700', 'SN019'),
('C020', 'E020', '2025-05-17', '2100', 'SN020'),
('C021', 'E021', '2025-05-18', '3000', 'SN021'),
('C022', 'E022', '2025-05-19', '1900', 'SN022'),
('C023', 'E023', '2025-05-20', '2000', 'SN023'),
('C024', 'E024', '2025-05-21', '2200', 'SN024'),
('C025', 'E025', '2025-05-22', '2700', 'SN025');
SELECT Custmer_id 
FROM custmers
WHERE Custmer_id IN ('C001', 'C002', 'C003', 'C004', 'C005', 'C006', 'C007', 'C008', 'C009', 'C010', 
                     'C011', 'C012', 'C013', 'C014', 'C015', 'C016', 'C017', 'C018', 'C019', 'C020', 
                     'C021', 'C022', 'C023', 'C024', 'C025');

-- Emplyee Phone --
insert into employeephone (employee_id, phonenumber)
values
('E001', '01012345678'),
('E002', '01123456789'),
('E003', '01234567890'),
('E004', '01098765432'),
('E005', '01187654321'),
('E006', '01276543210'),
('E007', '01012309876'),
('E008', '01123456701'),
('E009', '01234567012'),
('E010', '01087654321'),
('E011', '01134567890'),
('E012', '01209876543'),
('E013', '01023456789'),
('E014', '01134567001'),
('E015', '01265432100'),
('E016', '01012347890'),
('E017', '01198765432'),
('E018', '01234569876'),
('E019', '01043215678'),
('E020', '01165783901'),
('E021', '01232456789'),
('E022', '01076543210'),
('E023', '01187654300'),
('E024', '01234567098'),
('E025', '01023456701');

------ select -----

-- 1. SELECT all customers
SELECT * FROM custmers;

-- 2. SELECT all cars with price above 500,000
SELECT * FROM car
WHERE Saleprice > 500000;

-- 3. JOIN cars with their available colors
SELECT car.Carname, carcolor.carcolor
FROM car
JOIN carcolor ON car.Serialnumber = carcolor.Serialnumber;

-- 4. Find customers born after 2000
SELECT First_name, Second_name
FROM custmers
WHERE Birth_Date > '2000-01-01';

-- 5. List all services and their prices from the workshop
SELECT Servic, Service_Price
FROM work_shop;

-- 5. Count how many cars are available by brand
SELECT Brand, SUM(Quantity) AS Total_Stock
FROM car
GROUP BY Brand;

-------- Update ---------

----- 1) UPDATE a customer's city -----
UPDATE custmers
SET City = 'Alexandria'
WHERE Custmer_id = 'C001';

----- 2)Update Customers Phone numbers (add country code) -----
UPDATE Cutmers_phone
SET Phone_number = CONCAT('+20', Phone_number)
WHERE Phone_number NOT LIKE '+%';


----- 3) Update Spare Parts (increase prices and adjust quantities) ------
UPDATE sparepart
SET 
    Price = Price * 1.10,  -- 10% price increase
    Quantity = 
        CASE 
            WHEN Quantity < 50 THEN Quantity + 20  -- Restock low inventory
            WHEN Quantity > 100 THEN Quantity - 10  -- Reduce overstock
            ELSE Quantity
        END;

----- 4) Update Cars (price adjustments) -----
UPDATE car
SET 
    Saleprice = 
        CASE 
            WHEN Yearofmanufacture = '2022' THEN Saleprice * 1.15
            WHEN Brand IN ('Toyota', 'Honda') THEN Saleprice * 1.10
            ELSE Saleprice * 1.05
        END,
    Quantity = 
        CASE 
            WHEN Quantity = 0 THEN 5  -- Restock out-of-stock items
            ELSE Quantity
        END;

----- 5)Update Job positions (give raises) -----
UPDATE jop
SET Salary = 
    CASE 
        WHEN Jop_Discreption LIKE '%Manager%' THEN Salary * 1.15  -- 15% raise for managers
        WHEN Salary < 10000 THEN Salary * 1.10  -- 10% raise for lower salaries
        ELSE Salary * 1.05  -- 5% raise for others
    END;

--delete all tables in database --
 
SELECT table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE' AND table_catalog = ' Car_Showroom';


-- delete database --
drop database Car_Showroom