USE [TSQLV4]
GO

/****** Object:  StoredProcedure [dbo].[employeesDetails]    Script Date: 1/11/2021 1:30:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[employeesDetails] @empid int
AS
SELECT empid, firstname, lastname, title, birthdate, hiredate, address, city, country, phone
FROM HR.Employees
WHERE empid =@empid
GO


