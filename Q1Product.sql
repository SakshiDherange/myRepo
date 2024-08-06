--a) Create the Product Table

CREATE TABLE Product (
    productid INT PRIMARY KEY,
    productname VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2)
);

--b) Create the Purchases Table

CREATE TABLE Purchases (
    purchaseid INT PRIMARY KEY,
    productid INT,
    number_of_items INT,
    date_of_purchase DATE,
    FOREIGN KEY (productid) REFERENCES Product(productid)
);
--c) Insert, Update, and Delete Rows
--Insert Rows: To insert a row into the Product table:

INSERT INTO Product (productid, productname, description, price)
VALUES (1, 'Pen', 'Ballpoint pen', 1.50);

--To insert a row into the Purchases table:
INSERT INTO Purchases (purchaseid, productid, number_of_items, date_of_purchase)
VALUES (1, 1, 10, '2024-08-06');

--Update Rows: To update a row in the Product table:

UPDATE Product
SET price = 2.00
WHERE productid = 1;
To update a row in the Purchases table:

UPDATE Purchases
SET number_of_items = 15
WHERE purchaseid = 1;

--Delete Rows:To delete a row from the Product table:

DELETE FROM Product
WHERE productid = 1;
To delete a row from the Purchases table:

DELETE FROM Purchases
WHERE purchaseid = 1;
--d) SQL Queries
--List of All Products

SELECT * FROM Product;

--List of All Products with Price Less Than 100

SELECT * FROM Product
WHERE price < 100;
--List All Purchases with Product Name Starting with "P"
--To get this result, you need to join the Product and Purchases tables and filter by productname:

SELECT p.*
FROM Purchases pu
JOIN Product p ON pu.productid = p.productid
WHERE p.productname LIKE 'P%';

--List of All Purchaseid, Productid, Product Name, Price, and Number of Items
SELECT pu.purchaseid, pu.productid, p.productname, p.price, pu.number_of_items
FROM Purchases pu
JOIN Product p ON pu.productid = p.productid;

--List of All Purchase IDs Where Price is Less Than 100

SELECT pu.purchaseid
FROM Purchases pu
JOIN Product p ON pu.productid = p.productid
WHERE p.price < 100;

--List of All Purchase IDs Where Product Name is "Pen"

SELECT pu.purchaseid
FROM Purchases pu
JOIN Product p ON pu.productid = p.productid
WHERE p.productname = 'Pen';