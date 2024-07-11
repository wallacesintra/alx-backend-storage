# MySQL

## create table with constraints

1. define the table and column
2. add constraints:
    `PRIMARY KEY` - unique identify each record
    `FOREIGN KEY` - ensures referential integrity
    `UNIQUE` - ensuring all values in a column are unique
    `NOT NULL` - value can not be null
    `CHECK` - ensures a value meets a certain value

```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    LastName VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    BirthDate DATE CHECK (BirthDate <= CURDATE()),
    DepartmentID INT,
    UNIQUE (LastName, FirstName),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
```

## optimize queries by adding indexes

1. identify frequently queries columns
2. create indexes on those columns

```sql
CREATE INDEX idx_lastname ON Employees (LastName);
```

## Implement stored procedures and function

### stored procedure

perform a task

```sql
DELIMITER //
CREATE PROCEDURE GetEmployeeDetails ()
BEGIN
    SELECT * FROM Employees;
END //
DELIMITER ;
```

### function

return a value

```sql
DELIMITER //
CREATE FUNCTION GetTotalEmployees ()
RETURNS INT
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM Employees;
    RETURN total;
END //
DELIMITER ;
```

## Implement Views

`view` : a virtual table based on the result-set of a SQL statement

```sql
CREATE VIEW ViewEmployeeDetails AS
SELECT EmployeeID, LastName, FirstName FROM Employees;
```

## Implement Triggers

`Trigger` : a database object that is automatically executed or fired when a certain events occur.

```sql
DELIMITER //
CREATE TRIGGER BeforeEmployeeUpdate
BEFORE UPDATE ON Employees
FOR EACH ROW
BEGIN
   IF NEW.BirthDate <= CURDATE() THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'BirthDate must be before the current date.';
   END IF;
END //
DELIMITER ;
```
