use AdventureWorks2012

SELECT Quantity FROM Production.ProductInventory; 

-- query template
SELECT CHECKSUM_AGG(CAST(Quantity AS int))  
FROM Production.ProductInventory;  
GO  


UPDATE Production.ProductInventory   
SET Quantity=1000 
WHERE Quantity=512;

SELECT CHECKSUM_AGG(CAST(Quantity AS int))  
FROM Production.ProductInventory; 

