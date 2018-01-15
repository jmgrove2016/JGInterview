USE [JGBS_Interview]
GO
/****** Object:  StoredProcedure [dbo].[UDP_GetDesignationCode]    Script Date: 01/13/2018 11:41:10 AM ******/
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
CREATE PROCEDURE [dbo].[UDP_GetDesignationCode]	
	@DesignationID As Int
	AS
BEGIN
	SET NOCOUNT ON;	
	DECLARE @Out_DesignationCode varchar(10) = '';
	SELECT @Out_DesignationCode From tbl_Designation Where ID = @DesignationID
END

