--Data inserts DML
DECLARE @currencyId INT, @countryId INT

INSERT INTO [dbo].[Currency] VALUES ('US Dollar' , 'USD')
SET @currencyId = SCOPE_IDENTITY()
SELECT @countryId = CountryID FROM tblMstCountry WHERE CountryName = 'UNITED STATES'
INSERT INTO [dbo].[CountryCurrency] VALUES (@countryId, @currencyId)

INSERT INTO [dbo].[Currency] VALUES ('Indian Rupee' , 'INR')
SET @currencyId = SCOPE_IDENTITY()
SELECT @countryId = CountryID FROM tblMstCountry WHERE CountryName = 'INDIA'
INSERT INTO [dbo].[CountryCurrency] VALUES (@countryId, @currencyId)

INSERT INTO [dbo].[Currency] VALUES ('Bolivar Fuerte' , 'VEF')
SET @currencyId = SCOPE_IDENTITY()
SELECT @countryId = CountryID FROM tblMstCountry WHERE CountryName = 'VENEZUELA'
INSERT INTO [dbo].[CountryCurrency] VALUES (@countryId, @currencyId)

INSERT INTO [dbo].[Currency] VALUES ('Euro' , 'EUR')
SET @currencyId = SCOPE_IDENTITY()
SELECT @countryId = CountryID FROM tblMstCountry WHERE CountryName = 'SPAIN'
INSERT INTO [dbo].[CountryCurrency] VALUES (@countryId, @currencyId)
GO

--Data updates
UPDATE dbo.tblMstCountry SET IsoLanguageCode = 'en-US' WHERE CountryName = 'UNITED STATES'
UPDATE dbo.tblMstCountry SET IsoLanguageCode = 'hi-IN' WHERE CountryName = 'INDIA'
UPDATE dbo.tblMstCountry SET IsoLanguageCode = 'es-VE' WHERE CountryName = 'VENEZUELA'
UPDATE dbo.tblMstCountry SET IsoLanguageCode = 'es-ES' WHERE CountryName = 'SPAIN'
GO


