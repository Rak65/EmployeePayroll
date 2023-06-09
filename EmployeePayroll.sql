--UC1
create database EmployeePayroll
use EmployeePayroll

--UC2
Create table employee_payroll 
(
	Emp_ID int primary key identity(1,1),
	Emp_Name varchar(100) not null,
	Salary decimal(10,2),
	Starting_date Date
);
--UC3
Insert into employee_payroll (Emp_Name , Salary , Starting_date) values ('Ankit' , 65000 , '2023-04-10');
Insert into employee_payroll (Emp_Name , Salary , Starting_date) values ('Bill' , 755000 , '2023-04-10');

--UC4
select * from employee_payroll

--UC5
SELECT Salary FROM employee_payroll WHERE Emp_Name = 'Bill' and Starting_date between CAST('2018-01-01' AS DATE) AND GETDATE();
