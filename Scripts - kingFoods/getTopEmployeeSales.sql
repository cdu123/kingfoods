USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[getTopEmployeeSales]    Script Date: 1/11/2021 1:31:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[getTopEmployeeSales] @startDate datetime2 = NULL, @endDate datetime2 =NULL
AS

with orderTotal as 
(
	SELECT distinct O.orderid, O.orderdate, SUM (OD.unitprice*OD.qty) OVER (PARTITION BY OD.orderid)[OrderTotal]
	FROM Sales.Orders O
	INNER JOIN Sales.OrderDetails OD
	ON O.orderid = OD.orderid
),

 employeeTotalSales as
(
	SELECT OT.orderid, O.empid, OrderTotal,
	 SUM (OT.OrderTotal) OVER (PARTITION BY O.EMPID)[EmployeeTotalSales]
	FROM orderTotal OT
	INNER JOIN Sales.Orders O
	ON O.orderid=OT.orderid
	INNER JOIN HR.Employees E
	ON O.empid=E.empid
WHERE 1 = 1
	AND (@startDate IS NULL OR (o.orderdate > @startDate) )

	AND (@endDate IS NULL OR (o.orderdate < @endDate) )
)

SELECT distinct ETS.empid, CONCAT(E.firstname,' ', E.lastname)[Name], ETS.EmployeeTotalSales
FROM employeeTotalSales ETS 
INNER JOIN HR.Employees E
ON ETS.empid=E.empid 
ORDER BY ETS.EmployeeTotalSales DESC

GO


