USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[receiptDetailforCust]    Script Date: 1/11/2021 1:32:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[receiptDetailforCust] @orderid int
AS
	SELECT OD.orderid[Order ID], O.orderdate, O.custid, O.empid, P.productid[Product ID],  P.productname[Product Name],
	OD.unitprice[Price], OD.qty[Qty], OD.unitprice*OD.qty[Extended Price], 
	SUM (OD.unitprice*OD.qty) OVER (PARTITION BY OD.orderid)[Order Total]
	FROM Sales.OrderDetails OD
	INNER JOIN Production.Products P
	ON OD.productid=P.productid
	INNER JOIN Sales.Orders O
	ON O.orderid = OD.orderid
	WHERE OD.orderid=@orderid
GO


