USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[getSupplierProducts]    Script Date: 1/11/2021 1:31:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getSupplierProducts] @supplierid int
AS

select p.productid, p.productname, c.categoryname, c.description, p.unitprice
from Production.Products p
inner join Production.Categories c
on p.categoryid = c.categoryid
WHERE p.supplierid =@supplierid

GO


