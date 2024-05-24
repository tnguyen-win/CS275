-- [PART ONE]
USE saleco;


-- PROBLEM 1
SELECT CUS_FNAME, CUS_LNAME, CUS_BALANCE, INV_NUMBER FROM customer c JOIN invoice i ON i.CUS_CODE = c.CUS_CODE ORDER BY INV_NUMBER, CUS_BALANCE DESC;


-- PROBLEM 2
SELECT P_CODE, P_DESCRIPT, V_NAME FROM product p JOIN vendor v ON p.V_CODE = v.V_CODE ORDER BY V_NAME;


-- PROBLEM 3
SELECT CUS_FNAME, CUS_LNAME, i.INV_NUMBER, p.P_CODE, P_DESCRIPT, CUS_BALANCE FROM customer c JOIN invoice i ON i.CUS_CODE = c.CUS_CODE JOIN line l ON l.INV_NUMBER = i.INV_NUMBER JOIN product p ON l.P_CODE = p.P_CODE ORDER BY INV_NUMBER, CUS_BALANCE;


-- PROBLEM 4
SELECT CUS_FNAME, CUS_LNAME, i.INV_NUMBER, p.P_CODE, P_DESCRIPT, CUS_BALANCE FROM customer c, invoice i, line l, product p WHERE i.CUS_CODE = c.CUS_CODE AND l.INV_NUMBER = i.INV_NUMBER AND l.P_CODE = p.P_CODE ORDER BY INV_NUMBER, CUS_BALANCE;


-- [PART TWO]
USE myguitarshop;


-- PROBLEM 5
SELECT categoryname, productname, listprice FROM categories c JOIN products p ON p.categoryid = c.categoryid ORDER BY categoryname, productname;


-- PROBLEM 6
SELECT firstname, lastname, line1, city, state, zipcode FROM customers c JOIN addresses a ON a.customerid = c.customerid WHERE c.emailaddress = 'allan.sherwood@yahoo.com';


-- PROBLEM 7
SELECT firstname, lastname, line1, city, state, zipcode FROM customers c JOIN addresses a ON a.customerid = c.customerid WHERE a.addressid = c.shippingaddressid;


-- PROBLEM 8
SELECT c.lastname, c.firstname, o.orderdate, p.productname, oi.itemprice, oi.discountamount, quantity FROM customers c JOIN orders o ON o.customerid = c.customerid JOIN orderitems oi ON oi.orderid = o.orderid JOIN products p ON oi.productid = p.productid ORDER BY c.lastname, o.orderdate, p.productname;


-- PROBLEM 9
SELECT p1.productname, p1.listprice
FROM products p1, products p2
WHERE p1.productid <> p2.productid
AND p1.listprice = p2.listprice
ORDER BY productname;


-- PROBLEM 10
SELECT categoryname, productid FROM categories c LEFT JOIN products p ON p.categoryid = c.categoryid WHERE productid IS NULL UNION SELECT categoryname, productid FROM categories c RIGHT JOIN products p ON p.categoryid = c.categoryid WHERE productid IS NULL;


-- PROBLEM 11
SELECT (CASE WHEN o1.shipdate <> 1 THEN "SHIPPED" ELSE "NOT SHIPPED" END) AS shipstatus, o1.orderid, o1.orderdate FROM orders o1 UNION SELECT (CASE WHEN o2.shipdate <> 1 THEN "SHIPPED" ELSE "NOT SHIPPED" END) AS shipstatus, o2.orderid, o2.orderdate FROM orders o2 ORDER BY orderdate;
