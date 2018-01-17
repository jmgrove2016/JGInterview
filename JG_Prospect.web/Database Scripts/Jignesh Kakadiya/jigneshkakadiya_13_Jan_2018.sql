USE [JGBS_Interview]
GO
/****** Object:  StoredProcedure [dbo].[UDP_GetDesignationCode]    Script Date: 01/15/2018 7:27:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jignesh Kakadiya
-- Create date:     13-Jan-2018
-- Description:	Returns Designation Code
-- Param:           DesignationID

-- =============================================
ALTER PROCEDURE [dbo].[UDP_GetDesignationCode]	
	@DesignationID As Int
	AS
BEGIN
	SET NOCOUNT ON;	
	DECLARE @Out_DesignationCode varchar(10) = '';
	set @Out_DesignationCode = (select DesignationCode From tbl_Designation Where ID = @DesignationID)
    select @Out_DesignationCode
END

