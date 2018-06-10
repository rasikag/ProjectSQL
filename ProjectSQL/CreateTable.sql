
-- follow this naming convention
-- template 
CREATE TABLE TableName(
	ID INT PRIMARY KEY IDENTITY(1,1),
	Name VARCHAR(120) NOT NULL,
	Quantity INT NOT NULL,
	NumericFiledOne DECIMAL(6,2),
	NumericFieldTwo FLOAT(10)
);

-- here identify the IDENTITY and increment value 
-- type: INT 

GO
CREATE TABLE Groceries(
	ID INT PRIMARY KEY IDENTITY(1,1),
	Name VARCHAR(120) NOT NULL,
	Quantity INT NOT NULL,
	
);

GO 
INSERT INTO [Groceries](Name,Quantity) VALUES ('Wholewheatbread',5);


