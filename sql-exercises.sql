1. Return all category names with their descriptions from the Categories table.

SELECT CategoryName
FROM Categories

2.Return the contact name, customer id, and company name of all Customers in London

SELECT ContactName, CustomerID, CompanyName 
FROM Customers
WHERE Country = 'London'

3. Return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number

SELECT *
FROM Suppliers
WHERE ContactTitle in ('marketing manager', 'sale representative') AND FAX IS NOT NULL

4. Return a list of customer ids from the Orders table with required dates between Jan 1, 1997 and Jan 1, 1998 and with freight under 100 units

SELECT CustomerID
FROM Orders
WHERE RequiredDate BETWEEN '1997-1-1' AND '1998-1-1' AND Freight < 100 

5. Return a list of company names and contact names of all the Owners from the Customer t

SELECT CompanyName, ContactName
FROM Customers 
WHERE ContactTitle = 'Owner' AND  Country IN ('Mexico', 'Sweden', 'Germany')

6. Return a count of the number of discontinued products in the Products table.

SELECT COUNT (Discontinued)
FROM Products

7. Return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.

SELECT CategoryName, Description
FROM Categories 
WHERE CategoryName like 'Co%'

8. Return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should ordered alphabetically by company name.

SELECT CompanyName, City, Country, PostalCode, Address
FROM Suppliers
WHERE Address LIKE '%rue%'
ORDER BY CompanyName

9. Return the product id and the total quantities ordered for each product id in the Order Details table.

SELECT DISTINCT ProductID, Quantity
FROM [Order Details]

10. Return the customer name and customer address of all customers with orders that shipped using Speedy Express.

SELECT CompanyName, Address
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE ShipVia = 1

11. Return a list of Suppliers containing company name, contact name, contact title and region description.

SELECT CompanyName, ContactName, ContactTitle, Region
FROM Suppliers
WHERE Region IS NOT NULL

12. Return all product names from the Products table that are condiments.

SELECT ProductName
FROM Products
WHERE CategoryID = 2

13. Return a list of customer names who have no orders in the Orders table.

SELECT ContactName
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.CustomerID IS NULL

14. Add a shipper named 'Amazon' to the Shippers table using SQL.

insert into Shippers(CompanyName)
values ('Amazon')

15. Change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.

UPDATE Shippers
SET CompanyName = ('Amazon Prime Shipping')
WHERE CompanyName = ('Amazon')

16. Return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.

SELECT Shippers.CompanyName, FORMAT(ROUND(SUM(Orders.Freight),0),'C') as FreigthTotals
FROM Shippers
LEFT JOIN Orders
ON Shippers.ShipperID = Orders.ShipVia
GROUP BY CompanyName

17. Return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'.

SELECT LastName + ',' + FirstName AS DisplayName
FROM Employees

18. Add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread.

INSERT INTO Customers(CustomerID, CompanyName, ContactName)
VALUES ('9999' , 'Abanto Industries' , 'John Abanto')
INSERT INTO Orders(CustomerID, ShipName)
VALUES ('9999' , 'Grandmas Boysenberry Spread')

19. Remove yourself and your order from the database.

DELETE FROM Customers
WHERE CustomerID = '9999'
DELETE FROM Orders
WHERE CustomerID = '9999'

20. Return a list of products from the Products table along with the total units in stock for each product. Include only products with TotalUnits greater than 100.

SELECT ProductName, UnitsInStock + UnitsOnOrder AS TotalUnits
FROM Products
WHERE UnitsInStock > 100