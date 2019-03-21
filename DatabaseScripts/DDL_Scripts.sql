--DDL

--Currency
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Currency ADD
	IsoCode varchar(4) NULL
GO
COMMIT

BEGIN TRANSACTION
GO
ALTER TABLE dbo.Currency ALTER COLUMN Name nvarchar(30) NOT NULL
GO
COMMIT
--Currency

--tblMstCountry
BEGIN TRANSACTION
GO
ALTER TABLE tblMstCountry ADD  [IsoLanguageCode] varchar(5) NULL
GO
COMMIT
--tblMstCountry

--CountryCurrency
BEGIN TRANSACTION
GO
CREATE TABLE dbo.CountryCurrency
	(
	Id int NOT NULL IDENTITY (1, 1),
	CountryId int NOT NULL,
	CurrencyId int NOT NULL
	)  ON [PRIMARY]
GO

ALTER TABLE dbo.CountryCurrency ADD CONSTRAINT
	PK_CountryCurrency PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE dbo.CountryCurrency ADD CONSTRAINT
	FK_CountryCurrency_tblMstCountry FOREIGN KEY
	(
	CountryId
	) REFERENCES dbo.tblMstCountry
	(
	CountryID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 	
GO

ALTER TABLE dbo.CountryCurrency ADD CONSTRAINT
	FK_CountryCurrency_Currency FOREIGN KEY
	(
	CurrencyId
	) REFERENCES dbo.Currency
	(
	CurrencyId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 	
GO
COMMIT
--CountryCurrency

--GetAllCurrencyCountryCode

-- =============================================  
-- Author:  Andreidy Rosa  
-- Create date: 03/20/2019
-- Description: Get all currency's country code.
-- =============================================  
CREATE PROCEDURE GetAllCurrencyCountryCode    
AS  
BEGIN  
	SET NOCOUNT ON;  
  
	SELECT cr.CurrencyId, ct.CountryCode, ct.IsoLanguageCode 
	FROM tblMstCountry ct INNER JOIN CountryCurrency cc ON ct.CountryID = cc.CountryId
						  INNER JOIN Currency cr ON cr.CurrencyId = cc.CurrencyId  
END

--GetAllCurrencyCountryCode