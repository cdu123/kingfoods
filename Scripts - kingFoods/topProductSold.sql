USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[topProductSold]    Script Date: 1/11/2021 1:32:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[topProductSold] @startDate datetime2 = NULL, @endDate datetime2 =NULL
AS
	SELECT distinct OD.productid, P.productname, p.supplierid, C.categoryname, sum(OD.qty) over (partition by OD.productid)[TotalSold],
	p.discontinued, 
		CASE
		WHEN  P.discontinued =1 THEN 0
		WHEN P.discontinued=0 THEN P.supplierid
		END[reorder]


	FROM Sales.OrderDetails OD
	INNER JOIN Sales.Orders O
	ON OD.orderid=O.orderid
	INNER JOIN Production.Products P
	ON P.productid = OD.productid
	INNER JOIN Production.Categories C
	ON P.categoryid=C.categoryid
	 WHERE 1 = 1
	AND (@startDate IS NULL OR (o.orderdate > @startDate) )

	AND (@endDate IS NULL OR (o.orderdate < @endDate) )
	ORDER BY TotalSold desc

GO


