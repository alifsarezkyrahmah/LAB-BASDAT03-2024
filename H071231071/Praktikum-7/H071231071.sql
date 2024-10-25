USE classicmodels

#No 1
SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice >
(
SELECT AVG(buyPrice) FROM products
)

#No2
SELECT o.orderNumber, o.orderDate
FROM orders o
JOIN customers c
USING(customerNumber)
WHERE c.salesRepEmployeeNumber IN 
(SELECT e.employeeNumber FROM employees e
JOIN offices f
USING (officeCode ) 
WHERE f.city = 'Tokyo');

#no3
SELECT c.customerName, o.orderNumber, 
o.shippedDate, o.requiredDate, 
GROUP_CONCAT(p.productName SEPARATOR ', ') AS product,
SUM(od.quantityOrdered) AS total_quantity_ordered, 
CONCAT(e.firstName, ' ', e.lastName) AS employeeName
FROM customers c
JOIN orders o
USING(customerNumber)
JOIN orderdetails od
USING(orderNumber)
JOIN products p
USING(productCode)
JOIN employees e
ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE o.orderNumber IN 
(
SELECT orderNumber FROM orders
WHERE shippedDate > requiredDate 
);

#no4
SELECT p1.productName, p1.productLine, 
SUM(od1.quantityOrdered) AS total_quantity_Ordered
FROM products p1
JOIN orderdetails od1
USING(productCode)
JOIN orders o
USING (orderNumber)
GROUP BY p1.productName
HAVING p1.productLine IN 
(
SELECT p2.productLine
FROM products p2
JOIN orderdetails od2
USING (productCode)
GROUP BY p2.productLine
HAVING SUM(quantityOrdered) >12000
)
ORDER BY p1.productLine,
total_quantity_Ordered DESC;