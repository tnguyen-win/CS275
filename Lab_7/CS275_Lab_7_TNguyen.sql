-- [SECTION ONE]
USE myguitarshop;


-- PROBLEM 1
ALTER TABLE `categories` AUTO_INCREMENT = 5;
INSERT INTO categories(categoryname) VALUES('Brass') ON DUPLICATE KEY UPDATE categoryname=categoryname;
SELECT * FROM categories c ORDER BY c.categoryid;


-- PROBLEM 2
UPDATE categories c SET c.categoryname = 'Woodwinds' WHERE c.categoryid = 5;
SELECT * FROM categories c WHERE c.categoryid = 5;


-- PROBLEM 3
DELETE FROM categories c WHERE c.categoryid = 5;
SELECT * FROM categories c ORDER BY c.categoryid;


-- PROBLEM 4
ALTER TABLE `products` AUTO_INCREMENT = 11;
INSERT INTO products(categoryid, productcode, productname, description, listprice, discountpercent, dateadded) VALUES(4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano', 'Long description to come.', 799.99, 0, CURDATE()) ON DUPLICATE KEY UPDATE categoryid=categoryid, productcode=productcode, productname=productname, description=description, listprice=listprice, discountpercent=discountpercent, dateadded=dateadded;
SELECT * FROM products p ORDER BY p.productid;


-- PROBLEM 5
UPDATE products p SET p.discountpercent = 35 WHERE p.productid = 11;
SELECT * FROM products p WHERE p.productid = 11;


-- PROBLEM 6
ALTER TABLE products ADD CONSTRAINT fk_products_categories FOREIGN KEY (categoryid) REFERENCES categories (categoryid);
DELETE FROM products p WHERE p.categoryid = 4;
DELETE FROM categories c WHERE c.categoryid = 4;


-- PROBLEM 7
ALTER TABLE `customers` AUTO_INCREMENT = 386;
INSERT INTO customers(emailaddress, password, firstname, lastname) VALUES('rick@raven.com', '', 'Rick', 'Raven') ON DUPLICATE KEY UPDATE emailaddress=emailaddress, password=password, firstname=firstname, lastname=lastname;
SELECT * FROM customers c ORDER BY c.customerid DESC;


-- PROBLEM 8
UPDATE customers c SET c.password = 'secret' WHERE c.emailaddress = 'rick@raven.com';
SELECT * FROM customers c ORDER BY c.customerid DESC;


-- PROBLEM 9
UPDATE customers c SET c.password = 'reset' WHERE c.customerid LIKE '%';
SELECT * FROM customers c ORDER BY c.customerid;


-- [SECTION TWO]
USE mycollege;


-- PROBLEM 11
ALTER TABLE `departments` AUTO_INCREMENT = 9;
INSERT INTO departments(departmentname) VALUES('History') ON DUPLICATE KEY UPDATE departmentname=departmentname;
SELECT * FROM departments d ORDER BY d.departmentid;


-- PROBLEM 12
ALTER TABLE `instructors` AUTO_INCREMENT = 17;
INSERT INTO instructors(lastname, firstname, status, departmentchairman, hiredate, annualsalary, departmentid) VALUES('Benedict', 'Susan', 'P', 0, CURDATE(), 34000.00, 9) ON DUPLICATE KEY UPDATE lastname=lastname, firstname=firstname, status=status, departmentchairman=departmentchairman, hiredate=hiredate, annualsalary=annualsalary, departmentid=departmentid;
ALTER TABLE `instructors` AUTO_INCREMENT = 18;
INSERT INTO instructors(lastname, firstname, status, departmentchairman, hiredate, annualsalary, departmentid) VALUES('Adams', NULL, 'F', 1, CURDATE(), 66000.00, 9) ON DUPLICATE KEY UPDATE lastname=lastname, firstname=firstname, status=status, departmentchairman=departmentchairman, hiredate=hiredate, annualsalary=annualsalary, departmentid=departmentid;
SELECT * FROM instructors i ORDER BY i.instructorid DESC;


-- PROBLEM 13
UPDATE instructors i SET i.annualsalary = 35000.00 WHERE i.instructorid = 17;
SELECT * FROM instructors i ORDER BY i.instructorid DESC;


-- PROBLEM 14
DELETE FROM instructors i WHERE i.instructorid = 18;
SELECT * FROM instructors i ORDER BY i.instructorid DESC;


-- PROBLEM 15
ALTER TABLE instructors ADD CONSTRAINT fk_instructors_departments FOREIGN KEY (departmentid) REFERENCES departments (departmentid);
DELETE FROM instructors i WHERE i.departmentid = 9;
DELETE FROM departments d WHERE d.departmentid = 9;


-- PROBLEM 16
UPDATE instructors i JOIN departments d ON d.departmentname = 'Business' AND i.departmentid = d.departmentid SET i.annualsalary = i.annualsalary + (i.annualsalary * 0.05);
SELECT * FROM instructors i ORDER BY i.instructorid;


-- PROBLEM 17
DELETE FROM instructors i WHERE NOT EXISTS (SELECT * FROM courses c WHERE c.instructorid = i.instructorid);
