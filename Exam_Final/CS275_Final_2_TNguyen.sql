USE ap;


-- PROBLEM 1
INSERT INTO vendors(vendorid, vendorname, vendoraddress1, vendoraddress2, vendorcity, vendorstate, vendorzipcode, vendorphone, vendorcontactlname, vendorcontactfname, defaulttermsid, defaultaccountno) VALUES(124, 'My Express Corp', 'P.O. Box 2222', 'Dept A', 'Memphis', 'TN', 38101, '(800)555-1234', 'Smith', 'Jones', 3, 553) ON DUPLICATE KEY UPDATE vendorid=vendorid, vendorname=vendorname, vendoraddress1=vendoraddress1, vendoraddress2=vendoraddress2, vendorcity=vendorcity, vendorstate=vendorstate, vendorzipcode=vendorzipcode, vendorphone=vendorphone, vendorcontactlname=vendorcontactlname, vendorcontactfname=vendorcontactfname, defaulttermsid=defaulttermsid, defaultaccountno=defaultaccountno; SELECT * FROM vendors WHERE vendorid = 124;


-- PROBLEM 2
SELECT CONCAT(vendorcontactlname, ', ', vendorcontactfname) fullname FROM vendors v ORDER BY v.vendorcontactlname, v.vendorcontactfname;


-- PROBLEM 3
SELECT CONCAT(v.vendorcontactlname, ', ', v.vendorcontactfname) fullname FROM vendors v WHERE v.vendorcontactlname LIKE 'a%' OR vendorcontactlname LIKE 'b%' OR vendorcontactlname LIKE 'c%' OR vendorcontactlname LIKE 'e%' ORDER BY v.vendorcontactlname, v.vendorcontactfname;


-- PROBLEM 4
SELECT i.invoicenumber number, i.invoicetotal total FROM invoices i WHERE i.invoicetotal >= 500 AND i.invoicetotal <= 10000;


-- PROBLEM 5
SELECT v.vendorname, i.invoicenumber, i.invoicedate, (i.invoicetotal - (i.paymenttotal + i.credittotal)) balance FROM vendors v JOIN invoices i ON i.vendorid = v.vendorid HAVING balance > 1 ORDER BY v.vendorname;


-- PROBLEM 6
SELECT DISTINCT gla.accountno, gla.accountdescription FROM glaccounts gla WHERE NOT EXISTS (SELECT DISTINCT accountno FROM invoicelineitems ili WHERE ili.accountno = gla.accountno);


-- PROBLEM 7
SELECT * FROM vendors WHERE vendorcity = 'California';

SELECT v1.vendorname, v1.vendorstate, (CASE v1.vendorcity WHEN 'California' THEN 'CA' ELSE 'OUTSIDE CA' END) AS vendorstate FROM vendors v1 UNION SELECT v2.vendorname, v2.vendorstate, (CASE v2.vendorcity WHEN 'California' THEN 'CA' ELSE 'OUTSIDE CA' END) AS vendorstate FROM vendors v2 ORDER BY vendorname;


-- PROBLEM 8
SELECT v.vendorname, SUM(i.paymenttotal) paymentsum FROM vendors v JOIN invoices i ON i.vendorid = v.vendorid GROUP BY v.vendorname ORDER BY paymentsum DESC LIMIT 10;


-- PROBLEM 9
SELECT COUNT(*) FROM vendors;
SELECT COUNT(*) FROM invoices;


DROP TABLE IF EXISTS vendorcopy;
CREATE TABLE vendorcopy LIKE vendors;
INSERT INTO vendorcopy (vendorid, vendorname, vendoraddress1, vendoraddress2, vendorcity, vendorstate, vendorzipcode, vendorphone, vendorcontactlname, vendorcontactfname, defaulttermsid, defaultaccountno) SELECT v.vendorid, v.vendorname, v.vendoraddress1, v.vendoraddress2, v.vendorcity, v.vendorstate, v.vendorzipcode, v.vendorphone, v.vendorcontactlname, v.vendorcontactfname, v.defaulttermsid, v.defaultaccountno FROM vendors v;
SELECT COUNT(*) FROM vendorcopy;


DROP TABLE IF EXISTS invoicecopy;
CREATE TABLE invoicecopy LIKE invoices;
INSERT INTO invoicecopy (invoiceid, vendorid, invoicenumber, invoicedate, invoicetotal, paymenttotal, credittotal, termsid, invoiceduedate, paymentdate) SELECT i.invoiceid, i.vendorid, i.invoicenumber, i.invoicedate, i.invoicetotal, i.paymenttotal, i.credittotal, i.termsid, i.invoiceduedate, i.paymentdate FROM invoices i;
SELECT COUNT(*) FROM invoicecopy;


-- PROBLEM 10
UPDATE vendorcopy vc SET vc.defaultaccountno = 600 WHERE vc.defaultaccountno = 540;
SELECT * FROM vendorcopy WHERE defaultaccountno = 540;


-- PROBLEM 11
SELECT i1.invoicenumber, i1.invoicetotal FROM invoices i1 WHERE i1.paymenttotal > (SELECT AVG(i2.paymenttotal) FROM invoices i2);


-- PROBLEM 12
SELECT gla.accountno, gla.accountdescription FROM glaccounts gla WHERE NOT EXISTS (SELECT * FROM invoicelineitems ili WHERE ili.accountno = gla.accountno);


-- PROBLEM 13
SELECT v.vendorname, ili.invoiceid, ili.invoicesequence, ili.invoicelineitemamount FROM vendors v JOIN invoices i ON i.vendorid = v.vendorid JOIN invoicelineitems ili ON ili.invoiceid = i.invoiceid WHERE ili.invoiceid IN (SELECT ili.invoiceid FROM invoicelineitems ili JOIN invoices i ON i.invoiceid = ili.invoiceid GROUP BY ili.invoiceid HAVING COUNT(ili.invoiceid) > 1) GROUP BY v.vendorname, ili.invoiceid, ili.invoicesequence, ili.invoicelineitemamount ORDER BY v.vendorname, ili.invoiceid, ili.invoicesequence, ili.invoicelineitemamount;


-- PROBLEM 14
SELECT t.invoiceid, MAX(t.unpaidinvoices) maxunpaidinvoices FROM (SELECT i.invoiceid, SUM(i.invoicetotal) unpaidinvoices, i.paymentdate FROM invoices i JOIN invoicelineitems ili ON ili.invoiceid = i.invoiceid GROUP BY i.invoiceid HAVING i.paymentdate IS NULL) t GROUP BY t.invoiceid ORDER BY maxunpaidinvoices DESC LIMIT 1;


-- PROBLEM 15
SELECT v1.vendorname, v1.vendorcity, v1.vendorstate FROM vendors v1 WHERE v1.vendorstate NOT IN (SELECT DISTINCT v2.vendorstate FROM vendors v2 WHERE v2.vendorid != v1.vendorid) AND v1.vendorcity NOT IN (SELECT DISTINCT v2.vendorcity FROM vendors v2 WHERE v2.vendorid != v1.vendorid);
