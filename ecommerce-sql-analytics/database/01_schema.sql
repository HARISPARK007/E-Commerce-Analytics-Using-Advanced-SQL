CREATE DATABASE customer_orders_db;
USE customer_orders_db;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

select * from customers;
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CHECK (price >= 0),
    CHECK (cost >= 0)
);
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    total_amount DECIMAL(12,2) DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    line_total DECIMAL(12,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (quantity > 0)
);


INSERT INTO customers (first_name, last_name, email, phone, city, created_at) VALUES
('Hari','Kumar','user1@mail.com','9876500001','Chennai','2025-01-05'),
('Arun','Sharma','user2@mail.com','9876500002','Bangalore','2025-01-10'),
('Priya','Reddy','user3@mail.com','9876500003','Hyderabad','2025-01-12'),
('Karthik','Nair','user4@mail.com','9876500004','Mumbai','2025-01-15'),
('Divya','Patel','user5@mail.com','9876500005','Delhi','2025-01-18'),

('Rahul','Singh','user6@mail.com','9876500006','Pune','2025-01-20'),
('Sneha','Iyer','user7@mail.com','9876500007','Chennai','2025-01-22'),
('Vikram','Mehta','user8@mail.com','9876500008','Bangalore','2025-01-25'),
('Anjali','Das','user9@mail.com','9876500009','Hyderabad','2025-01-28'),
('Ravi','Verma','user10@mail.com','9876500010','Mumbai','2025-02-01'),

('Hari','Sharma','user11@mail.com','9876500011','Delhi','2025-02-03'),
('Arun','Reddy','user12@mail.com','9876500012','Pune','2025-02-05'),
('Priya','Nair','user13@mail.com','9876500013','Chennai','2025-02-08'),
('Karthik','Patel','user14@mail.com','9876500014','Bangalore','2025-02-10'),
('Divya','Singh','user15@mail.com','9876500015','Hyderabad','2025-02-12'),
('Rahul','Iyer','user16@mail.com','9876500016','Mumbai','2025-02-15'),
('Sneha','Mehta','user17@mail.com','9876500017','Delhi','2025-02-18'),
('Vikram','Das','user18@mail.com','9876500018','Pune','2025-02-20'),
('Anjali','Verma','user19@mail.com','9876500019','Chennai','2025-02-22'),
('Ravi','Kumar','user20@mail.com','9876500020','Bangalore','2025-02-25'),

('Hari','Reddy','user21@mail.com','9876500021','Hyderabad','2025-03-01'),
('Arun','Nair','user22@mail.com','9876500022','Mumbai','2025-03-03'),
('Priya','Patel','user23@mail.com','9876500023','Delhi','2025-03-05'),
('Karthik','Singh','user24@mail.com','9876500024','Pune','2025-03-08'),
('Divya','Iyer','user25@mail.com','9876500025','Chennai','2025-03-10'),
('Rahul','Mehta','user26@mail.com','9876500026','Bangalore','2025-03-12'),
('Sneha','Das','user27@mail.com','9876500027','Hyderabad','2025-03-15'),
('Vikram','Verma','user28@mail.com','9876500028','Mumbai','2025-03-18'),
('Anjali','Kumar','user29@mail.com','9876500029','Delhi','2025-03-20'),
('Ravi','Sharma','user30@mail.com','9876500030','Pune','2025-03-22'),

('Hari','Nair','user31@mail.com','9876500031','Chennai','2025-03-25'),
('Arun','Patel','user32@mail.com','9876500032','Bangalore','2025-03-28'),
('Priya','Singh','user33@mail.com','9876500033','Hyderabad','2025-04-01'),
('Karthik','Iyer','user34@mail.com','9876500034','Mumbai','2025-04-03'),
('Divya','Mehta','user35@mail.com','9876500035','Delhi','2025-04-05'),
('Rahul','Das','user36@mail.com','9876500036','Pune','2025-04-08'),
('Sneha','Verma','user37@mail.com','9876500037','Chennai','2025-04-10'),
('Vikram','Kumar','user38@mail.com','9876500038','Bangalore','2025-04-12'),
('Anjali','Sharma','user39@mail.com','9876500039','Hyderabad','2025-04-15'),
('Ravi','Reddy','user40@mail.com','9876500040','Mumbai','2025-04-18'),

('Hari','Patel','user41@mail.com','9876500041','Delhi','2025-04-20'),
('Arun','Singh','user42@mail.com','9876500042','Pune','2025-04-22'),
('Priya','Iyer','user43@mail.com','9876500043','Chennai','2025-04-25'),
('Karthik','Mehta','user44@mail.com','9876500044','Bangalore','2025-04-28'),
('Divya','Das','user45@mail.com','9876500045','Hyderabad','2025-05-01'),
('Rahul','Verma','user46@mail.com','9876500046','Mumbai','2025-05-03'),
('Sneha','Kumar','user47@mail.com','9876500047','Delhi','2025-05-05'),
('Vikram','Sharma','user48@mail.com','9876500048','Pune','2025-05-08'),
('Anjali','Reddy','user49@mail.com','9876500049','Chennai','2025-05-10'),
('Ravi','Nair','user50@mail.com','9876500050','Bangalore','2025-05-12'),

('Hari','Singh','user51@mail.com','9876500051','Hyderabad','2025-05-15'),
('Arun','Iyer','user52@mail.com','9876500052','Mumbai','2025-05-18'),
('Priya','Mehta','user53@mail.com','9876500053','Delhi','2025-05-20'),
('Karthik','Das','user54@mail.com','9876500054','Pune','2025-05-22'),
('Divya','Verma','user55@mail.com','9876500055','Chennai','2025-05-25'),
('Rahul','Kumar','user56@mail.com','9876500056','Bangalore','2025-05-28'),
('Sneha','Sharma','user57@mail.com','9876500057','Hyderabad','2025-06-01'),
('Vikram','Reddy','user58@mail.com','9876500058','Mumbai','2025-06-03'),
('Anjali','Nair','user59@mail.com','9876500059','Delhi','2025-06-05'),
('Ravi','Patel','user60@mail.com','9876500060','Pune','2025-06-08'),

('Hari','Iyer','user61@mail.com','9876500061','Chennai','2025-06-10'),
('Arun','Mehta','user62@mail.com','9876500062','Bangalore','2025-06-12'),
('Priya','Das','user63@mail.com','9876500063','Hyderabad','2025-06-15'),
('Karthik','Verma','user64@mail.com','9876500064','Mumbai','2025-06-18'),
('Divya','Kumar','user65@mail.com','9876500065','Delhi','2025-06-20'),
('Rahul','Sharma','user66@mail.com','9876500066','Pune','2025-06-22'),
('Sneha','Reddy','user67@mail.com','9876500067','Chennai','2025-06-25'),
('Vikram','Nair','user68@mail.com','9876500068','Bangalore','2025-06-28'),
('Anjali','Patel','user69@mail.com','9876500069','Hyderabad','2025-07-01'),
('Ravi','Singh','user70@mail.com','9876500070','Mumbai','2025-07-03'),

('Hari','Mehta','user71@mail.com','9876500071','Delhi','2025-07-05'),
('Arun','Das','user72@mail.com','9876500072','Pune','2025-07-08'),
('Priya','Verma','user73@mail.com','9876500073','Chennai','2025-07-10'),
('Karthik','Kumar','user74@mail.com','9876500074','Bangalore','2025-07-12'),
('Divya','Sharma','user75@mail.com','9876500075','Hyderabad','2025-07-15'),
('Rahul','Reddy','user76@mail.com','9876500076','Mumbai','2025-07-18'),
('Sneha','Nair','user77@mail.com','9876500077','Delhi','2025-07-20'),
('Vikram','Patel','user78@mail.com','9876500078','Pune','2025-07-22'),
('Anjali','Singh','user79@mail.com','9876500079','Chennai','2025-07-25'),
('Ravi','Iyer','user80@mail.com','9876500080','Bangalore','2025-07-28'),

('Hari','Das','user81@mail.com','9876500081','Hyderabad','2025-08-01'),
('Arun','Verma','user82@mail.com','9876500082','Mumbai','2025-08-03'),
('Priya','Kumar','user83@mail.com','9876500083','Delhi','2025-08-05'),
('Karthik','Sharma','user84@mail.com','9876500084','Pune','2025-08-08'),
('Divya','Reddy','user85@mail.com','9876500085','Chennai','2025-08-10'),
('Rahul','Nair','user86@mail.com','9876500086','Bangalore','2025-08-12'),
('Sneha','Patel','user87@mail.com','9876500087','Hyderabad','2025-08-15'),
('Vikram','Singh','user88@mail.com','9876500088','Mumbai','2025-08-18'),
('Anjali','Iyer','user89@mail.com','9876500089','Delhi','2025-08-20'),
('Ravi','Mehta','user90@mail.com','9876500090','Pune','2025-08-22'),

('Hari','Verma','user91@mail.com','9876500091','Chennai','2025-08-25'),
('Arun','Kumar','user92@mail.com','9876500092','Bangalore','2025-08-28'),
('Priya','Sharma','user93@mail.com','9876500093','Hyderabad','2025-09-01'),
('Karthik','Reddy','user94@mail.com','9876500094','Mumbai','2025-09-03'),
('Divya','Nair','user95@mail.com','9876500095','Delhi','2025-09-05'),
('Rahul','Patel','user96@mail.com','9876500096','Pune','2025-09-08'),
('Sneha','Singh','user97@mail.com','9876500097','Chennai','2025-09-10'),
('Vikram','Iyer','user98@mail.com','9876500098','Bangalore','2025-09-12'),
('Anjali','Mehta','user99@mail.com','9876500099','Hyderabad','2025-09-15'),
('Ravi','Das','user100@mail.com','9876500100','Mumbai','2025-09-18');

INSERT INTO products (product_name, category, price, cost, created_at) VALUES
('Laptop Pro 14','Electronics',75000,55000,'2025-01-01'),
('Laptop Air 13','Electronics',62000,45000,'2025-01-02'),
('Gaming Laptop X','Electronics',95000,72000,'2025-01-03'),
('Wireless Mouse','Accessories',800,400,'2025-01-04'),
('Mechanical Keyboard','Accessories',3500,1800,'2025-01-05'),
('USB-C Hub','Accessories',1500,800,'2025-01-06'),
('Bluetooth Speaker','Electronics',4000,2200,'2025-01-07'),
('Noise Cancelling Headphones','Electronics',9000,5500,'2025-01-08'),
('Smartphone A1','Electronics',18000,12000,'2025-01-09'),
('Smartphone Pro','Electronics',32000,22000,'2025-01-10'),

('Tablet 10 inch','Electronics',22000,15000,'2025-01-11'),
('Smartwatch Fit','Electronics',5000,2800,'2025-01-12'),
('Fitness Band','Electronics',2500,1400,'2025-01-13'),
('External HDD 1TB','Accessories',4500,2600,'2025-01-14'),
('External SSD 512GB','Accessories',6500,4200,'2025-01-15'),
('Pen Drive 64GB','Accessories',700,350,'2025-01-16'),
('Webcam HD','Accessories',2000,1100,'2025-01-17'),
('Office Chair','Furniture',8500,5000,'2025-01-18'),
('Study Table','Furniture',7000,4200,'2025-01-19'),
('LED Monitor 24','Electronics',12000,8000,'2025-01-20'),

('LED Monitor 27','Electronics',18000,12000,'2025-01-21'),
('Printer Inkjet','Electronics',6500,4200,'2025-01-22'),
('Printer Laser','Electronics',15000,10000,'2025-01-23'),
('Router Dual Band','Electronics',3000,1800,'2025-01-24'),
('Power Bank 10000mAh','Accessories',1200,700,'2025-01-25'),
('Power Bank 20000mAh','Accessories',1800,1000,'2025-01-26'),
('Desk Lamp','Home',900,450,'2025-01-27'),
('Wall Clock','Home',600,250,'2025-01-28'),
('Electric Kettle','Home',1800,1000,'2025-01-29'),
('Mixer Grinder','Home',3500,2100,'2025-01-30'),

('Air Fryer','Home',6500,4200,'2025-02-01'),
('Vacuum Cleaner','Home',8000,5200,'2025-02-02'),
('Water Purifier','Home',12000,8000,'2025-02-03'),
('Ceiling Fan','Home',2500,1500,'2025-02-04'),
('Table Fan','Home',1800,1000,'2025-02-05'),
('Men T-Shirt','Fashion',700,300,'2025-02-06'),
('Men Jeans','Fashion',1800,900,'2025-02-07'),
('Men Shoes','Fashion',3200,1800,'2025-02-08'),
('Women Kurti','Fashion',1200,600,'2025-02-09'),
('Women Handbag','Fashion',2500,1400,'2025-02-10'),

('Women Sandals','Fashion',1500,800,'2025-02-11'),
('Jacket Winter','Fashion',2800,1600,'2025-02-12'),
('Socks Pack','Fashion',400,150,'2025-02-13'),
('Cap','Fashion',350,120,'2025-02-14'),
('Sunglasses','Fashion',1200,600,'2025-02-15'),
('Backpack','Accessories',2200,1300,'2025-02-16'),
('Travel Trolley','Accessories',6500,4000,'2025-02-17'),
('Notebook Pack','Stationery',500,200,'2025-02-18'),
('Ball Pen Pack','Stationery',200,80,'2025-02-19'),
('Marker Set','Stationery',350,150,'2025-02-20'),

('Whiteboard','Stationery',1500,800,'2025-02-21'),
('Office File Set','Stationery',600,300,'2025-02-22'),
('Calculator','Stationery',900,500,'2025-02-23'),
('Desk Organizer','Stationery',700,350,'2025-02-24'),
('Stapler','Stationery',300,120,'2025-02-25'),
('Water Bottle Steel','Home',900,400,'2025-02-26'),
('Lunch Box','Home',700,300,'2025-02-27'),
('Coffee Mug','Home',400,150,'2025-02-28'),
('Bed Sheet','Home',1800,900,'2025-03-01'),
('Pillow Set','Home',1200,600,'2025-03-02'),

('Curtains','Home',2200,1200,'2025-03-03'),
('Door Mat','Home',500,200,'2025-03-04'),
('Room Heater','Home',3500,2000,'2025-03-05'),
('Air Conditioner 1.5T','Electronics',38000,28000,'2025-03-06'),
('Refrigerator 300L','Electronics',28000,20000,'2025-03-07'),
('Washing Machine','Electronics',22000,16000,'2025-03-08'),
('Microwave Oven','Electronics',9000,6000,'2025-03-09'),
('Induction Stove','Home',2500,1500,'2025-03-10'),
('Gas Stove','Home',4000,2500,'2025-03-11'),
('Cookware Set','Home',3200,1800,'2025-03-12'),

('Knife Set','Home',1200,600,'2025-03-13'),
('Chopping Board','Home',400,150,'2025-03-14'),
('Dining Set','Home',4500,2800,'2025-03-15'),
('Sofa 3 Seater','Furniture',28000,18000,'2025-03-16'),
('Bookshelf','Furniture',6500,4000,'2025-03-17'),
('Wardrobe','Furniture',18000,12000,'2025-03-18'),
('TV Unit','Furniture',9000,5500,'2025-03-19'),
('Office Desk','Furniture',8500,5000,'2025-03-20'),
('Bean Bag','Furniture',2500,1400,'2025-03-21'),
('Gaming Chair','Furniture',12000,7500,'2025-03-22'),

('Smart TV 43','Electronics',32000,24000,'2025-03-23'),
('Smart TV 55','Electronics',52000,38000,'2025-03-24'),
('Soundbar','Electronics',8500,5000,'2025-03-25'),
('Projector','Electronics',28000,19000,'2025-03-26'),
('Home Theater','Electronics',18000,12000,'2025-03-27'),
('Extension Board','Accessories',600,250,'2025-03-28'),
('HDMI Cable','Accessories',500,200,'2025-03-29'),
('LAN Cable','Accessories',300,120,'2025-03-30'),
('Surge Protector','Accessories',1200,600,'2025-03-31'),
('Laptop Stand','Accessories',1500,700,'2025-04-01');

INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1,'2025-01-05','Delivered',0),
(2,'2025-01-06','Delivered',0),
(3,'2025-01-07','Shipped',0),
(4,'2025-01-08','Pending',0),
(5,'2025-01-09','Delivered',0),
(6,'2025-01-10','Cancelled',0),
(7,'2025-01-11','Delivered',0),
(8,'2025-01-12','Delivered',0),
(9,'2025-01-13','Shipped',0),
(10,'2025-01-14','Delivered',0),

(11,'2025-01-15','Delivered',0),
(12,'2025-01-16','Pending',0),
(13,'2025-01-17','Delivered',0),
(14,'2025-01-18','Delivered',0),
(15,'2025-01-19','Cancelled',0),
(16,'2025-01-20','Delivered',0),
(17,'2025-01-21','Delivered',0),
(18,'2025-01-22','Shipped',0),
(19,'2025-01-23','Delivered',0),
(20,'2025-01-24','Delivered',0),

(21,'2025-01-25','Delivered',0),
(22,'2025-01-26','Pending',0),
(23,'2025-01-27','Delivered',0),
(24,'2025-01-28','Delivered',0),
(25,'2025-01-29','Delivered',0),
(26,'2025-01-30','Shipped',0),
(27,'2025-02-01','Delivered',0),
(28,'2025-02-02','Delivered',0),
(29,'2025-02-03','Cancelled',0),
(30,'2025-02-04','Delivered',0),

(31,'2025-02-05','Delivered',0),
(32,'2025-02-06','Delivered',0),
(33,'2025-02-07','Pending',0),
(34,'2025-02-08','Delivered',0),
(35,'2025-02-09','Delivered',0),
(36,'2025-02-10','Shipped',0),
(37,'2025-02-11','Delivered',0),
(38,'2025-02-12','Delivered',0),
(39,'2025-02-13','Delivered',0),
(40,'2025-02-14','Cancelled',0),

(41,'2025-02-15','Delivered',0),
(42,'2025-02-16','Delivered',0),
(43,'2025-02-17','Pending',0),
(44,'2025-02-18','Delivered',0),
(45,'2025-02-19','Delivered',0),
(46,'2025-02-20','Delivered',0),
(47,'2025-02-21','Shipped',0),
(48,'2025-02-22','Delivered',0),
(49,'2025-02-23','Delivered',0),
(50,'2025-02-24','Delivered',0),

(51,'2025-02-25','Delivered',0),
(52,'2025-02-26','Pending',0),
(53,'2025-02-27','Delivered',0),
(54,'2025-02-28','Delivered',0),
(55,'2025-03-01','Delivered',0),
(56,'2025-03-02','Shipped',0),
(57,'2025-03-03','Delivered',0),
(58,'2025-03-04','Delivered',0),
(59,'2025-03-05','Cancelled',0),
(60,'2025-03-06','Delivered',0),

(61,'2025-03-07','Delivered',0),
(62,'2025-03-08','Delivered',0),
(63,'2025-03-09','Pending',0),
(64,'2025-03-10','Delivered',0),
(65,'2025-03-11','Delivered',0),
(66,'2025-03-12','Shipped',0),
(67,'2025-03-13','Delivered',0),
(68,'2025-03-14','Delivered',0),
(69,'2025-03-15','Delivered',0),
(70,'2025-03-16','Cancelled',0),

(71,'2025-03-17','Delivered',0),
(72,'2025-03-18','Delivered',0),
(73,'2025-03-19','Pending',0),
(74,'2025-03-20','Delivered',0),
(75,'2025-03-21','Delivered',0),
(76,'2025-03-22','Delivered',0),
(77,'2025-03-23','Shipped',0),
(78,'2025-03-24','Delivered',0),
(79,'2025-03-25','Delivered',0),
(80,'2025-03-26','Delivered',0),

(81,'2025-03-27','Delivered',0),
(82,'2025-03-28','Pending',0),
(83,'2025-03-29','Delivered',0),
(84,'2025-03-30','Delivered',0),
(85,'2025-03-31','Delivered',0),
(86,'2025-04-01','Shipped',0),
(87,'2025-04-02','Delivered',0),
(88,'2025-04-03','Delivered',0),
(89,'2025-04-04','Cancelled',0),
(90,'2025-04-05','Delivered',0),

(91,'2025-04-06','Delivered',0),
(92,'2025-04-07','Delivered',0),
(93,'2025-04-08','Pending',0),
(94,'2025-04-09','Delivered',0),
(95,'2025-04-10','Delivered',0),
(96,'2025-04-11','Delivered',0),
(97,'2025-04-12','Shipped',0),
(98,'2025-04-13','Delivered',0),
(99,'2025-04-14','Delivered',0),
(100,'2025-04-15','Delivered',0);

INSERT INTO order_items (order_id, product_id, quantity, unit_price, line_total) VALUES
(1,1,1,75000,75000),
(1,4,2,800,1600),
(2,2,1,62000,62000),
(2,6,1,1500,1500),
(3,3,1,95000,95000),

(3,5,1,3500,3500),

(4,10,2,32000,64000),
(4,7,1,4000,4000),

(5,8,1,9000,9000),
(5,9,2,18000,36000),

(6,11,1,22000,22000),
(6,15,1,6500,6500),

(7,12,2,5000,10000),
(7,14,1,4500,4500),

(8,16,3,700,2100),
(8,17,1,2000,2000),

(9,18,1,8500,8500),
(9,19,1,7000,7000),

(10,20,1,12000,12000),
(10,21,1,18000,18000),

(11,22,1,6500,6500),
(11,23,1,15000,15000),

(12,24,2,3000,6000),
(12,25,1,1200,1200),

(13,26,1,1800,1800),
(13,27,2,900,1800),

(14,28,1,600,600),
(14,29,1,1800,1800),

(15,30,1,3500,3500),
(15,31,1,6500,6500),

(16,32,1,8000,8000),
(16,33,1,12000,12000),

(17,34,1,2500,2500),
(17,35,1,1800,1800),

(18,36,2,700,1400),
(18,37,1,1800,1800),

(19,38,1,3200,3200),
(19,39,1,1200,1200),

(20,40,1,2500,2500),
(20,41,1,1500,1500),

(21,42,1,2800,2800),
(21,43,2,400,800),

(22,44,1,350,350),
(22,45,1,1200,1200),

(23,46,1,2200,2200),
(23,47,1,6500,6500),

(24,48,2,500,1000),
(24,49,1,200,200),

(25,50,1,350,350),
(25,51,1,1500,1500),

(26,52,1,600,600),
(26,53,1,900,900),

(27,54,1,700,700),
(27,55,1,300,300),

(28,56,1,400,400),
(28,57,1,1800,1800),

(29,58,1,1200,1200),
(29,59,1,2200,2200),

(30,60,1,500,500),
(30,61,1,1200,1200),

(31,62,1,2200,2200),
(31,63,1,400,400),

(32,64,1,3500,3500),
(32,65,1,8000,8000),

(33,66,1,28000,28000),
(33,67,1,22000,22000),

(34,68,1,9000,9000),
(34,69,1,2500,2500),

(35,70,1,4000,4000),
(35,71,1,3200,3200),

(36,72,1,1200,1200),
(36,73,1,400,400),

(37,74,1,28000,28000),
(37,75,1,6500,6500),

(38,76,1,18000,18000),
(38,77,1,9000,9000),

(39,78,1,2500,2500),
(39,79,1,12000,12000),

(40,80,1,32000,32000),
(40,81,1,52000,52000),

(41,82,1,8500,8500),
(41,83,1,28000,28000),

(42,84,1,18000,18000),
(42,85,1,600,600),

(43,86,1,500,500),
(43,87,1,300,300),

(44,88,1,1200,1200),
(44,89,1,1500,1500),

(45,90,1,1500,1500),
(45,91,1,700,700),

(46,92,1,62000,62000),
(46,93,1,75000,75000),

(47,94,1,95000,95000),
(47,95,1,18000,18000),

(48,96,1,32000,32000),
(48,97,1,9000,9000),

(49,98,1,5000,5000),
(49,99,1,2500,2500),

(50,100,1,4000,4000),
(50,10,1,32000,32000);

INSERT INTO products (product_name, category, price, cost, created_at) VALUES
('Wireless Earbuds','Electronics',5000,3000,'2025-04-02'),
('Portable Bluetooth Speaker','Electronics',6000,3500,'2025-04-02'),
('Smart Home Camera','Electronics',7000,4200,'2025-04-02'),
('Laptop Sleeve 15 inch','Accessories',800,400,'2025-04-02'),
('Phone Case Premium','Accessories',1200,600,'2025-04-02'),
('Electric Iron','Home',2500,1500,'2025-04-02'),
('Digital Weighing Scale','Home',3200,2000,'2025-04-02'),
('Men Formal Shirt','Fashion',1500,800,'2025-04-02'),
('Women Casual Dress','Fashion',1800,900,'2025-04-02'),
('Wooden Coffee Table','Furniture',9000,6000,'2025-04-02');



INSERT INTO order_items (order_id, product_id, quantity, unit_price, line_total) VALUES
(1,1,1,75000,75000),
(1,4,2,800,1600),

(2,2,1,62000,62000),
(2,6,1,1500,1500),

(3,3,1,95000,95000),
(3,5,1,3500,3500),

(4,10,2,32000,64000),
(4,7,1,4000,4000),

(5,8,1,9000,9000),
(5,9,2,18000,36000),

(6,11,1,22000,22000),
(6,15,1,6500,6500),

(7,12,2,5000,10000),
(7,14,1,4500,4500),

(8,16,3,700,2100),
(8,17,1,2000,2000),

(9,18,1,8500,8500),
(9,19,1,7000,7000),

(10,20,1,12000,12000),
(10,21,1,18000,18000),

(11,22,1,6500,6500),
(11,23,1,15000,15000),

(12,24,2,3000,6000),
(12,25,1,1200,1200),

(13,26,1,1800,1800),
(13,27,2,900,1800),

(14,28,1,600,600),
(14,29,1,1800,1800),

(15,30,1,3500,3500),
(15,31,1,6500,6500),

(16,32,1,8000,8000),
(16,33,1,12000,12000),

(17,34,1,2500,2500),
(17,35,1,1800,1800),

(18,36,2,700,1400),
(18,37,1,1800,1800),

(19,38,1,3200,3200),
(19,39,1,1200,1200),

(20,40,1,2500,2500),
(20,41,1,1500,1500),

(21,42,1,2800,2800),
(21,43,2,400,800),

(22,44,1,350,350),
(22,45,1,1200,1200),

(23,46,1,2200,2200),
(23,47,1,6500,6500),

(24,48,2,500,1000),
(24,49,1,200,200),

(25,50,1,350,350);





# Task 2

create table returns( return_id int primary key auto_increment,
order_item_id int ,foreign key (order_item_id) references order_items(order_item_id),
order_id int, foreign key (order_id)references  orders(order_id),
product_id int,foreign key(product_id) references products(product_id),
customer_id int ,foreign key(customer_id) references customers(customer_id),
return_reason varchar(100) Not Null,
return_status varchar(50) Not Null,
refund_amount decimal(10,2) default 0,
returned_at timestamp Not Null,
processed_at timestamp Null);

create table promotions(promo_id int primary key auto_increment,
promo_code varchar(50)unique Not Null,
promo_name varchar(100) Not Null,
Discount_type varchar(20) Not Null CHECK (Discount_type IN ('PERCENTAGE', 'FIXED_AMOUNT')),
discount_value decimal(10,2) Not Null,
min_order_value decimal(10,2) default 0,
usage_limit INTEGER NULL,
times_used INTEGER DEFAULT 0,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT chk_date_range CHECK (end_date >= start_date),
CONSTRAINT chk_percentage_limit CHECK (
        (discount_type = 'PERCENTAGE' AND discount_value <= 100.00 AND discount_value >= 0) OR
        (discount_type = 'FIXED_AMOUNT' AND discount_value >= 0)
    )
);
create table order_promotions(order_promo_id int primary key auto_increment,
order_id int , foreign key (order_id) references orders(order_id),
promo_id int,foreign key(promo_id) references promotions(promo_id),
discount_applied decimal(10,2) Not Null ,
applied_at timestamp default Now());

create table product_inventory(inventory_id int  primary  key auto_increment,
product_id int unique, foreign key (product_id) references products(product_id),
stock_quantity int Not Null Default 0,
reserved_quantity int Default 0,
restock_threshold INT NOT NULL,
restock_quantity INT NOT NULL,
unit_cost DECIMAL(10,2) NOT NULL,
last_restocked_at TIMESTAMP NULL,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);


INSERT INTO returns
(order_item_id, order_id, product_id, customer_id,
 return_reason, return_status, refund_amount,
 returned_at, processed_at)
SELECT 
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    o.customer_id,
    CASE 
        WHEN oi.order_item_id % 4 = 0 THEN 'Defective'
        WHEN oi.order_item_id % 4 = 1 THEN 'Damaged'
        WHEN oi.order_item_id % 4 = 2 THEN 'Wrong Item'
        ELSE 'Changed Mind'
    END,
    CASE 
        WHEN oi.order_item_id % 4 = 0 THEN 'Approved'
        WHEN oi.order_item_id % 4 = 1 THEN 'Refunded'
        WHEN oi.order_item_id % 4 = 2 THEN 'Rejected'
        ELSE 'Pending'
    END,
    ROUND(oi.line_total * 0.8,2),
    o.order_date + INTERVAL 2 DAY,
    CASE 
        WHEN oi.order_item_id % 3 = 0 
        THEN o.order_date + INTERVAL 5 DAY
        ELSE NULL
       
    END
FROM order_items oi
JOIN orders o 
    ON oi.order_id = o.order_id
LIMIT 100;

SELECT MIN(order_item_id), MAX(order_item_id), COUNT(*)
FROM order_items;
 select * from returns;
 
 
 INSERT INTO promotions
(promo_code, promo_name, discount_type, discount_value, min_order_value, usage_limit, times_used, start_date, end_date)
VALUES
('WELCOME10', 'Welcome Offer', 'PERCENTAGE', 10, 500, NULL, 0, '2024-01-01', '2025-12-31'),
('SUMMER20', 'Summer Sale', 'PERCENTAGE', 20, 1000, 500, 0, '2024-04-01', '2024-06-30'),
('FESTIVE15', 'Festival Discount', 'PERCENTAGE', 15, 800, NULL, 0, '2024-10-01', '2024-11-15'),
('NEWYEAR25', 'New Year Offer', 'PERCENTAGE', 25, 1500, 200, 0, '2025-01-01', '2025-01-31'),
('FLAT100', 'Flat Rs 100 Off', 'FIXED_AMOUNT', 100, 1000, NULL, 0, '2024-01-01', '2025-12-31'),
('FLAT250', 'Flat Rs 250 Off', 'FIXED_AMOUNT', 250, 2000, 300, 0, '2024-03-01', '2025-03-31'),
('DIWALI30', 'Diwali Mega Sale', 'PERCENTAGE', 30, 2000, 150, 0, '2024-10-20', '2024-11-10'),
('CLEARANCE50', 'Clearance Offer', 'FIXED_AMOUNT', 50, 300, NULL, 0, '2024-02-01', '2025-12-31');



INSERT INTO order_promotions
(order_id, promo_id, discount_applied, applied_at)
SELECT 
    o.order_id,
    FLOOR(1 + RAND() * 8),  -- promo_id between 1 and 8
    ROUND(
        CASE 
            WHEN RAND() < 0.5 
            THEN o.total_amount * (0.05 + RAND() * 0.15)   -- 5%–20%
            ELSE 50 + RAND() * 200                         -- fixed ₹50–₹250
        END, 2
    ),
    o.order_date
FROM orders o
WHERE RAND() < 0.35;   -- ~35% orders get promotion

SELECT product_id FROM products;

INSERT INTO product_inventory
(product_id, stock_quantity, reserved_quantity, restock_threshold,
 restock_quantity, unit_cost, last_restocked_at)
SELECT
    product_id,
    100,                  -- default stock
    10,                   -- reserved
    50,                   -- threshold
    150,                  -- restock quantity
    cost,
    NOW() - INTERVAL 10 DAY
FROM products
WHERE product_id BETWEEN 1 AND 100;
UPDATE product_inventory
SET stock_quantity = 20
WHERE product_id % 4 = 0;
select * from product_inventory;

SELECT *
FROM product_inventory
WHERE stock_quantity < restock_threshold;



select * from promotions;
SELECT customer_id 
FROM customers 
LIMIT 10;
INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES

-- Jan cohort customers returning in Feb & Mar
(1,  '2025-02-05', 'Delivered', 2500),
(1,  '2025-03-10', 'Delivered', 1800),

(2,  '2025-02-12', 'Delivered', 3000),

(3,  '2025-03-18', 'Delivered', 2100),

(4,  '2025-02-20', 'Delivered', 1900),

-- Feb cohort customers returning later
(10, '2025-03-07', 'Delivered', 2600),
(10, '2025-04-09', 'Delivered', 1900),

(11, '2025-03-25', 'Delivered', 2100),

(12, '2025-04-05', 'Delivered', 1700),

(13, '2025-04-11', 'Delivered', 2400),

-- More repeat behaviour
(14, '2025-03-15', 'Delivered', 2200),
(15, '2025-04-18', 'Delivered', 2000),
(16, '2025-03-22', 'Delivered', 1600),
(17, '2025-04-25', 'Delivered', 2800);


