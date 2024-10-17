USE classicmodels;


#NO 1
SELECT c.customerName,
CONCAT(e.firstName, ' ',e.lastName) AS salesRep,
c.creditLimit- SUM(p.amount) AS remainingCredit
FROM employees e
JOIN customers c
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN payments p
USING (customerNumber)
GROUP BY c.customerName
HAVING remainingCredit > 0;

#No 2
SELECT 
 p.productName AS 'Nama Produk',
GROUP_CONCAT(DISTINCT  c.customerName 
ORDER BY c.customerName ASC 
SEPARATOR ', ') AS 'Nama CUstomer',
COUNT(DISTINCT c.customerNumber) AS 'Jumlah Customer',
SUM(od.quantityOrdered) AS 'Total Quantitas'
FROM customers c
JOIN orders o USING (customerNumber)
JOIN orderdetails od USING(orderNumber)
JOIN products p USING(productCode)
GROUP BY p.productName;

#No 3
SELECT 
CONCAT(e.firstName, ' ', e.lastName) AS employeeName,
COUNT(c.customerNumber) AS totalCustomers
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY e.employeeNumber
ORDER BY totalCustomers DESC;


#No 4
SELECT 
CONCAT(e.firstName, ' ', e.lastName)
AS  'Nama Karyawan',
p.productName AS 'Nama Produk',
SUM(od.quantityOrdered) AS 'Jumlah Pesanan'
FROM offices o
LEFT JOIN employees e
USING (officeCode)
LEFT JOIN customers c
ON c.salesRepEmployeeNumber = e.employeeNumber
LEFT JOIN orders 
USING(customerNumber)
LEFT JOIN orderdetails  od
USING(orderNumber)
LEFT JOIN products p
USING(productCode) 
WHERE o.country = 'Australia'
GROUP BY e.employeeNumber, p.productName
ORDER BY `Jumlah Pesanan` DESC;


#no 5
SELECT 
c.customerName
AS  'Nama Pelanggan',
GROUP_CONCAT(p.productName) AS 'Nama Produk',
COUNT(p.productLine) AS 'Banyak Jenis Produk'
FROM customers c
JOIN orders o
USING (customerNumber)
JOIN orderdetails od
USING(orderNumber)
JOIN products p
USING(productCode)
WHERE o.shippedDate IS NULL 
GROUP BY c.customerName
ORDER BY c.customerName, `Nama Produk`;
