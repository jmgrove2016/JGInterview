



Alter procedure [dbo].[UDP_BulkInstallUser]



	@XMLDOC2 xml



AS



BEGIN







SET NOCOUNT ON; 







	-- all records from xml



	CREATE TABLE #table_xml



	(



		DesignationId INT,



		Status VARCHAR(50),



		DateSourced VARCHAR(50),



		Source VARCHAR(50),



		SourceId int,



		FirstName varchar(50),



		LastName varchar(50),



		Email varchar(50),



		phone VARCHAR(50),



		phonetype char(15),



		phone2 VARCHAR(50),



		phone2type char(15),



		Address	varchar(100),



		Zip	varchar	(10),



		State	varchar	(30),



		City	varchar	(30),



		SuiteAptRoom	varchar(10),



		Notes VARCHAR(50),







		PrimeryTradeId int,



		SecondoryTradeId VARCHAR(50),



		UserType VARCHAR(50),



		SourceUser VARCHAR(50),



		ActionTaken VARCHAR(2)



	)







	-- valid data from xml



	CREATE TABLE #UploadableData



	(



		DesignationId INT,



		Status VARCHAR(50),



		DateSourced VARCHAR(50),



		Source VARCHAR(50),



		SourceId int,



		FirstName varchar(50),



		LastName varchar(50),



		Email varchar(50),



		phone VARCHAR(50),



		phonetype char(15),



		phone2 VARCHAR(50),



		phone2type char(15),



		Address	varchar(100),



		Zip	varchar	(10),



		State	varchar	(30),



		City	varchar	(30),



		SuiteAptRoom	varchar(10),



		Notes VARCHAR(50),







		PrimeryTradeId int,



		SecondoryTradeId VARCHAR(50),



		UserType VARCHAR(50),



		SourceUser VARCHAR(50),



		ActionTaken VARCHAR(2)



	)











	DECLARE @rowexistcnt INT







	INSERT INTO #table_xml



		(



			DesignationId



			,Status



			,DateSourced



			,Source



			,SourceId



			,FirstName



			,LastName



			,Email



			,phone



			,phonetype



			,phone2



			,phone2type



			,Address



			,Zip



			,State



			,City



			,SuiteAptRoom



			,Notes







			,PrimeryTradeId



			,SecondoryTradeId



			,UserType



			,SourceUser



			,ActionTaken



		)



	SELECT



		[Table].[Column].value('(DesignationId/text()) [1]','INT')



		,[Table].[Column].value('(status/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(DateSourced/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(Source/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(SourceId/text()) [1]','INT')



		,[Table].[Column].value('(firstname/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(lastname/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(Email/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(phone/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(phonetype/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(phone2/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(phone2type/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(address/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(zip/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(state/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(city/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(SuiteAptRoom/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(Notes/text()) [1]','VARCHAR(50)')







		,[Table].[Column].value('(PrimeryTradeId/text()) [1]','int')



		,[Table].[Column].value('(SecondoryTradeId/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(UserType/text()) [1]','VARCHAR(50)')



		,[Table].[Column].value('(SourceUser/text()) [1]','VARCHAR(50)')



		,'U'



    FROM



		@XMLDOC2.nodes('/ArrayOfUser1/user1')AS [Table]([Column])	











	SELECT @rowexistcnt = count(*) 



	FROM #table_xml 



	WHERE 



		phone NOT IN (



						SELECT phone 



						FROM tblInstallUsers 



						WHERE phone != ''



					) OR 



		Email NOT IN (	



						SELECT Email 



						FROM tblInstallUsers 



						WHERE Email != ''



					)







	  --insert into #UploadableData



			--(FirstName,LastName,Email,phone,Designation,Status,Notes,PrimeryTradeId,SecondoryTradeId,Source,UserType,Email2,Phone2,CompanyName,SourceUser,DateSourced)



	  --select FirstName,LastName,Email,phone,Designation,Status,Notes,PrimeryTradeId,SecondoryTradeId,Source,UserType,Email2,Phone2,CompanyName,SourceUser,DateSourced



	  ----select #table_xml.FirstName,#table_xml.LastName,#table_xml.Email,#table_xml.phone,#table_xml.Designation,#table_xml.Status,#table_xml.Notes,#table_xml.PrimeryTradeId,#table_xml.SecondoryTradeId,#table_xml.Source,#table_xml.UserType,#table_xml.Email
2,#table_xml.Phone2,#table_xml.CompanyName,#table_xml.SourceUser,#table_xml.DateSourced 



	  



	  --from #table_xml 



	  --  #table_xml where 



			--	phone IN (select phone from tblInstallUsers where phone != '') or 



			--	Email IN (select Email from tblInstallUsers where Email != '')







		--inner join tblInstallUsers on  #table_xml.phone = tblInstallUsers.Phone  



		--or #table_xml.Email = tblInstallUsers.Email 







	IF (@rowexistcnt > 0)



	BEGIN



		UPDATE #table_xml 



		SET 



			ActionTaken = 'I'



		WHERE 



			phone NOT IN (select phone from tblInstallUsers where phone != '') or 



			Email NOT IN (select Email from tblInstallUsers where Email != '')







		INSERT INTO tblInstallUsers



	  		(



				[DesignationId]



				,[Status]



				,[DateSourced]



				,Source



				,SourceId



				,FristName



				,LastName



				,Email



				,phone



				,phonetype



				,phone2



				--,phone2type



				,Address



				,Zip



				,State



				,City



				,SuiteAptRoom



				,Notes







				,PrimeryTradeId



				,SecondoryTradeId



				,UserType



				,SourceUser



			)







		SELECT 



				DesignationId



				,Status



				,DateSourced



				,Source



				,SourceId



				,FirstName



				,LastName



				,Email



				,phone



				,phonetype



				,phone2



				--,phone2type



				,Address



				,Zip



				,State



				,City



				,SuiteAptRoom



				,Notes







				,PrimeryTradeId



				,SecondoryTradeId



				,UserType



				,SourceUser



		FROM #table_xml 



		WHERE phone NOT IN(select phone from tblInstallUsers where phone != '') 



				OR 



			Email NOT IN(select Email from tblInstallUsers where Email != '')





         -- Bulk Upload InstallUserID needs to be corrected so Updating InstallUserID -- correction 1 bulk upload

		 

		     Update iu	set iu.UserInstallId=

		     ISNULL((CASE WHEN ISNUMERIC(ISNULL(t.UserInstallId,t.id))>0 THEN 

		            d.DesignationCode + '-A'+ Right('000' + CONVERT(NVARCHAR, ISNULL(t.UserInstallId,t.id)), 4)  

             ELSE

                  ISNULL (t.UserInstallId,t.id) END),ISNULL(t.UserInstallId,t.id))	

		    FROM tblInstallUsers iu  Inner Join tblInstallUsers t on iu.Id=t.Id

		    LEFT OUTER JOIN tbl_Designation d ON t.DesignationId = d.Id 





		SELECT * 



		FROM #table_xml



	END



	ELSE



	BEGIN



		SELECT * FROM #table_xml



	END







	RETURN;



END




