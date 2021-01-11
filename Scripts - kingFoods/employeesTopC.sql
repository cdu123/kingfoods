USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[employeesTopC]    Script Date: 1/11/2021 1:30:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[employeesTopC] @empid int
AS


select top 20 o.custid, count(o.custid), c.companyname, c.country
from Sales.Orders o
inner join Sales.Customers c
on o.custid = c.custid
WHERE o.empid =@empid
group by o.custid, c.companyname, c.country
order by count(o.custid) desc


GO


