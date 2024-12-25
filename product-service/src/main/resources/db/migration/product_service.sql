-- Product Service Database
CREATE DATABASE IF NOT EXISTS product_service;
USE product_service;

-- Create Products table
CREATE TABLE products (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT,
    category VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Add indexes
CREATE INDEX idx_category ON products(category);
CREATE INDEX idx_price ON products(price);

-- Insert sample products
INSERT INTO products (name, description, price, stock_quantity, category) VALUES
('iPhone 13', 'Apple iPhone 13 128GB', 999.99, 50, 'Electronics'),
('Samsung Galaxy S21', 'Samsung Galaxy S21 5G', 899.99, 45, 'Electronics'),
('Nike Air Max', 'Running shoes', 129.99, 100, 'Footwear'),
('Levi''s 501', 'Classic fit jeans', 59.99, 200, 'Clothing'),
('MacBook Pro', '13-inch MacBook Pro M1', 1299.99, 30, 'Electronics'),
('Sony WH-1000XM4', 'Wireless Noise Cancelling Headphones', 349.99, 40, 'Electronics'),
('Amazon Echo Dot', 'Smart speaker with Alexa', 49.99, 150, 'Smart Home'),
('Nintendo Switch', 'Gaming console', 299.99, 60, 'Gaming'),
('Kindle Paperwhite', 'E-reader', 139.99, 75, 'Electronics'),
('Apple Watch Series 7', 'Smartwatch', 399.99, 55, 'Electronics');
