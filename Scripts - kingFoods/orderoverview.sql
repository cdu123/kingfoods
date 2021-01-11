USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[orderoverview]    Script Date: 1/11/2021 1:31:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[orderoverview]  @startDate datetime2 = NULL, @endDate datetime2 =NULL
AS
;with cte as(
select o.orderdate, o.custid, o.orderid, c.companyname, od.qty, od.discount, od.unitprice,
SUM ((od.unitprice*od.qty)-(((od.unitprice*od.qty)*(od.discount)))) OVER (PARTITION BY od.orderid)[OrderTotal]
from sales.Orders o
inner join Sales.Customers c
on o.custid=c.custid
inner join sales.orderdetails od
on od. orderid = o.orderid
 WHERE 1 = 1
	AND (@startDate IS NULL OR (o.orderdate > @startDate) )

	AND (@endDate IS NULL OR (o.orderdate < @endDate) )
)
select distinct orderid, [ordertotal], custid, companyname, orderdate
from cte

GO


