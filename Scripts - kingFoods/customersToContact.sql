USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[customersToContact]    Script Date: 1/11/2021 1:30:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[customersToContact] @startDate datetime2=null, @endDate datetime2 = null
AS

;WITH getCustomers AS 
(
	SELECT distinct c.custid
	FROM Sales.Customers C
	LEFT JOIN Sales.Orders O
	ON O.custid=C.custid
	WHERE ORDERDATE NOT BETWEEN @startDate AND @endDate
),

cte2 as
(

SELECT C.companyname, C.contactname, c.country, c.phone, o.orderid, o.orderdate, c.custid,
datediff(day, @startdate, orderdate )[lastdatesince]

FROM getCustomers GC
INNER JOIN Sales.Customers C
ON C.custid=GC.custid
inner join sales.orders o
on c.custid = o.custid
 and o.orderdate = (
            SELECT max(O2.orderdate)
            FROM Sales.Orders O2
            WHERE O2.custid = o.custid
        )
WHERE 1 = 1
	AND (@startDate IS NULL OR (o.orderdate > @startDate) )

	AND (@endDate IS NULL OR (o.orderdate < @endDate) )
)

select * from cte2
order by orderdate
GO


