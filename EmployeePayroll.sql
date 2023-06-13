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
Insert into employee_payroll (Emp_Name , Salary , Starting_date) values ('Charlie' , 85000 , '2023-03-10');
Insert into employee_payroll (Emp_Name , Salary , Starting_date) values ('Rakesh' , 759000 , '2023-04-10');
Insert into employee_payroll (Emp_Name , Salary , Starting_date) values ('Rashmi' , 95000 , '2023-03-10');
Insert into employee_payroll (Emp_Name , Salary , Starting_date) values ('Anuj' , 95000 , '2023-03-10');

--UC4
select * from employee_payroll

--UC5
SELECT Salary FROM employee_payroll WHERE Emp_Name = 'Bill' and Starting_date between CAST('2018-01-01' AS DATE) AND GETDATE();

--UC6
alter table employee_payroll add Gender Varchar(5);

UPDATE employee_payroll set Gender ='M' where Emp_Name = 'Bill' or Emp_Name ='Charlie';
UPDATE employee_payroll set Gender ='M' where Emp_Name = 'Ankit'
UPDATE employee_payroll set Gender ='M' where Emp_Name = 'Rakesh'
UPDATE employee_payroll set Gender ='F' where Emp_Name = 'Rashmi'
UPDATE employee_payroll set Gender ='M' where Emp_Name = 'Anuj'
select * from employee_payroll

--UC7
select sum(Salary),avg(Salary),MIN(Salary),MAX(Salary), Gender from employee_payroll where Gender = 'F' group by Gender;
select sum(Salary),avg(Salary),MIN(Salary),MAX(Salary), Gender from employee_payroll where Gender = 'M' group by Gender;
select COUNT(*) from employee_payroll group by Gender

--UC8
alter table employee_payroll add Phone int(10) , Address Varchar(100), Department Varchar(100)
alter table employee_payroll alter column Phone Bigint;

update employee_payroll set Phone = 8340596362 , Address = 'Landon' , Department = 'Sports' where Emp_Name = 'Bill';
update employee_payroll set Phone = 9765477457 , Address = 'India' , Department = 'Science' where Emp_Name = 'Ankit';
update employee_payroll set Phone = 7870893100 , Address = 'California' , Department = 'Engineer' where Emp_Name = 'Charlie';
update employee_payroll set Phone = 9547965004 , Address = 'New York' , Department = 'Tech' where Emp_Name = 'Rakesh';
update employee_payroll set Phone = 7943868454 , Address = 'Delhi' , Department = 'Developer' where Emp_Name = 'Rashmi';
update employee_payroll set Phone = 8749609934 , Address = 'Bangalore' , Department = 'Manager' where Emp_Name = 'Anuj';

--UC9
alter table employee_payroll add Basic_Pay decimal(10,2) , Deduction decimal(10,2) , Taxable_Pay decimal(10,2) , Income_Tax decimal(10,2) , Net_Pay decimal(10,2);

update employee_payroll set Basic_Pay = 25000 , Deduction = 0 , Taxable_Pay = 0 , Income_Tax = 0 , Net_Pay = 0 where Emp_Name = 'Bill';
update employee_payroll set Basic_Pay = 35000 , Deduction = 0 , Taxable_Pay = 0 , Income_Tax = 0 , Net_Pay = 0 where Emp_Name = 'Ankit';
update employee_payroll set Basic_Pay = 45000 , Deduction = 0 , Taxable_Pay = 0 , Income_Tax = 0 , Net_Pay = 0 where Emp_Name = 'Charlie';
update employee_payroll set Basic_Pay = 55000 , Deduction = 0 , Taxable_Pay = 0 , Income_Tax = 0 , Net_Pay = 0 where Emp_Name = 'Rakesh';
update employee_payroll set Basic_Pay = 65000 , Deduction = 0 , Taxable_Pay = 0 , Income_Tax = 0 , Net_Pay = 0 where Emp_Name = 'Rashmi';
update employee_payroll set Basic_Pay = 75000 , Deduction = 0 , Taxable_Pay = 0 , Income_Tax = 0 , Net_Pay = 0 where Emp_Name = 'Anuj';

--UC10
Insert into employee_payroll (Emp_Name , Salary , Starting_date , Gender , Phone , Address , Department , Basic_Pay , Deduction , Taxable_Pay , Income_Tax , Net_Pay) values ('Terissa' , 56000 , '2019-03-10' , 'F' , 7887897985 , 'Peris' , 'Sales' , 25000 , 0 , 0 , 0 , 0);
Insert into employee_payroll (Emp_Name , Salary , Starting_date , Gender , Phone , Address , Department , Basic_Pay , Deduction , Taxable_Pay , Income_Tax , Net_Pay) values ('Terissa' , 78000 , '2019-03-10' , 'F' , 6769898434 , 'Peris' , 'Marketing' , 25000 , 0 , 0 , 0 , 0);
select * from employee_payroll

--UC11

create table Emp_Daprtment(
Department_Id int primary key identity(1,1),
Emp_ID int foreign key references employee_payroll(Emp_ID),
Dept_Name varchar(100)
)
select * from Emp_Daprtment
Insert into Emp_Daprtment(Emp_ID, Dept_Name) values (2, 'Science');
Insert into Emp_Daprtment(Emp_ID, Dept_Name) values (2, 'Physics');
Insert into Emp_Daprtment(Emp_ID, Dept_Name) values (2, 'Computer');
Insert into Emp_Daprtment(Emp_ID, Dept_Name) values (2, 'Account');
Insert into Emp_Daprtment(Emp_ID, Dept_Name) values (2, 'Management');

--UC12
select * from Emp_Daprtment
select * from employee_payroll

SELECT Salary FROM employee_payroll WHERE Emp_Name = 'Bill' and Starting_date between CAST('2018-01-01' AS DATE) AND GETDATE();

select sum(Salary),avg(Salary),MIN(Salary),MAX(Salary), Gender from employee_payroll inner join Emp_Daprtment on employee_payroll.Emp_ID=Emp_Daprtment.Department_Id group by Gender;
select sum(Salary),avg(Salary),MIN(Salary),MAX(Salary), Gender from employee_payroll where Gender = 'M' group by Gender;
select COUNT(*) from employee_payroll group by Gender
