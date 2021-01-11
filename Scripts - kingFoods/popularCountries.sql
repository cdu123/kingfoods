USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[popularCountries]    Script Date: 1/11/2021 1:31:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[popularCountries]  @startDate datetime2 = NULL, @endDate datetime2 =NULL
AS

SELECT O.shipcountry, COUNT(O.shipcountry)
FROM Sales.Orders O
INNER JOIN Sales.Customers C
 ON O.custid=O.custid


 WHERE 1 = 1
	AND (@startDate IS NULL OR (o.orderdate > @startDate) )

	AND (@endDate IS NULL OR (o.orderdate < @endDate) )
 GROUP BY O.shipcountry
ORDER BY COUNT(O.shipcountry) DESC

GO


