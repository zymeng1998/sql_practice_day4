create proc sp_meng_1
as 
begin 
-- distinct customer, product
-- count product
-- the use the result find city

select c.City 
from Customers c 
where c.CustomerID in 
	(select cp_pair.CustomerID
	from 
		(select distinct o.CustomerID, od.ProductID
		from [Order Details] od join Orders o ON od.OrderID = o.OrderID
			right join Customers c ON c.CustomerID = o.CustomerID
		where o.CustomerID is not null) cp_pair
	group by cp_pair.CustomerID 
	having COUNT(cp_pair.ProductID) <= 1)
end

create proc sp_meng_2
as 
begin 
-- distinct customer, product
-- count product
-- the use the result find city

select c.City 
from Customers c join (select cp_pair.CustomerID
	from 
		(select distinct o.CustomerID, od.ProductID
		from [Order Details] od join Orders o ON od.OrderID = o.OrderID
			right join Customers c ON c.CustomerID = o.CustomerID
		where o.CustomerID is not null) cp_pair
	group by cp_pair.CustomerID 
	having COUNT(cp_pair.ProductID) <= 1) tmp ON tmp.CustomerID = c.CustomerID
end

-- 12. How to make sure thay have same data.
-- rows in table 1 are in table 2 && rows in table 2 are in table 1