-- [PART ONE]
USE myguitarshop;


-- PROBLEM 1
SELECT DISTINCT c.categoryname FROM categories c WHERE c.categoryid IN (SELECT DISTINCT p.categoryid FROM products p) ORDER BY c.categoryname;


-- PROBLEM 2
SELECT p1.productname, p1.listprice FROM products p1 WHERE p1.listprice > (SELECT AVG(p2.listprice) FROM products p2) ORDER BY p1.listprice DESC;


-- PROBLEM 3
SELECT c.categoryname FROM categories c WHERE NOT EXISTS (SELECT * FROM products p WHERE p.categoryid = c.categoryid);


-- PROBLEM 4
SELECT t.emailaddress, MAX(t.ordertotal) maxordertotal FROM (SELECT c.emailaddress, oi.orderid, SUM((oi.itemprice - oi.discountamount) * oi.quantity) ordertotal FROM customers c JOIN orders o ON o.customerid = c.customerid JOIN orderitems oi ON oi.orderid = o.orderid GROUP BY c.emailaddress, oi.orderid) t GROUP BY t.emailaddress;


-- PROBLEM 5
SELECT p1.productname, p1.discountpercent FROM products p1 WHERE p1.discountpercent NOT IN (SELECT DISTINCT p2.discountpercent FROM products p2 WHERE p2.productid != p1.productid) ORDER BY p1.productname;


-- PROBLEM 6
SELECT c.emailaddress, o2.orderid, minorderdate FROM customers c JOIN (SELECT o1.customerid, MIN(o1.orderdate) minorderdate FROM orders o1 GROUP BY o1.customerid) t ON c.customerid = t.customerid JOIN orders o2 ON t.minorderdate = o2.orderdate;


-- PROBLEM 7
SELECT COUNT(orderid) count, SUM(taxamount) sum FROM orders;


-- PROBLEM 8
SELECT c.categoryname, COUNT(p.productid) count, MAX(p.listprice) maxlistprice FROM categories c JOIN products p ON p.categoryid = c.categoryid GROUP BY c.categoryid ORDER BY count DESC;


-- PROBLEM 9
SELECT c.emailaddress, SUM(oi.itemprice * oi.quantity) revenue, SUM(oi.discountamount * oi.quantity) price FROM customers c JOIN orders o ON o.customerid = c.customerid JOIN orderitems oi ON oi.orderid = o.orderid GROUP BY c.emailaddress ORDER BY price DESC;


-- PROBLEM 10
SELECT c.emailaddress, COUNT(oi.orderid) count, SUM((oi.itemprice - oi.discountamount) * oi.quantity) totalamount FROM customers c JOIN orders o ON o.customerid = c.customerid JOIN orderitems oi ON oi.orderid = o.orderid GROUP BY c.emailaddress HAVING count > 1 ORDER BY totalamount DESC;


-- PROBLEM 11
SELECT c.emailaddress, COUNT(oi.orderid) count, SUM((oi.itemprice - oi.discountamount) * oi.quantity) totalamount FROM customers c JOIN orders o ON o.customerid = c.customerid JOIN orderitems oi ON oi.orderid = o.orderid WHERE oi.itemprice > 400 GROUP BY c.emailaddress HAVING count > 1 ORDER BY totalamount DESC;


-- PROBLEM 12
SELECT p.productname, SUM((oi.itemprice - oi.discountamount) * oi.quantity) totalamount FROM products p JOIN orderitems oi ON oi.productid = p.productid GROUP BY p.productname WITH ROLLUP;


-- PROBLEM 13
SELECT c.emailaddress, COUNT(DISTINCT productid) count FROM customers c JOIN orders o ON o.customerid = c.customerid JOIN orderitems oi ON oi.orderid = o.orderid GROUP BY c.emailaddress HAVING count > 1;
