#NIM: H071231071
#Nama: Alifsa Rezky Rahmah Sabran
USE classicmodels;


#Nomor 1
SELECT productCode AS 'Kode Produk',
productName AS 'Nama Produk',
quantityInStock AS 'Jumlah Stok'
FROM products
WHERE quantityInStock 
BETWEEN 5000 AND 6000;


#Nomor2
SELECT orderNumber AS 'Nomor Pesanan',
orderDate AS 'Tanggal Pesanan',
`status` , customerNumber AS 'Nomor Pelanggan'
FROM orders 
WHERE != 'shipped'
ORDER BY customerNumber;


#Nomor3
SELECT employeeNumber AS 'Nomor Karyawan',
firstName, lastName, email, 
jobTitle AS Jabatan
FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY firstName
LIMIT 10;


#Nomor4
SELECT productCode AS 'Kode Produk',
productName AS 'Nama Produk',
productLine AS 'Lini produk',
buyPrice AS 'Harga Beli'
FROM products
ORDER BY buyPrice DESC
LIMIT 5,10;


#Nomor5
SELECT DISTINCT country, city
FROM customers
ORDER BY country, city;

