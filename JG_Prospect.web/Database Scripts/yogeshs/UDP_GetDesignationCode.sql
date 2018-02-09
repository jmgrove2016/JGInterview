USE [JGBS_Interview]
GO

/****** Object:  StoredProcedure [dbo].[UDP_GetDesignationCode]    Script Date: 2/9/2018 10:59:29 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jaylem
-- Create date: 26-Nov-2016
-- Description:	Returns all/selected Designation 

-- Updated : Added DesignationCode.
--		date: 22 Mar 2017
--		by : Yogesh
-- =============================================
alter PROCEDURE [dbo].[UDP_GetDesignationCode]
	@Key As Int
	AS
BEGIN
	SET NOCOUNT ON;	
	
	SELECT ds.ID
	,ds.DesignationName
	,ds.IsActive
	,ds.DepartmentID
	,ds.DesignationCode
	FROM tbl_Designation ds
	WHERE ds.ID = @Key

END


GO


