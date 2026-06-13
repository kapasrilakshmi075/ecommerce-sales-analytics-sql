---inserting data---
---Insert Data into Categories---
INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Electronic gadgets and devices'),
('Clothing', 'Fashion and apparel'),
('Home Appliances', 'Home and kitchen products'),
('Books', 'Educational and entertainment books'),
('Sports', 'Sports equipment and accessories');
SELECT * FROM categories;
---Insert Data into Customers---
INSERT INTO customers (first_name, last_name, email, phone, city, state, country) VALUES
('Rahul', 'Sharma', 'rahul@gmail.com', '9876543210', 'Hyderabad', 'Telangana', 'India'),
('Priya', 'Reddy', 'priya@gmail.com', '9876543211', 'Vijayawada', 'Andhra Pradesh', 'India'),
('Amit', 'Kumar', 'amit@gmail.com', '9876543212', 'Bangalore', 'Karnataka', 'India'),
('Sneha', 'Patel', 'sneha@gmail.com', '9876543213', 'Mumbai', 'Maharashtra', 'India'),
('Arjun', 'Verma', 'arjun@gmail.com', '9876543214', 'Chennai', 'Tamil Nadu', 'India'),
('Neha', 'Singh', 'neha@gmail.com', '9876543215', 'Pune', 'Maharashtra', 'India'),
('Ravi', 'Teja', 'ravi@gmail.com', '9876543216', 'Visakhapatnam', 'Andhra Pradesh', 'India'),
('Divya', 'Nair', 'divya@gmail.com', '9876543217', 'Kochi', 'Kerala', 'India'),
('Kiran', 'Rao', 'kiran@gmail.com', '9876543218', 'Warangal', 'Telangana', 'India'),
('Anjali', 'Das', 'anjali@gmail.com', '9876543219', 'Kolkata', 'West Bengal', 'India');
SELECT * FROM products;
---Insert Data into Products---
INSERT INTO products (category_id, product_name, brand, price, stock_quantity) VALUES
(1, 'iPhone 15', 'Apple', 79999.00, 25),
(1, 'Galaxy S24', 'Samsung', 69999.00, 30),
(1, 'Laptop Pro', 'Dell', 85000.00, 15),
(2, 'Men T-Shirt', 'Puma', 1200.00, 100),
(2, 'Women Jeans', 'Levis', 2500.00, 80),
(3, 'Microwave Oven', 'LG', 15000.00, 20),
(3, 'Mixer Grinder', 'Prestige', 4500.00, 40),
(4, 'SQL for Beginners', 'Pearson', 750.00, 60),
(4, 'Python Programming', 'OReilly', 950.00, 45),
(5, 'Football', 'Nike', 1800.00, 35);
SELECT * FROM products;
---Insert Data into Orders---
INSERT INTO orders (customer_id, order_date, order_status, total_amount) VALUES
(1, '2025-01-10', 'Delivered', 81200.00),
(2, '2025-01-15', 'Delivered', 2500.00),
(3, '2025-02-01', 'Shipped', 85000.00),
(4, '2025-02-05', 'Pending', 1200.00),
(5, '2025-02-12', 'Delivered', 15000.00),
(6, '2025-03-01', 'Delivered', 750.00),
(7, '2025-03-10', 'Cancelled', 1800.00),
(8, '2025-03-15', 'Delivered', 950.00),
(9, '2025-04-01', 'Shipped', 4500.00),
(10, '2025-04-10', 'Pending', 69999.00);
SELECT * FROM orders;
---Insert Data into Order Items---
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) VALUES
(1, 1, 1, 79999.00, 79999.00),
(1, 8, 1, 750.00, 750.00),
(2, 5, 1, 2500.00, 2500.00),
(3, 3, 1, 85000.00, 85000.00),
(4, 4, 1, 1200.00, 1200.00),
(5, 6, 1, 15000.00, 15000.00),
(6, 8, 1, 750.00, 750.00),
(7, 10, 1, 1800.00, 1800.00),
(8, 9, 1, 950.00, 950.00),
(9, 7, 1, 4500.00, 4500.00),
(10, 2, 1, 69999.00, 69999.00);
SELECT * FROM order_items;
---Insert Data into Payments---
INSERT INTO payments (order_id, payment_date, payment_method, payment_status, amount) VALUES
(1, '2025-01-10', 'Credit Card', 'Paid', 81200.00),
(2, '2025-01-15', 'UPI', 'Paid', 2500.00),
(3, '2025-02-01', 'Debit Card', 'Paid', 85000.00),
(4, '2025-02-05', 'Cash on Delivery', 'Pending', 1200.00),
(5, '2025-02-12', 'UPI', 'Paid', 15000.00),
(6, '2025-03-01', 'Net Banking', 'Paid', 750.00),
(7, '2025-03-10', 'UPI', 'Refunded', 1800.00),
(8, '2025-03-15', 'Credit Card', 'Paid', 950.00),
(9, '2025-04-01', 'Debit Card', 'Paid', 4500.00),
(10, '2025-04-10', 'UPI', 'Pending', 69999.00);
SELECT * FROM payments;
---Insert Data into Shipping---
INSERT INTO shipping (order_id, shipping_date, delivery_date, shipping_status, courier_name, tracking_number) VALUES
(1, '2025-01-11', '2025-01-13', 'Delivered', 'BlueDart', 'BD1001'),
(2, '2025-01-16', '2025-01-18', 'Delivered', 'DTDC', 'DT2002'),
(3, '2025-02-02', NULL, 'In Transit', 'Delhivery', 'DL3003'),
(4, NULL, NULL, 'Pending', NULL, NULL),
(5, '2025-02-13', '2025-02-15', 'Delivered', 'BlueDart', 'BD5005'),
(6, '2025-03-02', '2025-03-04', 'Delivered', 'India Post', 'IP6006'),
(7, NULL, NULL, 'Cancelled', NULL, NULL),
(8, '2025-03-16', '2025-03-18', 'Delivered', 'DTDC', 'DT8008'),
(9, '2025-04-02', NULL, 'In Transit', 'Delhivery', 'DL9009'),
(10, NULL, NULL, 'Processing', NULL, NULL);
SELECT * FROM shipping;