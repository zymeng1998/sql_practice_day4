
--insert into Region values (5, 'Middle Earth')
--insert into Territories values (99999, 'Gondor', 5)
set tran isolation level Serializable 
begin tran
insert into Employees values ('King', 'Aragon', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null)
--insert into EmployeeTerritories values (0, 99999)
insert into Region values (5, 'Middle Earth')
insert into Territories values (99999, 'Gondor', 5)
insert into EmployeeTerritories values (10, 99999)

update Territories set TerritoryDescription = 'Arnor' where TerritoryDescription = 'Gondor'

Delete EmployeeTerritories where EmployeeID =10


Delete Territories where RegionID = 5

Delete Region where RegionDescription = 'Middle Earth'

commit