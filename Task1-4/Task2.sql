--1: 
USE [VDCom_DB_Test]
GO

SELECT b.[BookID], b.Name
      , bl.[Date],
	  CASE 
    WHEN bl.Date>'2005-01-02' THEN bl.Date    
    ELSE NULL
  END DateNew
  FROM [dbo].[tblBook] AS b
  Left Join tblBookInLibrary AS bl on b.BookID = bl.BookID
GO


--2:
USE [VDCom_DB_Test]
GO

SELECT b.[BookID], b.Name
      , bl.[Date]
  FROM [dbo].[tblBook] AS b
  Left Join tblBookInLibrary AS bl on b.BookID = bl.BookID
  WHERE bl.Date is NULL OR bl.Date > '2005-01-02'
GO
