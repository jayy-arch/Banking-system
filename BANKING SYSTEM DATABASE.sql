BANKING SYSTEM DATABASE
=========================

CREATE DATABASE BankingSystem;
USE BankingSystem;

 TABLE 1 : CUSTOMERS
 =====================

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone INT,
    address VARCHAR(100)
);

 TABLE 2 : ACCOUNT_TYPES
=========================

CREATE TABLE Account_Types (
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(50) NOT NULL UNIQUE
);

 TABLE 3 : ACCOUNTS
====================

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    type_id INT NOT NULL,
    balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    account_status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',

    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),

    FOREIGN KEY (type_id) REFERENCES Account_Types(type_id)
);

TABLE 4 : TRANSACTIONS
======================

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    transaction_type VARCHAR(20) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

TABLE 5 : BANK_STAFF
====================

CREATE TABLE Bank_Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);


INSERT DATA : ACCOUNT TYPES
============================

INSERT INTO Account_Types (type_name)
VALUES
('Savings'),
('Current'),
('Business'),
('Fixed Deposit'),
('Student');

INSERT DATA : CUSTOMERS
========================

INSERT INTO Customers (first_name, last_name, email, phone, address)
VALUES
('Joshua', 'Ilunga', 'joshua@gmail.com', '0711111111', 'Johannesburg'),
('Sarah', 'Mokoena', 'sarah@gmail.com', '0722222222', 'Pretoria'),
('David', 'Smith', 'david@gmail.com', '0733333333', 'Cape Town'),
('Grace', 'Brown', 'grace@gmail.com', '0744444444', 'Durban'),
('Daniel', 'Nkosi', 'daniel@gmail.com', '0755555555', 'Limpopo');


 INSERT DATA : ACCOUNTS
 ========================

INSERT INTO Accounts (customer_id, type_id, balance, account_status)
VALUES
(1, 1, 5000.00, 'ACTIVE'),
(2, 2, 12000.00, 'ACTIVE'),
(3, 1, 8000.00, 'ACTIVE'),
(4, 3, 15000.00, 'ACTIVE'),
(5, 5, 2500.00, 'ACTIVE');

INSERT DATA : TRANSACTIONS
============================

INSERT INTO Transactions (account_id, transaction_type, amount)
VALUES
(1, 'Deposit', 1000.00),
(1, 'Withdrawal', 500.00),
(2, 'Deposit', 3000.00),
(3, 'Transfer', 2000.00),
(4, 'Withdrawal', 1000.00);

INSERT DATA : BANK STAFF
========================

INSERT INTO Bank_Staff (full_name, position, email)
VALUES
('John Peterson', 'Manager', 'john@bank.com'),
('Lisa White', 'Consultant', 'lisa@bank.com'),
('Michael Green', 'Cashier', 'michael@bank.com'),
('Anna Black', 'Accountant', 'anna@bank.com'),
('Robert King', 'Security', 'robert@bank.com');

SELECT QUERIES
==============

1. View all customers
SELECT * FROM Customers;

2. View all active accounts
SELECT * FROM Accounts
WHERE account_status = 'ACTIVE';

3. View customers with balance above 7000
SELECT * FROM Accounts
WHERE balance > 7000;

4. View all deposits
SELECT * FROM Transactions
WHERE transaction_type = 'Deposit';

5. Join customers and accounts
SELECT Customers.first_name,
       Customers.last_name,
       Accounts.balance
FROM Customers
JOIN Accounts
ON Customers.customer_id = Accounts.customer_id;

UPDATE QUERIES
===============

Update customer phone number
============================
UPDATE Customers
SET phone = '0799999999'
WHERE customer_id = 1;

Update account balance
======================
UPDATE Accounts
SET balance = 6000.00
WHERE account_id = 1;


DELETE QUERIES
===================

Delete a transaction
====================
DELETE FROM Transactions
WHERE transaction_id = 5;

Delete a staff member
=====================
DELETE FROM Bank_Staff
WHERE staff_id = 5;

===========================================================================================