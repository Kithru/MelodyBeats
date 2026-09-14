CREATE DATABASE MelodyBeats;
SELECT name FROM sys.databases WHERE name = 'MelodyBeats';

USE MelodyBeats;

CREATE TABLE users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_no VARCHAR(20) NOT NULL,
    address VARCHAR(255),
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    user_type VARCHAR(20) NOT NULL DEFAULT 'USER',
    created_at DATETIME NOT NULL DEFAULT GETDATE(),
    updated_at DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE TABLE music_items (
    item_id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    artist VARCHAR(150) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    format VARCHAR(30) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    release_year INT NULL,
    description VARCHAR(500) NULL,
    is_active BIT NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL DEFAULT GETDATE(),
    updated_at DATETIME NULL
);

CREATE TABLE sales_orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    sales_assistant_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    subtotal DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    tax_amount DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    total_amount DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    payment_method ENUM('Cash', 'Card', 'Digital Wallet') NOT NULL,
    order_status ENUM('Completed', 'Refunded', 'Cancelled') DEFAULT 'Completed',
    FOREIGN KEY (sales_assistant_id) REFERENCES users(user_id)
);

CREATE TABLE sales_order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10, 2) NOT NULL,
    item_subtotal DECIMAL(10, 2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    FOREIGN KEY (order_id) REFERENCES sales_orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);