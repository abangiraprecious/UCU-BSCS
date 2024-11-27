# Uganda Commercial Bank Database Design

## Question One

### a) Identify the entities and attributes that should be included in the database system.

**Entities:**

1. **Customer**
   - CustomerID (Primary Key)
   - FirstName
   - LastName
   - Address
   - PhoneNumber
   - Email

2. **Account**
   - AccountID (Primary Key)
   - AccountType (e.g., Savings, Current, Fixed Deposit)
   - BranchID (Foreign Key)
   - CustomerID (Foreign Key)
   - Balance

3. **Branch**
   - BranchID (Primary Key)
   - BranchName
   - BranchAddress

4. **Loan**
   - LoanID (Primary Key)
   - LoanType (e.g., Personal, Home, Car)
   - Terms
   - InterestRate
   - CustomerID (Foreign Key)

5. **Transaction**
   - TransactionID (Primary Key)
   - TransactionType (e.g., Deposit, Withdrawal)
   - Amount
   - Date
   - AccountID (Foreign Key)
   - BranchID (Foreign Key)

6. **LoanRepayment**
   - RepaymentID (Primary Key)
   - LoanID (Foreign Key)
   - PaymentDate
   - PaymentAmount
   - FromAccountID (Foreign Key)

### b) Draw an Entity-Relationship Diagram (ERD) for this database.

Here’s a description of the ERD:

- **Customer** to **Account**: One-to-Many (One customer can have multiple accounts).
- **Customer** to **Loan**: One-to-Many (One customer can have multiple loans).
- **Account** to **Transaction**: One-to-Many (One account can have multiple transactions).
- **Branch** to **Account**: One-to-Many (One branch can have multiple accounts).
- **Branch** to **Transaction**: One-to-Many (One branch can have multiple transactions).
- **Loan** to **LoanRepayment**: One-to-Many (One loan can have multiple repayments).
- **Account** to **LoanRepayment**: One-to-Many (One account can make multiple repayments).

### c) Write the SQL DDL statements to create the tables in the ERD above with specific constraints.

```sql
-- Creating the Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(50)
);

-- Creating the Branch Table
CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(50),
    BranchAddress VARCHAR(100)
);

-- Creating the Account Table
CREATE TABLE Account (
    AccountID INT PRIMARY KEY,
    AccountType VARCHAR(20),
    BranchID INT,
    CustomerID INT,
    Balance DECIMAL(10, 2) CHECK (Balance >= 0),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Creating the Loan Table
CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    LoanType VARCHAR(20),
    Terms VARCHAR(100),
    InterestRate DECIMAL(5, 2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    UNIQUE (CustomerID, LoanType) -- Ensuring a customer cannot apply for two loans of the same type
);

-- Creating the Transaction Table
CREATE TABLE Transaction (
    TransactionID INT PRIMARY KEY,
    TransactionType VARCHAR(10),
    Amount DECIMAL(10, 2),
    Date DATE,
    AccountID INT,
    BranchID INT,
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

-- Creating the LoanRepayment Table
CREATE TABLE LoanRepayment (
    RepaymentID INT PRIMARY KEY,
    LoanID INT,
    PaymentDate DATE,
    PaymentAmount DECIMAL(10, 2),
    FromAccountID INT,
    FOREIGN KEY (LoanID) REFERENCES Loan(LoanID),
    FOREIGN KEY (FromAccountID) REFERENCES Account(AccountID)
);


