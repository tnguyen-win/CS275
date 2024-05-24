USE mycollege;


-- PROBLEM 1
SELECT i1.lastname, i1.firstname, i1.annualsalary FROM instructors i1 WHERE i1.annualsalary > (SELECT AVG(i2.annualsalary) FROM instructors i2) ORDER BY i1.annualsalary DESC;


-- PROBLEM 2
SELECT i.lastname, i.firstname FROM instructors i WHERE NOT EXISTS (SELECT * FROM courses c WHERE c.instructorid = i.instructorid) ORDER BY i.lastname, i.firstname;


-- PROBLEM 3
SELECT s.lastname, s.firstname, COUNT(sc.courseid) count FROM students s JOIN studentcourses sc ON sc.studentid = s.studentid WHERE sc.studentid IN (SELECT sc.studentid FROM studentcourses sc JOIN courses c ON c.courseid = sc.courseid GROUP BY sc.studentid HAVING COUNT(sc.courseid) > 1) GROUP BY s.lastname, s.firstname ORDER BY s.lastname, s.firstname;


-- PROBLEM 4
SELECT i1.lastname, i1.firstname, i1.annualsalary FROM instructors i1 WHERE i1.annualsalary NOT IN (SELECT DISTINCT i2.annualsalary FROM instructors i2 WHERE i2.departmentid != i1.departmentid) ORDER BY i1.lastname, i1.firstname;


-- PROBLEM 5
SELECT c.coursedescription, s.lastname, s.firstname, s.enrollmentdate FROM courses c JOIN studentcourses sc ON sc.courseid = c.courseid JOIN students s ON sc.studentid = s.studentid JOIN (SELECT c.courseid, MAX(s.enrollmentdate) maxenrollmentdate FROM courses c JOIN studentcourses sc ON sc.courseid = c.courseid JOIN students s ON sc.studentid = s.studentid GROUP BY c.courseid) t ON t.courseid = c.courseid AND t.maxenrollmentdate = s.enrollmentdate;
