use DDL_module;
show tables;
CREATE TABLE Salaries (
    EmployeeID INT,
    DepartmentID INT,
    SalaryMonth DATE,
    Salary INT
);
INSERT INTO Salaries (EmployeeID, DepartmentID, SalaryMonth, Salary) VALUES
-- Department 1
(1, 1, '2025-01-01', 5000),
(1, 1, '2025-02-01', 5200),
(1, 1, '2025-03-01', 5100),
(1, 1, '2025-04-01', 5300),
(2, 1, '2025-01-01', 4800),
(2, 1, '2025-02-01', 4900),
(2, 1, '2025-03-01', 5000),
(2, 1, '2025-04-01', 5100),

-- Department 2
(3, 2, '2025-01-01', 6000),
(3, 2, '2025-02-01', 6100),
(3, 2, '2025-03-01', 6200),
(3, 2, '2025-04-01', 6300),
(4, 2, '2025-01-01', 5500),
(4, 2, '2025-02-01', 5600),
(4, 2, '2025-03-01', 5700),
(4, 2, '2025-04-01', 5800);

select * from Salaries;

select s.*, 
avg(Salary) over(
partition by DepartmentID 
rows between 2 preceding and current row) avg_moving_salary
from Salaries s;

ALTER TABLE Salaries
ADD HireDate DATE;

SET SQL_SAFE_UPDATES=0;
UPDATE Salaries
SET HireDate = CASE EmployeeID
    WHEN 1 THEN '2023-06-15'
    WHEN 2 THEN '2024-01-10'
    WHEN 3 THEN '2022-11-20'
    WHEN 4 THEN '2023-03-05'
END;

select s.*, 
	dense_rank() over(partition by DepartmentID order by HireDate) as rnk,
	row_number() over(partition by DepartmentID order by HireDate) as rownum 
from Salaries s;