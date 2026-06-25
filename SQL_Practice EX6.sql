# Calculate the total balance maintained across all customer accounts
SELECT SUM(Balance) AS Total_Balance
FROM Accounts;

# Calculate the total balance maintained across specific accounts
SELECT SUM(Balance) AS Total_Balance
FROM Accounts WHERE AccountType = 'Savings';

SELECT SUM(Balance) AS Total_Balance
FROM Accounts WHERE AccountType = 'Current';

SELECT SUM(Balance) AS Total_Balance
FROM Accounts WHERE AccountType = 'Salary';

# Calculate the average balance maintained across all customer accounts
SELECT AVG(Balance) AS Average_Balance
FROM Accounts;

# Identify the highest balance maintained in any customer account
SELECT MAX(Balance) AS Highest_Balance
FROM Accounts;

# Identify the Lowest balance maintained in any customer account
SELECT MIN(Balance) AS Lowest_Balance
FROM Accounts;

# Determine the total number of customer accounts available in the system
SELECT COUNT(*) AS total_accounts
FROM Customers;

SELECT COUNT(Phone) AS total_accounts
FROM Customers;


# Determine the total balance using 'GroupBy'
SELECT AccountType, SUM(Balance) AS Total_Balance
FROM Accounts GROUP BY AccountType;

# Having 
SELECT AccountType, SUM(Balance) AS Total_Balance
FROM Accounts Group By AccountType Having SUM(Balance) > 100000;




