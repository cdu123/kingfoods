USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[receiptDetail]    Script Date: 1/11/2021 1:31:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[receiptDetail] @orderid int
AS

	SELECT OD.orderid[OrderID], OD.productid[ProductID],  P.productname[ProductName],
	 OD.unitprice[Price], OD.qty[Qty], OD.discount,
	 (od.unitprice*od.qty)-(((od.unitprice*od.qty)*(od.discount)))[extended],
	SUM ((od.unitprice*od.qty)-(((od.unitprice*od.qty)*(od.discount)))) OVER (PARTITION BY od.orderid)[OrderTotal]
	FROM Sales.OrderDetails OD
	INNER JOIN Production.Products P
	ON OD.productid=P.productid
	WHERE OD.orderid=@orderid


GO


