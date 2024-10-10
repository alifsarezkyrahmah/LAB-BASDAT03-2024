USE classicmodels

#Nomor 1
SELECT DISTINCT 
c.customerName AS namaKustomer,
p.productName AS namaProduk,
pl.textDescription
FROM customers c
JOIN orders o
ON c.customerNumber = o.customerNumber
JOIN orderdetails od
ON od.orderNumber = o.orderNumber
JOIN products p
ON p.productCode = od.productCode
JOIN productlines pl
ON pl.productLine = p.productLine
WHERE p.productName LIKE '%Titanic%'
ORDER BY c.customerName ;


#Nomor 2
SELECT c.customerName,
p.productName, o.status,
o.shippedDate
FROM customers c
JOIN orders o
ON c.customerNumber = o.customerNumber
JOIN orderdetails od
ON od.orderNumber = o.orderNumber
JOIN products p
ON p.productCode = od.productCode
WHERE p.productName LIKE '%Ferrari%'
AND o.`status`= 'Shipped' AND 
o.shippedDate BETWEEN '2003-10-01'
AND '2004-10-01'
ORDER BY o.shippedDate DESC ;


#No 3
SELECT supervisor.firstName AS Supervisor,
karyawan.firstName AS Karyawan
FROM  employees karyawan
JOIN  employees supervisor
ON supervisor.employeeNumber = karyawan.reportsTo
WHERE supervisor.firstName = 'Gerard' 
ORDER BY karyawan.firstName;

#No 4
#a
SELECT 
c.customerName, p.paymentDate,
e.firstName, p.amount
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p
ON p.customerNumber = c.customerNumber
WHERE p.paymentDate LIKE '_____11%';

#b
SELECT 
c.customerName, p.paymentDate,
e.firstName, p.amount
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p
ON p.customerNumber = c.customerNumber
WHERE p.paymentDate LIKE '%-11-%'
ORDER BY p.amount DESC 
LIMIT 1;

#c
SELECT 
c.customerName, pr.productName
FROM customers c
JOIN payments
ON payments.customerNumber = c.customerNumber
JOIN orders o
ON c.customerNumber = o.customerNumber
JOIN orderdetails od
ON  od.orderNumber = o.orderNumber
JOIN products pr
ON pr.productCode = od.productCode
WHERE payments.paymentDate LIKE '%-11-%'
AND   c.customerNumber = 321;



