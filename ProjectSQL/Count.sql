use AdventureWorks2012

-- template 
-- COUNT(ColumnName) 
-- this will return an int 

-- template and example 
SELECT COUNT(DISTINCT Title)  
FROM HumanResources.Employee;  
GO  

SELECT COUNT(*)  
FROM HumanResources.Employee;  
GO 