create database Nila;
use Nila;
select * from Nila.dataset;
CREATE TABLE Customers (
    CustomerID VARCHAR(20) PRIMARY KEY,
    Gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(3),
    Dependents VARCHAR(3),
    Tenure INT
);

CREATE TABLE Services (
    CustomerID VARCHAR(20),
    PhoneService VARCHAR(3),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(3),
    OnlineBackup VARCHAR(3),
    DeviceProtection VARCHAR(3),
    TechSupport VARCHAR(3),
    StreamingTV VARCHAR(3),
    StreamingMovies VARCHAR(3),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE Billing (
    CustomerID VARCHAR(20),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(3),
    PaymentMethod VARCHAR(30),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
select * from Billing;
select * from Customers;
select * from Services;

  -- Q1. Find total number of customers. 


SELECT 
    COUNT(*) AS Total_Customers
FROM
    dataset;

 -- Q2. How many customers churned vs not churned?
 
SELECT 
    Churn, COUNT(*) AS Customer_Count
FROM
    dataset
GROUP BY Churn;
 
  -- Q3.  Average tenure of churned vs non-churned customers.
  
    
SELECT Churn, AVG(tenure) AS Avg_Tenure
FROM dataset
GROUP BY Churn;


  -- Q4. Which payment method has highest churn rate?

SELECT 
    PaymentMethod,
    ROUND(SUM(CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS dataset
FROM
    dataset
GROUP BY PaymentMethod
ORDER BY dataset DESC;
  
  
    
    -- Q5. Find top 10 customers by total charges

SELECT 
    customerID, TotalCharges
FROM
billing
ORDER BY TotalCharges DESC;
