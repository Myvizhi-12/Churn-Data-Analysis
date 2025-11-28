create database Nila;
use Nila;
SELECT 
    *
FROM
    Billing;
SELECT 
    *
FROM
    Customer;
SELECT 
    *
FROM
    Service;
SELECT 
    *
FROM
    final;
 -- Q1. Find total number of customers. 
SELECT 
    COUNT(*) AS toal_customer
FROM
    customer;
 -- Q2. How many customers churned vs not churned?
 
SELECT 
    Churn, COUNT(*) AS Customer_Count
FROM
    Final
GROUP BY Churn;
 -- Q3.  Average tenure of churned vs non-churned customers.
  
    
SELECT 
    Churn, AVG(tenure) AS Avg_Tenure
FROM
    Final
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
    Final
GROUP BY PaymentMethod
ORDER BY dataset DESC;
  
   -- Q5. Find top 10 customers by total charges

SELECT 
    customerid, TotalCharges
FROM
    billing
ORDER BY TotalCharges DESC
LIMIT 10;