SELECT*
FROM [Churn Modelling]
--Total customer
SELECT COUNT (CustomerId) as Total_Customer_Churned
FROM [Churn Modelling]
--Exited members
SELECT SUM (Exited) as Exited_Members
FROM [Churn Modelling]
--Active members
SELECT SUM (IsActiveMember) as Active_Members
FROM [Churn Modelling]
--Credit card holders
SELECT SUM (HasCrCard) as CrCard_Holders
FROM [Churn Modelling]
--Churn  rate
SELECT CAST (SUM (Exited) AS decimal)*100/
(SELECT CAST(COUNT (CustomerId) AS decimal)) AS Churn_Rate
FROM [Churn Modelling]
--Churned customers by age band
SELECT
  CASE
    WHEN Age <= 20 THEN '18-20'
	WHEN Age <= 30 THEN '21-30'
	WHEN Age <= 40 THEN '31-40'
	WHEN Age <= 50 THEN '41-50'
	WHEN Age <= 60 THEN '51-60'
	WHEN Age <= 70 THEN '61-70'
	ELSE '71-80'
  END as Age_Band,
COUNT (CustomerId) as Total_Customer_Churned
FROM [Churn Modelling]
WHERE Exited='1'
GROUP BY
  CASE
    WHEN Age <= 20 THEN '18-20'
	WHEN Age <= 30 THEN '21-30'
	WHEN Age <= 40 THEN '31-40'
	WHEN Age <= 50 THEN '41-50'
	WHEN Age <= 60 THEN '51-60'
	WHEN Age <= 70 THEN '61-70'
	ELSE '71-80'
 END
 ORDER BY Total_Customer_Churned DESC
--Active Churned customer
SELECT
  CASE
    WHEN IsActiveMember = 1 THEN 'Active'
	ELSE 'Not Active'
	END AS Active_Member,
COUNT(CustomerId) as Total_Customer_Churned
FROM [Churn Modelling]
WHERE Exited='1' 
GROUP BY
CASE
    WHEN IsActiveMember = 1 THEN 'Active'
	ELSE 'Not Active'
	END
--Churned by Geography
SELECT Geography, COUNT(CustomerId) as Total_Customer_Churned
FROM [Churn Modelling]
where Exited = '1'
GROUP BY Geography
--Churned by gender
SELECT Gender, COUNT(CustomerId) as Total_Customer_Churned
FROM [Churn Modelling]
where Exited = '1'
GROUP BY Gender
--Churned by crcard holders
SELECT
  CASE
    WHEN HasCrCard = 1 THEN 'Yes'
	ELSE 'No'
	END AS CrCard_Holder,
COUNT(CustomerId) as Total_Customer_Churned
FROM [Churn Modelling]
WHERE Exited='1' 
GROUP BY
CASE
     WHEN HasCrCard = 1 THEN 'Yes'
	ELSE 'No'
	END
--Churned by Tenure
SELECT Tenure, COUNT(CustomerId) as Total_Customer_Churned
FROM [Churn Modelling]
where Exited = '1'
GROUP BY Tenure
ORDER BY Total_Customer_Churned Desc