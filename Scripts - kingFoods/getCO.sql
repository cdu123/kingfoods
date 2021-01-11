USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[getCO]    Script Date: 1/11/2021 1:30:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getCO] @custid int
AS
SELECT  orderid, orderdate, empid
FROM Sales.OrderS
WHERE custid =@custid
GO


