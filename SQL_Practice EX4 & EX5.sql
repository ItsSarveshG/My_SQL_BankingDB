Create database SQL_Practise;
show databases;
use SQL_Practise;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) );
    
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID) );
    
CREATE TABLE Branches (
	BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches (
    AccountID INT,
    BranchID INT,
    AssignmentDate DATE,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

ALTER TABLE Customers
ADD DateOfBirth DATE;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

DROP TABLE AccountBranches;

INSERT INTO Customers 
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
VALUES
(101, 'Rahul', 'Sharma', 'rahul@gmail.com', '9999999999', '2025-05-01', '2001-04-15'),

(102, 'Priya', 'Patil', 'priya.patil@gmail.com', '9988776655', '2025-05-03', '2000-09-20'),

(103, 'Amit', 'Kulkarni', 'amit.k@gmail.com', '9876543210', '2025-05-05', '1999-12-11'),

(104, 'Sneha', 'More', 'sneha.more@gmail.com', '9898989899', '2025-05-07', '2002-02-14'),

(105, 'Rohan', 'Pawar', 'rohanp@gmail.com', '9765432109', '2025-05-08', '2001-11-05'),

(106, 'Sakshi', 'Mhatre', 'sakshi@yahoo.com', '9123456789', '2025-05-09', '2003-06-25'),

(107, 'Aniket', 'Sawant', 'aniket@gmail.com', '9012345678', '2025-05-10', '1998-08-19'),

(108, 'Meera', 'Patkar', 'meera@gmail.com', '9876501234', '2025-05-11', '2000-03-30');

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201, 101, 'Savings', 25000.00),

(202, 102, 'Current', 40000.00),

(203, 103, 'Salary', 30000.00),

(204, 104, 'Savings', 15000.00),

(205, 105, 'Current', 55000.00),

(206, 106, 'Salary', 22000.00),

(207, 107, 'Savings', 80000.00),

(208, 108, 'Current', 12000.00);

INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-05-01', 5000.00, 'Deposit'),

(302, 201, '2025-05-02', 2000.00, 'Withdrawal'),

(303, 202, '2025-05-03', 8000.00, 'Deposit'),

(304, 202, '2025-05-04', 3000.00, 'Transfer'),

(305, 201, '2025-05-05', 7000.00, 'Deposit'),

(306, 206, '2025-05-16', 4000.00, 'Payment'),

(307, 207, '2025-05-17', 30000.00, 'Deposit'),

(308, 208, '2025-05-18', 9000.00, 'Withdrawal'),

(309, 201, '2025-05-19', 6000.00, 'Deposit'),

(310, 202, '2025-05-20', 11000.00, 'Payment');

#Account Branches
INSERT INTO AccountBranches
(AccountID, BranchID, AssignmentDate)
VALUES
(201, 401, '2025-05-01'),
(201, 402, '2025-05-02');



UPDATE Customers
SET Phone = '9999999999'
WHERE CustomerID = 101;

UPDATE Customers
SET Phone = '9999999999'
WHERE CustomerID = 101;

UPDATE Customers
SET Phone = '9999999999'
WHERE CustomerID = 101;

SELECT * FROM Customers
WHERE CustomerID = 102;

DELETE FROM Transactions
WHERE TransactionID = 302;

SELECT * FROM Transactions;

DELETE FROM Accounts
WHERE AccountID = 202;

SELECT * FROM Accounts;

#Transactions
INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-06-01', '5000', 'Credit'),
(302, 202, '2025-06-02', '2000', 'Debit');


# VIEW All DATA
SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM AccountBranches;
SELECT * FROM branches;
SELECT * FROM transactions;
SELECT * FROM loans;


SELECT * FROM transactions WHERE Amount>1500;

SELECT FirstName, LastName, Email, Phone
FROM Customers;


SELECT *
FROM Accounts
WHERE AccountType = 'Savings';


SELECT *
FROM Accounts
WHERE Balance > 25000;


SELECT *
FROM Transactions
WHERE Amount BETWEEN 5000 AND 20000;


SELECT *
FROM Customers
WHERE CustomerID IN (101,102,103);


SELECT *
FROM Customers
WHERE FirstName LIKE 'R%';

SELECT *
FROM Transactions;
SELECT *
FROM Transactions
LIMIT 5 OFFSET 2;

# Retrieve Customers with Savings Accounts
SELECT * FROM Accounts WHERE AccountType = 'Savings';

# Retrieve Accounts with Balance Greater Than 25000
SELECT * FROM Accounts WHERE Balance > 25000;

# Retrieve Transactions Between Specific Amounts
SELECT * FROM Transactions WHERE Amount BETWEEN 5000 AND 20000;

# Retrieve Records for Selected Customers
SELECT * FROM Customers WHERE CustomerID IN (101,102,103);

# Search Customers Using Partial Name Matching
SELECT * FROM Customers WHERE FirstName LIKE 'R%';

# Display Customers in Alphabetical Order
SELECT * FROM Customers ORDER BY FirstName ASC;

# Display Accounts with Highest Balance First
SELECT * FROM Accounts ORDER BY Balance DESC;

# Retrieve Unique Account Types
SELECT DISTINCT AccountType FROM Accounts;

# Display Top 3 Highest Balance Accounts
SELECT * FROM Accounts ORDER BY Balance DESC LIMIT 3;

# Skip Initial Records While Viewing Transactions
SELECT * FROM Transactions LIMIT 5 OFFSET 2;

# Find Customers Without Phone Numbers
SELECT * FROM Customers WHERE Phone IS NULL;

# Find Customers Having Email Addresses
SELECT * FROM Customers WHERE Email IS NOT NULL;

# Categorize Accounts Using Balance
SELECT AccountID,
       Balance,
       CASE
           WHEN Balance >= 50000 THEN 'Premium Account'
           WHEN Balance >= 25000 THEN 'Standard Account'
           ELSE 'Basic Account'
       END AS AccountCategory
FROM Accounts;


# Assign Rank Based on Account Balance
SELECT AccountID,
       Balance,
       RANK() OVER (ORDER BY Balance DESC) AS BalanceRank
FROM Accounts;


# Calculate Running Total of Transactions
SELECT TransactionID,
       Amount, TransactionDate,
       SUM(Amount) OVER (ORDER BY TransactionDate) AS RunningTotal
FROM Transactions;

SELECT TransactionID,
       Amount, TransactionDate,
       Avg(Amount) OVER (ORDER BY TransactionDate) AS RunningTotal
FROM Transactions;

SELECT * FROM Transactions ORDER BY transactionDate;


# Display Average Transaction Amount
SELECT TransactionID,
       Amount,
       AVG(Amount) OVER () AS AverageTransaction
FROM Transactions;


# Search Customers Whose First Name Starts with “A”
SELECT *
FROM Customers
WHERE FirstName LIKE 'A%';

# Search Customers Whose Email Contains “gmail”
SELECT *
FROM Customers
WHERE Email LIKE '%gmail%';

# Search Customers Whose Last Name Ends with “kar”
SELECT *
FROM Customers
WHERE LastName LIKE '%kar';

# Retrieve Records for Selected Account Types
SELECT *
FROM Accounts
WHERE AccountType IN ('Savings', 'Current');

# Retrieve Transactions for Selected Transaction Types
SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit', 'Withdrawal');

# Retrieve Records for Selected Customers
SELECT *
FROM Customers
WHERE CustomerID IN (101,102,105);

# Display Customers in Ascending Order of Last Name
SELECT * FROM Customers ORDER BY LastName ASC;

# Display Accounts with Highest Balance First
SELECT * FROM Accounts ORDER BY Balance DESC;

# Display Transactions Sorted by Transaction Date
SELECT * FROM Transactions ORDER BY TransactionDate DESC;

# Display Only Top 5 Highest Balance Accounts
SELECT * FROM Accounts ORDER BY Balance DESC LIMIT 5;

# Display First 3 Customer Records
SELECT * FROM Customers LIMIT 3;

# Skip Initial Transaction Records While Viewing Data
SELECT * FROM Transactions LIMIT 5 OFFSET 3;

# Display Savings Account Customers Sorted by Balance
SELECT *
FROM Accounts
WHERE AccountType = 'Savings'
ORDER BY Balance DESC;

# Search Customers Using Partial Name and Limit Results
SELECT *
FROM Customers
WHERE FirstName LIKE 'S%'
LIMIT 5;

# Display Selected Transactions in Sorted Order
SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit','Withdrawal')
ORDER BY TransactionDate DESC;

SELECT * FROM Customers;

INSERT INTO Customers 
(CustomerID, FirstName, LastName, Email, AccountCreationDate, DateOfBirth)
VALUES
(109, 'Rahl', 'Aharma', 'rahl@femail.com', '2025-02-11', '2001-02-03');

SELECT * FROM Customers WHERE LastName is NULL;
