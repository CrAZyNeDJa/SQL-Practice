CREATE DATABASE SAMPLE

ALTER DATABASE SAMPLE MODIFY NAME = SAMPLEDB

ALTER DATABASE SAMPLEDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE
SP_RENAMEDB 'SAMPLEDB', 'SAMPLE'

DROP DATABASE SAMPLEDB

USE SAMPLE

CREATE TABLE dbo.Person
(
	ID INT PRIMARY KEY NOT NULL,
	nAME NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50) NOT NULL,
	GenderID INT NOT NULL,
	
)

SELECT * FROM dbo.Person

ALTER TABLE dbo.Person
ALTER COLUMN Name NVARCHAR(50) NOT NULL

SELECT * FROM dbo.Person

SP_RENAME 'dbo.Person.Name', 'Name', 'COLUMN'

ALTER TABLE dbo.Person
ALTER COLUMN GenderID INT

INSERT INTO dbo.Person (ID, Name, Email, GenderID) 
VALUES
		(1, 'Jade',   'j@j.com',     2),
		(2, 'Mary',   'm@m.com',     3),
		(3, 'Martin', 'ma@ma.com',   1),
		(4, 'Rob',    'r@r.com',     NULL),
		(5, 'May',    'may@may.com', 2),
		(6, 'Kristy', 'k@k.com',     NULL);

SELECT * FROM dbo.Person

CREATE TABLE dbo.Gender
(
	ID INT PRIMARY KEY NOT NULL,
	Gender NVARCHAR(50) NOT NULL
)

INSERT INTO dbo.Gender VALUES
(1, 'Male'),
(2, 'Female'),
(3, 'Unknown')

select * from dbo.Person
select * from dbo.Gender

ALTER TABLE dbo.Person
ADD CONSTRAINT PERSON_GENDERID_FK
FOREIGN KEY (GenderID) REFERENCES dbo.Gender(ID)

ALTER DATABASE SAMPLE SET MULTI_USER WITH ROLLBACK IMMEDIATE

ALTER TABLE dbo.Person
ADD CONSTRAINT PERSON_GENDERID_DF
DEFAULT 3 FOR GenderID

DELETE FROM dbo.Gender
WHERE ID = 3

INSERT INTO dbo.Person VALUES
(8, 'Mandy', 'Man@m.com', NULL)

select * from dbo.Person
select * from dbo.Gender

ALTER TABLE dbo.Person
ADD Age INT 

INSERT INTO dbo.Person
VALUES
		(2, 'Sara', 's@s.com', 2, 149)

DELETE FROM dbo.Person
WHERE ID = 2


ALTER TABLE dbo.Person
ADD CONSTRAINT Person_Age_CHK
CHECK (Age > 0 AND Age < 150)


CREATE TABLE Person1
(
		PersonID INT NOT NULL IDENTITY(1,1),
		Name NVARCHAR(50)
)

SELECT * FROM dbo.Person1

INSERT INTO dbo.Person1(PersonID, Name)
VALUES
		(1, 'Jane')

DELETE FROM dbo.Person1
where PersonID = 1

SET IDENTITY_INSERT dbo.Person1 OFF
SET IDENTITY_INSERT dbo.Person1 ON


INSERT INTO dbo.Person1(PersonID, Name)
VALUES
		(5, 'Martin')

ALTER TABLE dbo.Person1
ADD CONSTRAINT Person1_PersondID_PK
PRIMARY KEY (PersonID)

DBCC CHECKIDENT(Person1, RESEED, 0)
SELECT * FROM dbo.Person1

INSERT INTO dbo.Person1
VALUES
		('Jane')

DELETE FROM dbo.Person1


select * from dbo.Person1


Create Table Test1
(
ID int identity(1,1),
Value nvarchar(20)
)

Create Table Test2
(
ID int identity(1,1),
Value nvarchar(20)
)


INSERT INTO Test1
values('X')


CREATE TRIGGER trForInsert ON Test1 FOR INSERT
AS
BEGIN
		INSERT INTO Test2 VALUES('YYYY')
END


SELECT * FROM Test1
SELECT * FROM Test2
SELECT SCOPE_IDENTITY()
SELECT @@IDENTITY
SELECT IDENT_CURRENT('dbo.Test2')
SELECT IDENT_CURRENT('dbo.Test1')

INSERT INTO Test2 VALUES('YYYY')

delete from test1

dbcc checkident(test1, reseed, 0)

INSERT INTO Test2 VALUES('YYYY')


ALTER TABLE dbo.Person
ADD CONSTRAINT Person_Email_UQ
UNIQUE(Email)


SELECT * FROM dbo.Person

DELETE FROM dbo.Person

INSERT INTO Person
VALUES(1, 'ABC', 'a@a.com', 1, 20)

INSERT INTO Person
VALUES(2, 'XYZ', 'a@a.com', 1, 20)

ALTER TABLE dbo.Person
DROP CONSTRAINT Person_Email_UQ

ALTER TABLE dbo.Person
ADD ID INT NOT NULL PRIMARY KEY IDENTITY(1,1)

ALTER TABLE dbo.Person
DROP COLUMN ID

ALTER TABLE dbo.Person
DROP CONSTRAINT PK__Person__3214EC27B0B957DF

ALTER TABLE dbo.Person
ADD ID INT NOT NULL PRIMARY KEY IDENTITY(1,1)


INSERT INTO dbo.Person (Name, Email, GenderId, Age, City)
VALUES 
    ('Tom', 't@t.com', 1, 23, 'London'),
    ('John', 'j@j.com', 1, 20, 'New York'),
    ('Mary', 'mary.mary.com', 2, 21, 'Sydney'),
    ('Josh', 'josh.j@dell.com', 1, 29, 'London'),
    ('Sara', 'sara@abc.com', 2, 25, 'Mumbai');
	

	
SELECT * FROM dbo.Person

SELECT * FROM dbo.Person
WHERE City LIKE 'L%'

SELECT * FROM dbo.Person
WHERE Email NOT LIKE '%@%'

SELECT * FROM dbo.Person
WHERE Email LIKE '_@_.COM'


SELECT * FROM dbo.Person
WHERE Name LIKE '[^MST]%'


-- 1. Create the table
CREATE TABLE dbo.tblPerson
(
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Gender NVARCHAR(20) NOT NULL,
    Salary INT NOT NULL,
    City NVARCHAR(50) NOT NULL
);

EXEC SP_RENAME 'tblPerson', 'Employee'

-- 2. Insert the data
INSERT INTO dbo.tblPerson (Name, Gender, Salary, City)
VALUES 
    ('Tom', 'Male', 4000, 'London'),
    ('Pam', 'Female', 3000, 'New York'),
    ('John', 'Male', 3500, 'London'),
    ('Sam', 'Male', 4500, 'London'),
    ('Todd', 'Male', 2800, 'Sydney'),
    ('Ben', 'Male', 7000, 'New York'),
    ('Sara', 'Female', 4800, 'Sydney'),
    ('Valerie', 'Female', 5500, 'New York'),
    ('James', 'Male', 6500, 'London'),
    ('Russell', 'Male', 8800, 'London');


SP_RENAME 'tblPerson', 'Employee'


SELECT * FROM Employee


-- Create Department Table
CREATE TABLE dbo.Department
(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    DepartmentName NVARCHAR(50) NOT NULL,
    Location NVARCHAR(50) NOT NULL,
    DepartmentHead NVARCHAR(50) NOT NULL
);

SP_RENAME 'TBLDEPARTMENT', 'Department'
-- Insert Department Data
INSERT INTO dbo.Department (DepartmentName, Location, DepartmentHead)
VALUES 
    ('IT', 'London', 'Rick'),
    ('Payroll', 'Delhi', 'Ron'),
    ('HR', 'New York', 'Christie'),
    ('Other Department', 'Sydney', 'Cindrella');

    select * from dbo.Department
    SELECT * FROM Employee

    drop table dbo.Employee

    -- Create Employee Table
CREATE TABLE dbo.Employee
(
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Gender NVARCHAR(20) NOT NULL,
    Salary INT NOT NULL,
    DepartmentId INT NULL -- Set to NULL to allow unassigned departments
);

-- Insert Employee Data
INSERT INTO dbo.Employee (Name, Gender, Salary, DepartmentId)
VALUES 
    ('Tom', 'Male', 4000, 1),
    ('Pam', 'Female', 3000, 3),
    ('John', 'Male', 3500, 1),
    ('Sam', 'Male', 4500, 2),
    ('Todd', 'Male', 2800, 2),
    ('Ben', 'Male', 7000, 1),
    ('Sara', 'Female', 4800, 3),
    ('Valerie', 'Female', 5500, 1),
    ('James', 'Male', 6500, NULL),
    ('Russell', 'Male', 8800, NULL);

    select * from dbo.Employee

    select Name, Gender, Salary, DepartmentName
    from dbo.Employee
    JOIN dbo.Department ON Employee.DepartmentId = Department.Id


    select Name, Gender, Salary, DepartmentName
    from dbo.Employee
    INNER JOIN dbo.Department ON Employee.DepartmentId = Department.Id


    select Name, Gender, Salary, DepartmentName
    from dbo.Employee
    LEFT JOIN dbo.Department ON Employee.DepartmentId = Department.Id



     select Name, Gender, Salary, DepartmentName
    from dbo.Employee
    RIGHT JOIN dbo.Department ON Employee.DepartmentId = Department.Id

    select Name, Gender, Salary, DepartmentName
    from dbo.Employee
    FULL JOIN dbo.Department ON Employee.DepartmentId = Department.Id

    select Name, Gender, Salary, DepartmentName
    from dbo.Employee
    CROSS JOIN dbo.Department 


    SELECT * FROM dbo.Employee
    SELECT * FROM dbo.Department


    select Name, Gender, Salary, DepartmentName
    from dbo.Employee E
    LEFT JOIN dbo.Department D ON E.DepartmentId = D.Id
    WHERE D.ID IS NULL


    select E.*, D.*
    from dbo.Employee E
    RIGHT JOIN dbo.Department D ON E.DepartmentId = D.Id
    WHERE E.DepartmentId IS NULL


    select E.*, D.*
    from dbo.Employee E
    FULL JOIN dbo.Department D ON E.DepartmentId = D.Id
    WHERE E.DepartmentId IS NULL OR D.ID IS NULL


    DROP TABLE Employee, Department


    -- Create the single hierarchical table
CREATE TABLE dbo.tblEmployee
(
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    ManagerID INT NULL
);

-- Insert the data exactly as shown in your first image
INSERT INTO dbo.tblEmployee (EmployeeID, Name, ManagerID)
VALUES 
    (1, 'Mike', 3),
    (2, 'Rob', 1),
    (3, 'Todd', NULL),
    (4, 'Ben', 1),
    (5, 'Sam', 1);





select * from dbo.tblEmployee


select E.Name AS Employee, M.Name as Manger
from dbo.tblEmployee E
left join dbo.tblEmployee M
ON E.ManagerID = M.EmployeeID


select E.Name AS Employee, M.Name as Manger
from dbo.tblEmployee E
inner join dbo.tblEmployee M
ON E.ManagerID = M.EmployeeID


select E.Name AS Employee, M.Name as Manger
from dbo.tblEmployee E
cross join dbo.tblEmployee M


select isnull('pragim', 'no manager')
select isnull(null, 'no manager')
select coalesce(null, 'no manager')
select coalesce('pragim', 'no manager')

select E.Name AS Employee, ISNULL(M.Name, 'No Manager') as Manger
from dbo.tblEmployee E
left join dbo.tblEmployee M
ON E.ManagerID = M.EmployeeID

select E.Name AS Employee, 
CASE
    WHEN M.Name IS NULL THEN 'No Manager'
    ELSE m.Name
END as Manger
from dbo.tblEmployee E
left join dbo.tblEmployee M
ON E.ManagerID = M.EmployeeID


CREATE TABLE tblIndiaCustomers
(
    Id INT,
    Name VARCHAR(50),
    Email VARCHAR(100)
);

INSERT INTO tblIndiaCustomers (Id, Name, Email)
VALUES
(1, 'Raj', 'R@R.com'),
(2, 'Sam', 'S@S.com');

CREATE TABLE tblUKCustomers
(
    Id INT,
    Name VARCHAR(50),
    Email VARCHAR(100)
);

INSERT INTO tblUKCustomers (Id, Name, Email)
VALUES
(1, 'Ben', 'B@B.com'),
(2, 'Sam', 'S@S.com');



DROP TABLE IF EXISTS tblIndiaCustomers;
DROP TABLE IF EXISTS tblUKCustomers;

CREATE TABLE tblIndiaCustomers
(
    Id INT,
    Name VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE tblUKCustomers
(
    Id INT,
    Name VARCHAR(50),
    Email VARCHAR(100)
);

INSERT INTO tblIndiaCustomers (Id, Name, Email)
VALUES
(1, 'Raj', 'R@R.com'),
(2, 'Sam', 'S@S.com');

INSERT INTO tblUKCustomers (Id, Name, Email)
VALUES
(1, 'Ben', 'B@B.com'),
(2, 'Sam', 'S@S.com');

SELECT * FROM tblIndiaCustomers;
SELECT * FROM tblUKCustomers;


SELECT * FROM tblIndiaCustomers

UNION

SELECT * FROM tblUKCustomers


SELECT * FROM tblIndiaCustomers

UNION ALL

SELECT * FROM tblUKCustomers



CREATE PROCEDURE spGetEmployees
AS
BEGIN
    select Name, Gender from dbo.Employee
END

spGetEmployees
exec spGetEmployees
execute spGetEmployees

select * from dbo.Employee

CREATE PROC spGetEmployeesByGenderAndDepartment
@Gender NVARCHAR(30),
@DepartmentId INT
AS 
BEGIN
        SELECT Name, Gender, DepartmentId from dbo.Employee
        WHERE Gender = @Gender AND DepartmentId = @DepartmentId
END

EXECUTE spGetEmployeesByGenderAndDepartment 'Male', 1
EXECUTE spGetEmployeesByGenderAndDepartment @DepartmentId = 1, @Gender = 'Male'

sp_help spGetEmployeesByGenderAndDepartment


ALTER PROCEDURE spGetEmployees
AS
BEGIN
    select Name, Gender from dbo.Employee order by Name
END

DROP PROCEDURE spGetEmployees


CREATE PROCEDURE spGetEmployees
AS
BEGIN
    select Name, Gender from dbo.Employee order by Name
END



SELECT * FROM dbo.Employee

CREATE PROCEDURE spGetEmployeeCountByGender
@Gender NVARCHAR(20),
@EmployeeCount INT OUTPUT
AS
BEGIN
    SELECT @EmployeeCount = COUNT(ID) FROM dbo.Employee
    WHERE Gender = @Gender
END

DECLARE @EmpTotal INT
EXECUTE spGetEmployeeCountByGender 'Female', @EmpTotal OUT
SELECT @EmpTotal