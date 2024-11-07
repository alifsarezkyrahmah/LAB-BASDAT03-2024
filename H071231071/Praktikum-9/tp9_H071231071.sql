
#No1
CREATE DATABASE footballmanagement;
USE footballmanagement;

CREATE TABLE klub(
id INT PRIMARY KEY AUTO_INCREMENT,
nama_klub VARCHAR(50) NOT NULL,
kota_asal VARCHAR(20) NOT NULL
);

CREATE TABLE pemain(
id INT PRIMARY KEY AUTO_INCREMENT,
nama_pemain VARCHAR(50) NOT NULL,
posisi VARCHAR(20) NOT NULL,
id_klub INT,
FOREIGN KEY pemain(id_klub) 
REFERENCES klub(id) ON DELETE CASCADE
);


CREATE TABLE pertandingan(
id INT PRIMARY KEY AUTO_INCREMENT,
id_klub_tuan_rumah INT,
FOREIGN KEY(id_klub_tuan_rumah)
REFERENCES klub(id) ON DELETE CASCADE,
id_klub_tamu INT,
FOREIGN KEY(id_klub_tamu)
REFERENCES klub(id) ON DELETE CASCADE,
tanggal_pertandingan DATE NOT NULL,
skor_tuan_rumah INT DEFAULT 0,
skor_tamu INT DEFAULT 0
);

ALTER TABLE pemain
ADD INDEX index_posisi(posisi);

ALTER TABLE klub
ADD INDEX index_kota_asal(kota_asal);

DESCRIBE pemain;
DESCRIBE klub;


#No2
USE classicmodels;

SELECT c.customerName,
c.country,
FORMAT(SUM(p.amount),2) AS TotalPayment,
COUNT(o.orderNumber) AS orderCount,
MAX(p.paymentDate) AS LastPaymentDate, 
case 
when SUM(p.amount)  > 100000 then 'VIP'
when SUM(p.amount) BETWEEN 5000 AND 100000
then 'Loyal'
ELSE 'New'
END AS `Status`
FROM customers c
LEFT JOIN payments p
USING(customerNumber)
LEFT JOIN orders o
USING(customerNumber)
GROUP BY c.customerName;


#No3
SELECT 
c.customerNumber, c.customerName, 
SUM(od.quantityOrdered) AS total_quantity,
CASE 
WHEN SUM(od.quantityOrdered) > (
   SELECT AVG(quantity) 
   FROM (
   SELECT SUM(quantityOrdered) AS quantity
   FROM orderdetails 
   GROUP BY orderNumber
   ) AS avg_quantity
   ) 
THEN 'di atas rata-rata'
ELSE 'di bawah rata-rata'
END AS kategori_pembelian
FROM customers c
JOIN orders USING (customerNumber)
JOIN orderdetails od USING (orderNumber)
GROUP BY 
c.customerNumber, c.customerName
ORDER BY total_quantity DESC;
