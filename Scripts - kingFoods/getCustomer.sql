USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[getCustomer]    Script Date: 1/11/2021 1:30:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getCustomer] @custid int
AS
SELECT custid, companyname, contactname, contacttitle, address, city, country, phone, fax
FROM Sales.Customers
WHERE custid = @custid
GO


