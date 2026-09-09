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
    created_at DATETIME DEFAULT GETDATE()
);