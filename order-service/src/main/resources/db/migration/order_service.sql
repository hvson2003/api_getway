CREATE DATABASE IF NOT EXISTS order_service;
USE order_service;

-- Create Orders table
CREATE TABLE orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_number VARCHAR(50) UNIQUE NOT NULL,
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(255) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    order_status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Order Items table
CREATE TABLE order_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

-- Add indexes
CREATE INDEX idx_customer_email ON orders(customer_email);
CREATE INDEX idx_order_status ON orders(order_status);
CREATE INDEX idx_created_at ON orders(created_at);

-- Insert sample orders
INSERT INTO orders (order_number, customer_name, customer_email, total_amount, order_status) VALUES
('ORD-001', 'John Doe', 'john.doe@email.com', 1299.98, 'DELIVERED'),
('ORD-002', 'Jane Smith', 'jane.smith@email.com', 449.98, 'SHIPPED'),
('ORD-003', 'Bob Wilson', 'bob.wilson@email.com', 179.98, 'PENDING'),
('ORD-004', 'Alice Brown', 'alice.brown@email.com', 1699.97, 'CONFIRMED'),
('ORD-005', 'Charlie Davis', 'charlie.davis@email.com', 399.99, 'DELIVERED');

-- Insert sample order items
INSERT INTO order_items (order_id, product_id, product_name, quantity, unit_price, total_price) VALUES
-- Order 1 items
(1, 1, 'iPhone 13', 1, 999.99, 999.99),
(1, 3, 'Nike Air Max', 1, 299.99, 299.99),

-- Order 2 items
(2, 2, 'Samsung Galaxy S21', 1, 899.99, 899.99),
(2, 6, 'Sony WH-1000XM4', 1, 349.99, 349.99),

-- Order 3 items
(3, 3, 'Nike Air Max', 1, 129.99, 129.99),
(3, 4, 'Levi''s 501', 1, 49.99, 49.99),

-- Order 4 items
(4, 5, 'MacBook Pro', 1, 1299.99, 1299.99),
(4, 6, 'Sony WH-1000XM4', 1, 349.99, 349.99),
(4, 4, 'Levi''s 501', 1, 49.99, 49.99),

-- Order 5 items
(5, 10, 'Apple Watch Series 7', 1, 399.99, 399.99);
