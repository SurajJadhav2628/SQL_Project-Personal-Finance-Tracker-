-- Personal Finance Tracker SQL Project

-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS PersonalFinance;
USE PersonalFinance;

-- Step 2: Create Tables

-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

-- Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50)
);

-- Income Table
CREATE TABLE Income (
    income_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    source VARCHAR(100),
    amount DECIMAL(10,2),
    income_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Expenses Table
CREATE TABLE Expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    category_id INT,
    description VARCHAR(100),
    amount DECIMAL(10,2),
    expense_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Step 3: Insert Sample Data

-- Insert into Users
INSERT INTO Users (name, email) VALUES
('Suraj Jadhav', 'suraj@example.com');

-- Insert into Categories
INSERT INTO Categories (category_name) VALUES
('Rent'), ('Food'), ('Travel'), ('Utilities'), ('Shopping'), ('Others');

-- Insert into Income
INSERT INTO Income (user_id, source, amount, income_date) VALUES
(1, 'Salary', 50000, '2025-06-01'),
(1, 'Freelance', 8000, '2025-06-15');

-- Insert into Expenses
INSERT INTO Expenses (user_id, category_id, description, amount, expense_date) VALUES
(1, 1, 'June Rent', 12000, '2025-06-01'),
(1, 2, 'Groceries', 3500, '2025-06-05'),
(1, 3, 'Cab to Office', 800, '2025-06-10'),
(1, 4, 'Electricity Bill', 1500, '2025-06-12'),
(1, 5, 'Online Shopping', 2200, '2025-06-18');

-- Step 4: Create Views and Reports

-- View: Monthly Income and Expense Summary
CREATE VIEW MonthlySummary AS
SELECT 
    u.name,
    MONTH(e.expense_date) AS month,
    SUM(i.amount) AS total_income,
    SUM(e.amount) AS total_expense,
    (SUM(i.amount) - SUM(e.amount)) AS balance
FROM Users u
LEFT JOIN Income i ON u.user_id = i.user_id AND MONTH(i.income_date) = 6
LEFT JOIN Expenses e ON u.user_id = e.user_id AND MONTH(e.expense_date) = 6
GROUP BY u.name, MONTH(e.expense_date);

-- View: Category-wise Expense Report
CREATE VIEW CategoryExpenseReport AS
SELECT 
    u.name,
    c.category_name,
    SUM(e.amount) AS total_spent
FROM Expenses e
JOIN Users u ON e.user_id = u.user_id
JOIN Categories c ON e.category_id = c.category_id
GROUP BY u.name, c.category_name;

-- Step 5: Sample Queries

-- Total income
SELECT SUM(amount) AS total_income FROM Income WHERE user_id = 1;

-- Total expenses
SELECT SUM(amount) AS total_expense FROM Expenses WHERE user_id = 1;

-- Category-wise spending
SELECT c.category_name, SUM(e.amount) AS total_spent
FROM Expenses e
JOIN Categories c ON e.category_id = c.category_id
WHERE e.user_id = 1
GROUP BY c.category_name;

-- View summaries
SELECT * FROM MonthlySummary;
SELECT * FROM CategoryExpenseReport;
