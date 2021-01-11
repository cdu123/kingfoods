USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[getSupplier]    Script Date: 1/11/2021 1:31:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getSupplier] @supplierid int
AS

SELECT supplierid, companyname, contactname, contacttitle, address, city, postalcode, country, phone, fax
FROM Production.Suppliers
WHERE supplierid =@supplierid

GO


