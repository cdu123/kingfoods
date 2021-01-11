USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[invoice]    Script Date: 1/11/2021 1:31:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[invoice] @orderid int
as
SELECT orderdate, orderid, custid, shippeddate, requireddate, DATEADD(day, 60, orderdate)[duedate]
FROM Sales.Orders
where orderid=@orderid
GO


