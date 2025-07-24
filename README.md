# 💰 Personal Finance Tracker – SQL Project

A simple yet scalable SQL-based project to manage personal income, expenses, and financial transactions. This project helps users analyze spending habits and maintain financial health using structured queries and optimized data models.

---

## 📌 Features

- Track income and expenses by category and date
- View monthly summaries and balance reports
- Analyze category-wise expenditure
- Use stored procedures for monthly reports
- Scalable table structure following normalization principles

---

## 🛠️ Tech Stack

- **Database**: MySQL / PostgreSQL  
- **SQL**: DDL, DML, DCL, Stored Procedures  
- **Tools Used**: MySQL Workbench / Eclipse IDE  
- **Sample Data**: Imported via CSV

---

## 📂 Database Structure

- `Users` – Stores user details  
- `Accounts` – Manages different bank or cash accounts  
- `Categories` – Expense/income categories  
- `Transactions` – Logs every financial transaction with timestamp and category

---

## ⚙️ Setup Instructions

1. Clone this repository  
2. Import the `personal_finance_tracker.sql` file into your MySQL or PostgreSQL DB  
3. Execute the script to create tables and insert sample data  
4. Run provided queries and procedures to test the functionality

---

## 📊 Sample Queries

```sql
-- Monthly expense report
CALL GetMonthlyExpenses('2025-07', 1);

-- Add a new transaction
CALL AddTransaction(1, 'Food', -500.00, '2025-07-20');
