Create proc sp_product_order_city_Meng 
@pname nvarchar(40)
as
begin

	Select TOP 5 c.City, SUM(od.Quantity) totalQByCity
	From [Order Details] od join Orders o ON od.OrderID = o.OrderID
		join Products p ON p.ProductID = od.ProductID
		join Customers c ON c.CustomerID = o.CustomerID
	Where p.ProductName = @pname
	Group by c.City, od.ProductID
	Order by totalQByCity DESC

end


