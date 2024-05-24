USE mmabooks;


-- Question #1
SELECT * FROM products ORDER BY unitprice DESC;


-- Question #2
SELECT CONCAT(address, ', ', city, ', ', state) AS FullAddress FROM customers WHERE state >= 'M$' and state <= 'Z$' ORDER BY state;


-- Question #3
SET @var_price := 100;
SET @var_taxrate := .07;
DROP TABLE IF EXISTS problem_3;
CREATE TABLE IF NOT EXISTS problem_3(
    Price INT,
    TaxRate DECIMAL(10, 2),
    TaxAmount VARCHAR(100),
    Total VARCHAR(100)
);
INSERT INTO problem_3(Price, TaxRate, TaxAmount, Total) VALUES(@var_price, @var_taxrate, @var_price * @var_taxrate, @var_price - @var_taxrate);
SELECT * FROM problem_3;


-- Question #4
SELECT invoiceid, invoicedate, invoicetotal FROM invoices WHERE invoicetotal > 100.0 ORDER BY invoicetotal DESC;


-- Question #5
SELECT DISTINCT p.productcode, p.description, p.unitprice, p.onhandquantity FROM products p JOIN invoicelineitems ili ON p.productcode = ili.productcode;


-- Question #6
SELECT invoiceid, customerid, (producttotal * 0.2) AS discountamount, (producttotal - (producttotal * 0.2)) AS newproducttotal FROM invoices;


-- Question #7
SELECT invoiceid, DATE_FORMAT(invoicedate, "%m/%d/%y") AS invoicedate, invoicetotal FROM invoices;
