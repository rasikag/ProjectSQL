
SELECT AVG(VacationHours)AS 'Average vacation hours',   
    SUM(SickLeaveHours) AS 'Total sick leave hours'  
FROM HumanResources.Employee  
WHERE JobTitle LIKE 'Vice President%';  


-- The following example produces summary values for each sales 
-- territory in the AdventureWorks2012 database. The summary lists 
-- the average bonus received by the sales people in each territory, 
-- and the sum of year-to-date sales for each territory.


SELECT * FROM Sales.SalesPerson;


SELECT TerritoryID, 
	AVG(Bonus) as 'AVG Bonus', 
	SUM(SalesYTD) AS 'Sum of SalesYTD' 
	FROM Sales.SalesPerson 
	GROUP BY TerritoryID;

-- Also we can use distinct key word in AVG 
SELECT AVG(DISTINCT ListPrice)  
FROM Production.Product;


-- OVER example
SELECT * FROM Sales.SalesPerson 


-- as a side note CONVERT function
SELECT CONVERT(varchar(20),SalesYTD,1) AS  SalesYTD 
FROM Sales.SalesPerson


SELECT CONVERT(varchar(20),
		AVG(SalesYTD) OVER 
			(PARTITION BY TerritoryID   
             ORDER BY DATEPART(yy,ModifiedDate)),1) AS MovingAvg FROM Sales.SalesPerson

-- full query with OVER function 
-- break this to part by part

SELECT BusinessEntityID, TerritoryID   
   ,DATEPART(yy,ModifiedDate) AS SalesYear  
   ,CONVERT(varchar(20),SalesYTD,1) AS  SalesYTD  
   ,CONVERT(varchar(20),AVG(SalesYTD) OVER (PARTITION BY TerritoryID   
                                            ORDER BY DATEPART(yy,ModifiedDate)   
                                           ),1) AS MovingAvg  
   ,CONVERT(varchar(20),SUM(SalesYTD) OVER (PARTITION BY TerritoryID   
                                            ORDER BY DATEPART(yy,ModifiedDate)   
                                            ),1) AS CumulativeTotal  
FROM Sales.SalesPerson  
WHERE TerritoryID IS NULL OR TerritoryID < 5  
ORDER BY TerritoryID,SalesYear; 


-- full query without OVER function 
-- break this to part by part 
SELECT BusinessEntityID, TerritoryID   
   ,DATEPART(yy,ModifiedDate) AS SalesYear  
   ,CONVERT(varchar(20),SalesYTD,1) AS  SalesYTD  
   ,CONVERT(varchar(20),AVG(SalesYTD) OVER (ORDER BY DATEPART(yy,ModifiedDate)   
                                            ),1) AS MovingAvg  
   ,CONVERT(varchar(20),SUM(SalesYTD) OVER (ORDER BY DATEPART(yy,ModifiedDate)   
                                            ),1) AS CumulativeTotal  
FROM Sales.SalesPerson  
WHERE TerritoryID IS NULL OR TerritoryID < 5  
ORDER BY SalesYear;



