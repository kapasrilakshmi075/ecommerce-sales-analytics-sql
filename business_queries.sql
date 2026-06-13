---Queries---

--Show all customers---
SELECT * FROM customers;

---Show all products---
SELECT * FROM products;

---Show all categories---
SELECT * FROM categories;

---Show all orders---
SELECT * FROM orders;

---Show all order items---
SELECT * FROM order_items;

---Show all payments---
SELECT * FROM payments;

---Show all shipping details---
SELECT * FROM shipping;

---Count total customers---
SELECT COUNT(*) AS total_customers
FROM customers;

---Count total products---
SELECT COUNT(*) AS total_products
FROM products;

-- Count total orders
SELECT COUNT(*) AS total_orders
FROM orders;

---Calculate total revenue---
SELECT SUM(total_amount) AS total_revenue
FROM orders;

---Calculate average order value---
SELECT AVG(total_amount) AS average_order_value
FROM orders;

---Find highest order amount---
SELECT MAX(total_amount) AS highest_order
FROM orders;

---Find lowest order amount---
SELECT MIN(total_amount) AS lowest_order
FROM orders;

---Display products with category names---
SELECT
    p.product_name,
    c.category_name,
    p.brand,
    p.price
FROM products p
JOIN categories c
ON p.category_id = c.category_id;

---Show customer order history---
SELECT
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

---Find top 5 customers by spending---
SELECT
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;

---Calculate total sales by category---
SELECT
    c.category_name,
    SUM(oi.subtotal) AS total_sales
FROM categories c
JOIN products p
ON c.category_id = p.category_id
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY c.category_name
ORDER BY total_sales DESC;

---Find best selling products---
SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY units_sold DESC;

---Show products with low stock---
SELECT
    product_name,
    stock_quantity
FROM products
WHERE stock_quantity < 30;

---Revenue by payment method---
SELECT
    payment_method,
    SUM(amount) AS revenue
FROM payments
GROUP BY payment_method
ORDER BY revenue DESC;

---Payment status summary---
SELECT
    payment_status,
    COUNT(*) AS total_payments
FROM payments
GROUP BY payment_status;

---Orders grouped by status---
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

---Monthly revenue---
SELECT
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

---Orders by city---
SELECT
    c.city,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_orders DESC;

---Find customer with highest purchase---
SELECT
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 1;

---Total quantity sold for each product---
SELECT
    p.product_name,
    SUM(oi.quantity) AS quantity_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY quantity_sold DESC;

---Highest priced product---
SELECT *
FROM products
ORDER BY price DESC
LIMIT 1;

---Cheapest product---
SELECT *
FROM products
ORDER BY price ASC
LIMIT 1;

---Shipping status summary---
SELECT
    shipping_status,
    COUNT(*) AS total_shipments
FROM shipping
GROUP BY shipping_status;

---Orders with payment details---
SELECT
    o.order_id,
    c.first_name,
    p.payment_method,
    p.payment_status,
    o.total_amount
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN payments p
ON o.order_id = p.order_id;

---Rank customers by spending---
SELECT
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS customer_rank
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

---Running total of revenue---
SELECT
    order_date,
    total_amount,
    SUM(total_amount) OVER (ORDER BY order_date) AS running_total
FROM orders;

---Most popular brand---
SELECT
    brand,
    COUNT(*) AS total_products
FROM products
GROUP BY brand
ORDER BY total_products DESC;

---Top 3 categories by revenue---
SELECT
    c.category_name,
    SUM(oi.subtotal) AS revenue
FROM categories c
JOIN products p
ON c.category_id = p.category_id
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY c.category_name
ORDER BY revenue DESC
LIMIT 3;