CREATE TABLE customers (
    customer_id NUMBER,
    customer_name VARCHAR2(50),
    city VARCHAR2(30)
);

CREATE TABLE products (
    product_id NUMBER,
    product_name VARCHAR2(50),
    category VARCHAR2(30),
    price NUMBER
);

CREATE TABLE orders (
    order_id NUMBER,
    customer_id NUMBER,
    product_id NUMBER,
    quantity NUMBER,
    order_date DATE,
    delivery_status VARCHAR2(20)
);

-- Insert Customers
INSERT INTO customers VALUES (1, 'Rahul', 'Bangalore');
INSERT INTO customers VALUES (2, 'Aisha', 'Mysore');
INSERT INTO customers VALUES (3, 'Farhan', 'Chennai');

-- Insert Products
INSERT INTO products VALUES (101, 'Laptop', 'Electronics', 50000);
INSERT INTO products VALUES (102, 'Mouse', 'Accessories', 800);
INSERT INTO products VALUES (103, 'Keyboard', 'Accessories', 1500);

-- Insert Orders
INSERT INTO orders VALUES (1001, 1, 101, 1, DATE '2025-01-10', 'Delivered');
INSERT INTO orders VALUES (1002, 2, 102, 2, DATE '2025-01-15', 'Delayed');
INSERT INTO orders VALUES (1003, 3, 103, 1, DATE '2025-02-01', 'Delivered');

-- Total Revenue
SELECT SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN products p
ON o.product_id = p.product_id;

-- Highest Selling Products
SELECT p.product_name,
       SUM(o.quantity) AS total_sold
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- Delayed Deliveries
SELECT customer_id, delivery_status
FROM orders
WHERE delivery_status = 'Delayed';

-- Monthly Sales Report
SELECT TO_CHAR(order_date, 'MON') AS month,
       SUM(p.price * o.quantity) AS monthly_sales
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY TO_CHAR(order_date, 'MON');
