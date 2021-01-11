USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[receiptDetailOG]    Script Date: 1/11/2021 1:32:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[receiptDetailOG] @orderid int
AS
	SELECT OD.orderid[Order ID], OD.productid[Product ID],  P.productname[Product Name],
	OD.unitprice[Price], OD.qty[Qty], OD.unitprice*OD.qty[Extended Price], 
	SUM (OD.unitprice*OD.qty) OVER (PARTITION BY OD.orderid)[Order Total], OD.discount
	FROM Sales.OrderDetails OD
	INNER JOIN Production.Products P
	ON OD.productid=P.productid
	WHERE OD.orderid=@orderid
GO


