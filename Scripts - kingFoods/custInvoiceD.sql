USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[custInvoiceD]    Script Date: 1/11/2021 1:29:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[custInvoiceD] @custid int
as
;WITH CTE AS
(

	SELECT distinct OD.orderid[Order ID], O.orderdate, O.custid, O.empid, P.productid[Product ID],  P.productname[Product Name],
	OD.unitprice[Price], OD.qty[Qty], OD.unitprice*OD.qty[Extended Price], 
	SUM ((od.unitprice*od.qty)-(((od.unitprice*od.qty)*(od.discount)))) OVER (PARTITION BY od.orderid)[Order Total]
	FROM Sales.OrderDetails OD
	INNER JOIN Production.Products P
	ON OD.productid=P.productid
	INNER JOIN Sales.Orders O
	ON O.orderid = OD.orderid
	where o.custid = @custid

)

SELECT DISTINCT [Order ID], orderdate, custid, empid, [Order Total]
FROM CTE
ORDER BY [Order ID]
GO


