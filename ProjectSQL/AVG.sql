GO;
SELECT AVG(VacationHours)AS 'Average vacation hours',   
    SUM(SickLeaveHours) AS 'Total sick leave hours'  
FROM HumanResources.Employee  
WHERE JobTitle LIKE 'Vice President%';  
GO;

-- The following example produces summary values for each sales 
-- territory in the AdventureWorks2012 database. The summary lists 
-- the average bonus received by the sales people in each territory, 
-- and the sum of year-to-date sales for each territory.

GO
SELECT * FROM Sales.SalesPerson;

GO
SELECT TerritoryID, 
	AVG(Bonus) as 'AVG Bonus', 
	SUM(SalesYTD) AS 'Sum of SalesYTD' 
	FROM Sales.SalesPerson 
	GROUP BY TerritoryID;

-- Also we can use distinct key word in AVG 
SELECT AVG(DISTINCT ListPrice)  
FROM Production.Product;