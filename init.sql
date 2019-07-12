DROP TABLE IF EXISTS Customer CASCADE;
DROP TABLE IF EXISTS Orders CASCADE;
DROP TABLE IF EXISTS Product CASCADE;
DROP TABLE IF EXISTS Order_Detail CASCADE;



CREATE TABLE Customer(
  CustomerID SERIAL PRIMARY KEY, 
  CompanyName VARCHAR(40), 
  ContactName VARCHAR(20),
  ContactTitle VARCHAR(40),
  Address VARCHAR(50),
  City VARCHAR(20),
  Region VARCHAR(15),
  PostalCode VARCHAR(10),
  Country VARCHAR(20),
  Phone VARCHAR(25),
  Fax VARCHAR(30));
               
               
CREATE TABLE Orders(
  OrderID SERIAL PRIMARY KEY,
  CustomerID SERIAL,
  EmployeeID SERIAL,
  OrderDate DATE,
  RequiredDate DATE NOT NULL, 
  ShippedDate DATE,
  ShipVia VARCHAR(50),
  Freight VARCHAR(80),
  ShipName VARCHAR(40),
  ShipAddress VARCHAR(40),
  ShipCity VARCHAR(40),
  ShipRegion VARCHAR(20),
  ShipPostalCode VARCHAR(16),
  ShipCountry VARCHAR(30),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID));
                                                
   
CREATE TABLE Product(
  ProductID SERIAL PRIMARY KEY,
  ProductName VARCHAR(30),
  SupplierID SERIAL,
  CategoryID SERIAL,
  QuantityPerUnit VARCHAR(3),
  UnitPrice VARCHAR(7),
  UnitsInStock VARCHAR(5),
  UnitsOnOrder VARCHAR(5),
  ReorderLevel VARCHAR(10),
  Discontinued VARCHAR(3) CHECK(Discontinued = 'yes'));
                                                
CREATE TABLE Order_Detail(
  OrderID SERIAL PRIMARY KEY,
  ProductID SERIAL,
  UnitPrice INT,
  Quantity VARCHAR(5),
  Discount INT CHECK(UnitPrice > Discount),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID));                                           
                                             
INSERT INTO Product(ProductName, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES ('Book', 500, 300, 21, 200, 7, 'yes');
                                             
INSERT INTO Product(ProductName, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES ('Rollerblade', 5, 600, 21, 20, 7, 'yes');
                                             
INSERT INTO Product(ProductName, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES ('Poster', 500, 150, 21, 100, 7, 'yes');

INSERT INTO Customer (CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES ('RockStar', 'John', 'Something', 'Weird st. 49', 'Windhelm', 'Skyrim', 3422, 'Melromarc', 06707000000, 'élkaf-fjfh-jfd');
                                             
INSERT INTO Customer (CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES ('Studio Ghibli', 'Jo-jo', 'Taihen', 'Nakamura touri', 'Asakusa', 'Nihon', 3422, 'Kami no Machi', 06707088000, 'fad-fjfh-jfd');
                                             
INSERT INTO Orders(OrderDate,RequiredDate,ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPostalCode,ShipCountry)
VALUES ('2010-08-24', '2011-09-21', '2010-09-04','mail','Freight','Going-Merry','Home','Miskolc','cost cst',4055,'Lek-város'); 

INSERT INTO Order_Detail(UnitPrice,Quantity,Discount)                                           
VALUES(100000, 10, 3000);   
                                             
INSERT INTO Order_Detail(UnitPrice,Quantity,Discount)                                           
VALUES(70000, 5, 1000);  
