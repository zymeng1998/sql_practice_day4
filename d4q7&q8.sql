
--7. Lock tables Region, Territories, EmployeeTerritories and Employees. 
--	Create a stored procedure “sp_move_employees_[your_last_name]” that automatically find all employees in territory “Tory”; 
--	if more than 0 found, insert a new territory “Stevens Point” of region “North” to the database, 
--	and then move those employees to “Stevens Point”.

--8. Create a trigger that when there are more than 100 employees in territory “Stevens Point”,
--	move them back to Troy. (After test your code,) remove the trigger.
--	Move those employees back to “Troy”, if any. Unlock the tables.




drop proc sp_move_employees_Meng
create proc sp_move_employees_Meng
as
begin
set tran isolation level serializable
begin tran
	Declare @numTory int
	set @numTory = 0
	set @numTory =  (
		Select COUNT(1) countTory
		From Employees e join EmployeeTerritories empterr ON e.EmployeeID = empterr.EmployeeID
		join Territories terr ON terr.TerritoryID = empterr.TerritoryID

		Group by terr.TerritoryDescription
		Having terr.TerritoryDescription = 'Troy'
		) 
	print('check')
	print @numTory
	if @numTory > 0
		begin
		insert into Territories values (99999, 'Stevens Point', 3)
		update Employees set City = 'Stevens Point' where EmployeeID IN (Select e.EmployeeID
			From Employees e join EmployeeTerritories empterr ON e.EmployeeID = empterr.EmployeeID
			join Territories terr ON terr.TerritoryID = empterr.TerritoryID
			where terr.TerritoryDescription = 'Troy'
			)
		end
commit
end

sp_move_employees_Meng

select * from Employees

create trigger trg_more_than_100_in_sp
on Employee
after insert
as 
begin
declare @numTroy int



end