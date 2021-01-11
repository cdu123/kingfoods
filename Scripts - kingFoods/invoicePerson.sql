USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[invoicePerson]    Script Date: 1/11/2021 1:31:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[invoicePerson] @orderid int
as
SELECT o.orderid, o.custid, o.shipname, o.shipaddress, o.shipcity, o.shippostalcode, o.shipcountry,
c.contactname, c.companyname, c.address, c.city, c.country, c.postalcode, c.phone
FROM Sales.Orders o
inner join Sales.Customers c
on o.custid = c.custid
where orderid=@orderid
GO


