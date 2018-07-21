-- ============================================= 
-- Author:    Yogesh 
-- Create date: 21 Feb 2017 
-- Updated date:22 July 2018
-- Description:  Bulk upload install users. 
-- ============================================= 
ALTER PROCEDURE [dbo].[Udp_bulkinstalluser] @XMLDOC2 XML 
AS 
  BEGIN 
      SET nocount ON; 

      -- all records from xml 
      CREATE TABLE #table_xml 
        ( 
           designationid    INT, 
           status           VARCHAR(50), 
           datesourced      VARCHAR(50), 
           source           VARCHAR(50), 
           sourceid         INT, 
           firstname        VARCHAR(50), 
           lastname         VARCHAR(50), 
           email            VARCHAR(50), 
           phone            VARCHAR(50), 
           phonetype        CHAR(15), 
           phone2           VARCHAR(50), 
           phone2type       CHAR(15), 
           address          VARCHAR(100), 
           zip              VARCHAR (10), 
           state            VARCHAR (30), 
           city             VARCHAR (30), 
           suiteaptroom     VARCHAR(10), 
           notes            VARCHAR(50), 
           primerytradeid   INT, 
           secondorytradeid VARCHAR(50), 
           usertype         VARCHAR(50), 
           sourceuser       VARCHAR(50), 
           actiontaken      VARCHAR(2) 
        ) 

      -- valid data from xml 
      CREATE TABLE #uploadabledata 
        ( 
           designationid    INT, 
           status           VARCHAR(50), 
           datesourced      VARCHAR(50), 
           source           VARCHAR(50), 
           sourceid         INT, 
           firstname        VARCHAR(50), 
           lastname         VARCHAR(50), 
           email            VARCHAR(50), 
           phone            VARCHAR(50), 
           phonetype        CHAR(15), 
           phone2           VARCHAR(50), 
           phone2type       CHAR(15), 
           address          VARCHAR(100), 
           zip              VARCHAR (10), 
           state            VARCHAR (30), 
           city             VARCHAR (30), 
           suiteaptroom     VARCHAR(10), 
           notes            VARCHAR(50), 
           primerytradeid   INT, 
           secondorytradeid VARCHAR(50), 
           usertype         VARCHAR(50), 
           sourceuser       VARCHAR(50), 
           actiontaken      VARCHAR(2) 
        ) 

      DECLARE @rowexistcnt INT 

      INSERT INTO #table_xml 
                  (designationid, 
                   status, 
                   datesourced, 
                   source, 
                   sourceid, 
                   firstname, 
                   lastname, 
                   email, 
                   phone, 
                   phonetype, 
                   phone2, 
                   phone2type, 
                   address, 
                   zip, 
                   state, 
                   city, 
                   suiteaptroom, 
                   notes, 
                   primerytradeid, 
                   secondorytradeid, 
                   usertype, 
                   sourceuser, 
                   actiontaken) 
      SELECT [Table].[Column].value('(DesignationId/text()) [1]', 'INT'), 
             [Table].[Column].value('(status/text()) [1]', 'VARCHAR(50)'), 
             [Table].[Column].value('(DateSourced/text()) [1]', 'VARCHAR(50)'), 
             [Table].[Column].value('(Source/text()) [1]', 'VARCHAR(50)'), 
             [Table].[Column].value('(SourceId/text()) [1]', 'INT'), 
             [Table].[Column].value('(firstname/text()) [1]', 'VARCHAR(50)'), 
             [Table].[Column].value('(lastname/text()) [1]', 'VARCHAR(50)'), 
             [Table].[Column].value('(Email/text()) [1]', 'VARCHAR(50)'), 
             [Table].[Column].value('(phone/text()) [1]', 'VARCHAR(50)'), 
             [Table].[Column].value('(phonetype/text()) [1]', 'VARCHAR(50)'), 
             [Table].[Column].value('(phone2/text()) [1]', 'VARCHAR(50)'), 
             [Table].[Column].value('(phone2type/text()) [1]', 'VARCHAR(50)'), 
             [Table].[Column].value('(address/text()) [1]', 'VARCHAR(50)'), 
             [Table].[Column].value('(zip/text()) [1]', 'VARCHAR(50)'), 
             [Table].[Column].value('(state/text()) [1]', 'VARCHAR(50)'), 
             [Table].[Column].value('(city/text()) [1]', 'VARCHAR(50)'), 
             [Table].[Column].value('(SuiteAptRoom/text()) [1]', 'VARCHAR(50)'), 
             [Table].[Column].value('(Notes/text()) [1]', 'VARCHAR(50)'), 
             [Table].[Column].value('(PrimeryTradeId/text()) [1]', 'int') 
             , 
  [Table].[Column].value('(SecondoryTradeId/text()) [1]', 'VARCHAR(50)'), 
  [Table].[Column].value('(UserType/text()) [1]', 'VARCHAR(50)'), 
  [Table].[Column].value('(SourceUser/text()) [1]', 'VARCHAR(50)'), 
  'U' 
      FROM   @XMLDOC2.nodes('/ArrayOfUser1/user1')AS [Table]([Column]) 

      SELECT @rowexistcnt = Count(*) 
      FROM   #table_xml 
      WHERE  phone NOT IN (SELECT phone 
                           FROM   tblinstallusers 
                           WHERE  phone != '') 
              OR email NOT IN (SELECT email 
                               FROM   tblinstallusers 
                               WHERE  email != '') 

      --insert into #UploadableData 
      --(FirstName,LastName,Email,phone,Designation,Status,Notes,PrimeryTradeId,SecondoryTradeId,Source,UserType,Email2,Phone2,CompanyName,SourceUser,DateSourced)
      --select FirstName,LastName,Email,phone,Designation,Status,Notes,PrimeryTradeId,SecondoryTradeId,Source,UserType,Email2,Phone2,CompanyName,SourceUser,DateSourced
      ----select #table_xml.FirstName,#table_xml.LastName,#table_xml.Email,#table_xml.phone,#table_xml.Designation,#table_xml.Status,#table_xml.Notes,#table_xml.PrimeryTradeId,#table_xml.SecondoryTradeId,#table_xml.Source,#table_xml.UserType,#table_xml.Email2,#table_xml.Phone2,#table_xml.CompanyName,#table_xml.SourceUser,#table_xml.DateSourced 
      --from #table_xml  
      --  #table_xml where  
      --  phone IN (select phone from tblInstallUsers where phone != '') or  
      --  Email IN (select Email from tblInstallUsers where Email != '') 
      --inner join tblInstallUsers on  #table_xml.phone = tblInstallUsers.Phone   
      --or #table_xml.Email = tblInstallUsers.Email  
      IF ( @rowexistcnt > 0 ) 
      BEGIN 
            UPDATE #table_xml 
            SET    actiontaken = 'I' 
            WHERE  phone NOT IN (SELECT phone 
                                 FROM   tblinstallusers 
                                 WHERE  phone != '') 
                    OR email NOT IN (SELECT email 
                                     FROM   tblinstallusers 
                                     WHERE  email != '') 

            INSERT INTO tblinstallusers 
                        ([designationid], 
                         [status], 
                         [datesourced], 
                         source, 
                         sourceid, 
                         fristname, 
                         lastname, 
                         email, 
                         phone, 
                         phonetype, 
                         phone2 
                         --,phone2type 
                         , 
                         address, 
                         zip, 
                         state, 
                         city, 
                         suiteaptroom, 
                         notes, 
                         primerytradeid, 
                         secondorytradeid, 
                         usertype, 
                         sourceuser) 
            SELECT designationid, 
                   status, 
                   datesourced, 
                   source, 
                   sourceid, 
                   firstname, 
                   lastname, 
                   email, 
                   phone, 
                   phonetype, 
                   phone2 
                   --,phone2type 
                   , 
                   address, 
                   zip, 
                   state, 
                   city, 
                   suiteaptroom, 
                   notes, 
                   primerytradeid, 
                   secondorytradeid, 
                   usertype, 
                   sourceuser 
            FROM   #table_xml 
            WHERE  phone NOT IN(SELECT phone 
                                FROM   tblinstallusers 
                                WHERE  phone != '') 
                    OR email NOT IN(SELECT email 
                                    FROM   tblinstallusers 
                                    WHERE  email != '') 

            -- Bulk Upload InstallUserID needs to be corrected so Updating InstallUserID -- correction 1 bulk upload 
            DECLARE @InstallId VARCHAR(50) = NULL 
			DECLARe @designationid INT=NULL
			DECLARE @Id INT=0
			
            DECLARE crsMyTblParams  CURSOR  FOR 
              SELECT userinstallid,designationid,Id 
              FROM   tblinstallusers 
			FOR UPDATE OF userinstallid

            OPEN crsMyTblParams  

            --FETCH next FROM crsMyTblParams  INTO @InstallId 
			FETCH next FROM crsMyTblParams  INTO @InstallId,@designationid,@Id

            WHILE @@FETCH_STATUS = 0 
            BEGIN 
                  PRINT @Id 

                IF (@InstallId IS NULL)  
                BEGIN 
                      -- get sequence of last entered task for perticular designation.   
                      DECLARE @DesSequence BIGINT 
					  DECLARE @DesignationsCode varchar(15)

					  SELECT  @DesignationsCode= DesignationCode FROM tbl_Designation WHERE Id=@designationid
					  PRINT  @DesignationsCode
                      SELECT @DesSequence = lastsequenceno 
                      FROM   tbluserdesiglastsequenceno 
                      WHERE  designationcode = @DesignationsCode 

                      -- if it is first time task is entered for designation start from 001.   
                      IF( @DesSequence IS NULL ) 
                        BEGIN 
                            SET @DesSequence = 0 
                        END 

                      SET @DesSequence = @DesSequence + 1 

                      UPDATE tblinstallusers 
                      SET    userinstallid = @DesignationsCode + '-A' 
                                             + RIGHT('000' + CONVERT(NVARCHAR, 
                                             @DesSequence) 
                                             , 
                                             4) 
                      WHERE  id = @Id 

                      -- INCREMENT SEQUENCE NUMBER FOR DESIGNATION TO USE NEXT TIME   
                      IF NOT EXISTS(SELECT uds.userdesigsequenceid 
                                    FROM   dbo.tbluserdesiglastsequenceno uds 
                                    WHERE  uds.designationcode = 
                                           @DesignationsCode 
                                   ) 
                        BEGIN 
                            INSERT INTO dbo.tbluserdesiglastsequenceno 
                                        (designationcode, 
                                         lastsequenceno) 
                            VALUES      ( @DesignationsCode, 
                                          @DesSequence ) 
                        END 
                      ELSE 
                        BEGIN 
                            UPDATE dbo.tbluserdesiglastsequenceno 
                            SET    dbo.tbluserdesiglastsequenceno.lastsequenceno = @DesSequence 
                            WHERE dbo.tbluserdesiglastsequenceno.designationcode = @DesignationsCode 
                        END 
                  END 
				  FETCH next FROM crsMyTblParams  INTO @InstallId,@designationid,@Id
               END 
                    

            CLOSE crsMyTblParams  

            DEALLOCATE crsMyTblParams  

            --   DECLARE @DesSequence bigint  
            --UPDATE IUSERS SET @DesSequence = LASTSEQNO.LastSequenceNo, 
            --IUSERS.UserInstallId= DESIGN.DesignationCode + '-A'+ Right('000' + CONVERT(NVARCHAR, @DesSequence + 1), 4)  
            --FROM tblInstallUsers IUSERS  Inner Join tblInstallUsers TU on IUSERS.Id=TU.Id 
            --LEFT OUTER JOIN tbl_Designation DESIGN ON TU.DesignationId = DESIGN.Id  
            --LEFT OUTER JOIN tblUserDesigLastSequenceNo LASTSEQNO on LASTSEQNO.DesignationCode=DESIGN.DesignationCode
            SELECT * 
            FROM   #table_xml 
    END 
ELSE 
	BEGIN 
		SELECT * 
		FROM   #table_xml 
	END 

      RETURN; 
  END 