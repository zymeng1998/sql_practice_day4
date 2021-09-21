Create view view_product_order_quantity_Meng
as 
SELECT p.ProductName, tmp.Quantity
FROM Products p left join
	(SELECT ProductID, SUM(Quantity) Quantity
	FROM [Order Details]
	GROUP BY ProductID) tmp
	ON p.ProductID = tmp.ProductID
;
Select * From view_product_order_quantity_Meng
;