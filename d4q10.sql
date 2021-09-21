create table birthday_employees_meng(id int)

create proc sp_birthday_employees_meng
as 
begin 
insert into birthday_employees_meng(id)
select e.EmployeeID from Northwind.dbo.Employees e where month(e.BirthDate) = 2
end

sp_birthday_employees_meng

select * from birthday_employees_meng

drop table birthday_employees_meng