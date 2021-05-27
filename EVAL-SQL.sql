-- EVAL01 - SQL

-- 1  - Liste des contacts Français

SELECT CompanyName, ContactName, ContactTitle, Phone
FROM Customers
WHERE country = 'France'

-- 2  - Produits vendus par le fournisseurs "Exotic Liquids"

SELECT ProductName AS 'Produit', UnitPrice AS 'Prix' 
FROM Products, Suppliers
WHERE Products.SupplierID = Suppliers.SupplierID
AND CompanyName = 'Exotic Liquids' 

-- 3  - Nombre de produits vendus par les fournisseurs Français dans l'ordre décroissant

SELECT CompanyName AS 'Fournisseurs', COUNT(ProductID) AS 'Nombre de produits'
FROM Suppliers, Products 
WHERE Suppliers.SupplierID = Products.SupplierID
AND Country = 'France'
GROUP BY CompanyName 
ORDER BY COUNT(ProductID) DESC


-- 4  - Liste des clients Français ayant plus de 10 commandes 

SELECT CompanyName AS 'Client', COUNT(OrderID) AS 'Nombre de commandes'
FROM Orders, Customers 
WHERE Orders.CustomerID = Customers.CustomerID
AND Country = 'France'
GROUP BY CompanyName
HAVING COUNT(OrderID) > 10



-- 5  - Liste des clients ayant un chiffre d'affaires > 30.000

SELECT CompanyName AS 'Client', SUM(Quantity * UnitPrice) AS 'CA', Country AS 'Pays'
FROM `Order Details`, Customers, Orders 
WHERE `Order Details`.`OrderID` = Orders.OrderID
AND Orders.CustomerID = Customers.CustomerID
GROUP BY CompanyName, Country
HAVING CA > 30000
ORDER BY CA DESC 


-- 6  - Liste des pays dont les clients ont passé commande de produits fourni par "Exotic Liquids"

SELECT Customers.Country AS 'Pays'
FROM Customers, Orders, `Order Details`, Products, Suppliers 
WHERE Customers.CustomerID = Orders.CustomerID
AND Orders.OrderID = `Order Details`.`OrderID`
AND `Order Details`.`ProductID` = Products.ProductID
AND Products.SupplierID = Suppliers.SupplierID
AND Suppliers.CompanyName = 'Exotic Liquids'
GROUP BY Customers.Country 

-- 7  - Montant des ventes de 1997

SELECT SUM(UnitPrice * Quantity) AS "Montant Ventes 97"
FROM `order details`,orders
WHERE `order details`.OrderID = orders.OrderID
AND YEAR(OrderDate) = '1997';


-- 8  - Montant des ventes de 1997 mois par mois

SELECT Month(OrderDate), SUM(UnitPrice * Quantity) AS "Montant Ventes 97"
FROM `order details`,orders
WHERE `order details`.OrderID = orders.OrderID
AND YEAR(OrderDate) = '1997'
GROUP BY Month(OrderDate);


-- 9  - Depuis quelle date le client "Du monde entier" n'a plus commandé

SELECT MAX(OrderDate) AS "Date de dernière commande"
FROM customers, orders
WHERE CompanyName = "Du monde entier"
AND customers.CustomerID = orders.CustomerID;


-- 10 - Quel est le délai moyen de livraison en jours ? 

SELECT ROUND(AVG(DATEDIFF(ShippedDate, OrderDate))) AS "Délai moyen de livraison"
FROM orders;