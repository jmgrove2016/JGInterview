USE [JGBS]
GO
/****** Object:  StoredProcedure [dbo].[SP_AddUpdateUserAuditRecord]    Script Date: 11/30/2016 11:41:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Bhavik Vaishnani
-- Create date: 12-oct-2106
-- Description:	To Insert / Update User Audit Entery
-- =============================================
ALTER PROCEDURE [dbo].[SP_AddUpdateUserAuditRecord] 
	-- Add the parameters for the stored procedure here
	@LogInGuID nvarchar (40), 
	@UserLoginID nvarchar (260),
	@Description nvarchar (260),
	@CurrentActionTime DateTime
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @AuditID INT;
	DECLARE @Delimiter varchar(5) = ' |:| ';

	--SELECT @AuditID = ISNULL(AuditID,0)
	--	FROM tblUserAuditTrail
	--	WHERE LogInGuID = @LogInGuID;

IF EXISTS (SELECT AuditID 
			FROM tblUserAuditTrail
			WHERE LogInGuID = @LogInGuID)
	BEGIN

	UPDATE [dbo].[tblUserAuditTrail]
    SET 
		[Description] = [Description] + ' || ' + CONVERT(VARCHAR(10), GETDATE(), 10) + ' ' + CONVERT(VARCHAR(8), GETDATE(), 108) + @Delimiter + @Description
		, [LastActionOn] = @CurrentActionTime
	        
	WHERE LogInGuID = @LogInGuID
	
	END
ELSE
	BEGIN

	INSERT INTO [dbo].[tblUserAuditTrail]
           ([UserLoginID]
           ,[Description]
           ,[LastLoginOn]
		   ,[LastActionOn]      
           ,[LogInGuID])
     VALUES
		(@UserLoginID
--		, CONVERT(VARCHAR(10), GETDATE(), 10) + ' ' + CONVERT(VARCHAR(8), GETDATE(), 108) + @Delimiter + ' Login - ' + @Description
		, CONVERT(VARCHAR(10), GETDATE(), 10) + ' ' + CONVERT(VARCHAR(8), GETDATE(), 108) + @Delimiter  + @Description
		,GETDATE()
		,GETDATE()
		,@LogInGuID)

	END

END
