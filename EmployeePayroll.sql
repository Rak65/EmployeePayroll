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
