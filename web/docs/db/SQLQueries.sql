
SELECT * 
FROM Employee
WHERE Lastname LIKE 'Russ%';

SELECT * 
FROM Employee
WHERE Lastname IS NULL; or WHERE Lastname IS NOT NULL;

SELECT * 
FROM Employee
WHERE Lastname LIKE 'Russ%'
ORDER by Lastname DESC OR ASC;

SELECT COUNT(*) OR MAX(ID)
FROM Employee
WHERE Lastname LIKE 'Russ%';

SELECT FirstNme, LastName, HireDate,
	Employee, DepartmentID, Name, Location
FROM Employee JOIN Department
ON Employee.DepartmentID = Department.DepartmentID;

SELECT DATE_FORMAT(date_field, '%d/%m/%Y')












