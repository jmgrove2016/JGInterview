USE [JGBS_Dev]

GO

ALTER TABLE tblInstallUsers
ADD PositionAppliedFor VARCHAR(50)



GO
/****** Object:  StoredProcedure [dbo].[UDP_UpdateInstallUsers]    Script Date: 12/2/2016 4:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UDP_UpdateInstallUsers]  
@id int,  
@FristName varchar(50),  
@LastName varchar(50),  
@Email varchar(100),  
@phone varchar(50),  
@Address varchar(20),  
@Zip varchar(10),  
@State varchar(30),  
@City varchar(30),  
@password varchar(30),
@designation varchar(30),
@status varchar(30),
@Picture varchar(max),  
@attachement varchar(max),
@bussinessname varchar(100),
@ssn varchar(20),
@ssn1 varchar(20),
@ssn2 varchar(20),
@signature varchar(25),
@dob varchar(20),  
@citizenship varchar(50),
@ein1 varchar(20),
@ein2 varchar(20), 
@a varchar(20),
@b varchar(20),
@c varchar(20),
@d varchar(20),
@e varchar(20),
@f varchar(20),
@g varchar(20),
@h varchar(20),
@i varchar(20),
@j varchar(20),
@k varchar(20),
@maritalstatus varchar(20),
@PrimeryTradeId int = 0,
@SecondoryTradeId int = 0,
@Source	varchar(MAX)='',
@Notes	varchar(MAX)='',
@StatusReason varchar(MAX)='',
@GeneralLiability	varchar(MAX) = '',
@PCLiscense	varchar(MAX) = '',
@WorkerComp	varchar(MAX) = '',
@HireDate varchar(50) = '',
@TerminitionDate varchar(50) = '',
@WorkersCompCode varchar(20) = '',
@NextReviewDate	varchar(50) = '',
@EmpType varchar(50) = '',
@LastReviewDate	varchar(50) = '',
@PayRates varchar(50) = '',
@ExtraEarning varchar(MAX) = '',
@ExtraEarningAmt varchar(MAX) = 0,
@PayMethod varchar(50) = '',
@Deduction VARCHAR(MAX) = 0,
@DeductionType varchar(50) = '',
@AbaAccountNo varchar(50) = '',
@AccountNo varchar(50) = '',
@AccountType varchar(50) = '',
@PTradeOthers varchar(100) = '',
@STradeOthers varchar(100) = '',
@DeductionReason varchar(MAX) = '',
@SuiteAptRoom varchar(10) = '',
@FullTimePosition int = 0,
@ContractorsBuilderOwner VARCHAR(500) = '',
@MajorTools VARCHAR(250) = '',
@DrugTest bit = null,
@ValidLicense bit = null,
@TruckTools bit = null,
@PrevApply bit = null,
@LicenseStatus bit = null,
@CrimeStatus bit = null,
@StartDate VARCHAR(50) = '',
@SalaryReq VARCHAR(50) = '',
@Avialability VARCHAR(50) = '',
@ResumePath VARCHAR(MAX) = '',
@skillassessmentstatus bit = null,
@assessmentPath VARCHAR(MAX) = '',
@WarrentyPolicy  VARCHAR(50) = '',
@CirtificationTraining VARCHAR(MAX) = '',
@businessYrs decimal = 0,
@underPresentComp decimal = 0,
@websiteaddress VARCHAR(MAX) = '',
@PersonName VARCHAR(MAX) = '',
@PersonType VARCHAR(MAX) = '',
@CompanyPrinciple VARCHAR(MAX) = '',
@UserType VARCHAR(25) = '',
@Email2	varchar(70)	= '',
@Phone2	varchar(70)	= '',
@CompanyName	varchar(100) = '',
@SourceUser	varchar(10)	= '',
@DateSourced	varchar(50)	= '',
@InstallerType VARCHAR(20) = '',
@BusinessType varchar(50) = '',
@CEO varchar(100) = '',
@LegalOfficer	varchar(100) = '',
@President	varchar(100) = '',
@Owner	varchar(100) = '',
@AllParteners	varchar(MAX) = '',
@MailingAddress	varchar(100) = '',
@Warrantyguarantee	bit = null,
@WarrantyYrs	int = 0,
@MinorityBussiness	bit = null,
@WomensEnterprise	bit = null,
@InterviewTime varchar(20) ='',
@LIBC VARCHAR(5) = '',
@Flag int = 0,

@CruntEmployement bit = null,
@CurrentEmoPlace varchar(100) = '',
@LeavingReason varchar(MAX) = '',
@CompLit bit = null,
@FELONY	bit = null,
@shortterm	varchar(250) = '',
@LongTerm	varchar(250) = '',
@BestCandidate	varchar(MAX) = '',
@TalentVenue	varchar(MAX) = '',
@Boardsites	varchar(300) = '',
@NonTraditional	varchar(MAX) = '',
@ConSalTraning	varchar(100) = '',
@BestTradeOne	varchar(50) = '',
@BestTradeTwo	varchar(50) = '',
@BestTradeThree	varchar(50) = '',

@aOne	varchar(50)	= '',
@aOneTwo	varchar(50)	= '',
@bOne	varchar(50)	= '',
@cOne	varchar(50)	= '',
@aTwo	varchar(50)	= '',
@aTwoTwo	varchar(50)	= '',
@bTwo	varchar(50)	= '',
@cTwo	varchar(50)	= '',
@aThree	varchar(50)	= '',
@aThreeTwo	varchar(50)	= '',
@bThree	varchar(50)	= '',
@cThree	varchar(50)	= '',
@RejectionDate	varchar(50)	='',
@RejectionTime	varchar(50)	='',
@RejectedUserId  int = 0,
@TC bit = null,
@ExtraIncomeType varchar(MAX) = '',
@PositionAppliedFor varchar(50) = '',
@AddedBy int = 0,
@result int output  
as begin  
 update tblInstallUsers set FristName=@FristName,LastName=@LastName,Email=@Email,Phone=@phone,[Address]=@Address,Zip=@Zip,
  [State]=@State,City=@City,[Password]=@password,Designation=@designation,
  [Status]=@status,Picture=@Picture,Attachements=@attachement,Bussinessname=@bussinessname,SSN=@ssn,SSN1=@ssn1,SSN2=@ssn2,[Signature]=@signature,DOB=@dob,
  Citizenship=@citizenship,EIN1=@ein1,EIN2=@ein2,A=@a,B=@b,C=@c,D=@d,E=@e,F=@f,G=@g,H=@h,[5]=@i,[6]=@j,[7]=@k,
  maritalstatus=@maritalstatus,
  PrimeryTradeId=@PrimeryTradeId,
SecondoryTradeId=@SecondoryTradeId,
Source = @Source,
Notes = @Notes,
StatusReason = @StatusReason,
GeneralLiability = @GeneralLiability,
PCLiscense = @PCLiscense,
WorkerComp = @WorkerComp,
HireDate = @HireDate,
TerminitionDate = @TerminitionDate,
WorkersCompCode = @WorkersCompCode,
NextReviewDate = @NextReviewDate,
EmpType = @EmpType,
LastReviewDate = @LastReviewDate,
PayRates = @PayRates,
ExtraEarning = @ExtraEarning,
ExtraEarningAmt = @ExtraEarningAmt,
PayMethod = @PayMethod,
Deduction = @Deduction,
AbaAccountNo = @AbaAccountNo ,
AccountNo = @AccountNo,
AccountType = @AccountType,
DeductionType = @DeductionType,
PTradeOthers = @PTradeOthers,
STradeOthers = @STradeOthers,
DeductionReason = @DeductionReason,
SuiteAptRoom = @SuiteAptRoom,
FullTimePosition = @FullTimePosition
	  ,ContractorsBuilderOwner = @ContractorsBuilderOwner
	  ,MajorTools = @MajorTools
	  ,DrugTest = @DrugTest
	  ,ValidLicense = @ValidLicense
	  ,TruckTools = @TruckTools
	  ,PrevApply = @PrevApply
	  ,LicenseStatus = @LicenseStatus
	  ,CrimeStatus = @CrimeStatus
	  ,StartDate = @StartDate
	  ,SalaryReq = @SalaryReq
	  ,Avialability = @Avialability
	  ,ResumePath = @ResumePath
	  ,skillassessmentstatus = @skillassessmentstatus
	  ,assessmentPath = @assessmentPath
	  ,WarrentyPolicy = @WarrentyPolicy
	  ,CirtificationTraining = @CirtificationTraining
	  ,businessYrs = @businessYrs
	  ,underPresentComp = @underPresentComp
	  ,websiteaddress = @websiteaddress
	  ,PersonName = @PersonName
	  ,PersonType = @PersonType
	  ,CompanyPrinciple = @CompanyPrinciple
	  ,UserType = @UserType
	  ,Email2 = @Email2
	  ,Phone2 = @Phone2
	  ,CompanyName = @CompanyName
	  ,SourceUser = @SourceUser
	  ,DateSourced = @DateSourced
	  ,InstallerType = @InstallerType
	  ,BusinessType = @BusinessType
	  ,CEO = @CEO
	  ,LegalOfficer = @LegalOfficer
	  ,President = @President
	  ,Owner = @Owner
	  ,AllParteners = @AllParteners
	  ,MailingAddress = @MailingAddress
	  ,Warrantyguarantee = @Warrantyguarantee
	  ,WarrantyYrs = @WarrantyYrs
	  ,MinorityBussiness = @MinorityBussiness
	  ,WomensEnterprise = @WomensEnterprise
	  ,InterviewTime = @InterviewTime 
	  ,LIBC = @LIBC
	  ,CruntEmployement = @CruntEmployement,
 CurrentEmoPlace = @CurrentEmoPlace,
 LeavingReason = @LeavingReason,
 CompLit = @CompLit,
 FELONY = @FELONY,
 shortterm = @shortterm,
 LongTerm = @LongTerm,
 BestCandidate = @BestCandidate,
 TalentVenue = @TalentVenue,
 Boardsites = @Boardsites,
 NonTraditional = @NonTraditional,
 ConSalTraning = @ConSalTraning,
BestTradeOne =  @BestTradeOne,
 BestTradeTwo = @BestTradeTwo,
BestTradeThree = @BestTradeThree,

aOne = @aOne,
 aOneTwo = @aOneTwo,
 bOne = @bOne,
 cOne = @cOne,
 aTwo = @aTwo,
aTwoTwo = @aTwoTwo,
bTwo = @bTwo,
cTwo = @cTwo,
aThree = @aThree,
aThreeTwo = @aThreeTwo,
 bThree = @bThree,
cThree = @cThree,
RejectionDate = @RejectionDate,
RejectionTime = @RejectionTime,
RejectedUserId = @RejectedUserId,
TC = @TC,
ExtraIncomeType = @ExtraIncomeType 
,PositionAppliedFor = @PositionAppliedFor

where Id=@id  

				IF @Flag <> 0
				BEGIN
				 INSERT INTO [tblInstalledReport]
					  ([SourceId],[InstallerId],[Status])
				VALUES(Cast(@SourceUser as int),@id,@status)
				END


				IF @status = 'InterviewDate' OR @status = 'Interview Date'
				BEGIN
				--UPDATE tbl_AnnualEvents SET EventDate=@StatusReason where ApplicantId=@id
				                     
				INSERT tbl_AnnualEvents (EventName,EventDate,EventAddedBy,ApplicantId)values('InterViewDetails',@StatusReason,@AddedBy,@id)		
				END



Set @result ='1'  
	   Begin         
		  Set @result ='0'        
	   end  
		return @result  
 end
--modified/created by Other Party












GO
/****** Object:  StoredProcedure [dbo].[UDP_AddInstallUser]    Script Date: 12/2/2016 4:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[UDP_AddInstallUser]  
	@FristName varchar(50),  
	@LastName varchar(50),  
	@Email varchar(100),  
	@phone varchar(20),  
	@phonetype char(15),
	@address varchar(100),  
	@Zip varchar(10),  
	@State varchar(30),  
	@City varchar(30),  

	@Zip2 varchar(10) = null,  
	@State2 varchar(30) = null,  
	@City2 varchar(30) = null,
	  

	@password varchar(50),  
	@designation varchar(50),  
	@status varchar(20),  
	@Picture varchar(max),  
	@Attachements varchar(max),
	@bussinessname varchar(100),
	@ssn varchar(20),
	@ssn1 varchar(20),
	@ssn2 varchar(20),
	@signature varchar(25),
	@dob varchar(20),
	@citizenship varchar(50),
	@ein1 varchar(20),
	@ein2 varchar(20), 
	@a varchar(20),
	@b varchar(20),
	@c varchar(20),
	@d varchar(20),
	@e varchar(20),
	@f varchar(20),
	@g varchar(20),
	@h varchar(20),
	@i varchar(20),
	@j varchar(20),
	@k varchar(20),
	@maritalstatus varchar(20),
	@PrimeryTradeId int = 0,
	@SecondoryTradeId varchar(200) = '',
	@Source	varchar(MAX)='',
	@Notes	varchar(MAX)='',
	@StatusReason varchar(MAX) = '',
	@GeneralLiability	varchar(MAX) = '',
	@PCLiscense	varchar(MAX) = '',
	@WorkerComp	varchar(MAX) = '',
	@HireDate varchar(50) = '',
	@TerminitionDate varchar(50) = '',
	@WorkersCompCode varchar(20) = '',
	@NextReviewDate	varchar(50) = '',
	@EmpType varchar(50) = '',
	@LastReviewDate	varchar(50) = '',
	@PayRates varchar(50) = '',
	@ExtraEarning varchar(max) = '',
	@ExtraEarningAmt varchar(max) = 0,
	@PayMethod varchar(50) = '',
	@Deduction VARCHAR(MAX) = '',
	@DeductionType varchar(50) = '',
	@AbaAccountNo varchar(50) = '',
	@AccountNo varchar(50) = '',
	@AccountType varchar(50) = '',
	@InstallId VARCHAR(MAX) = '',
	@PTradeOthers varchar(100) = '',
	@STradeOthers varchar(100) = '',
	@DeductionReason varchar(MAX) = '',
	@SuiteAptRoom varchar(10) = '',
	@FullTimePosition int = 0,
	@ContractorsBuilderOwner VARCHAR(500) = '',
	@MajorTools VARCHAR(250) = '',
	@DrugTest bit = null,
	@ValidLicense bit = null,
	@TruckTools bit = null,
	@PrevApply bit = null,
	@LicenseStatus bit = null,
	@CrimeStatus bit = null,
	@StartDate VARCHAR(50) = '',
	@SalaryReq VARCHAR(50) = '',
	@Avialability VARCHAR(50) = '',
	@ResumePath VARCHAR(MAX) = '',
	@skillassessmentstatus bit = null,
	@assessmentPath VARCHAR(MAX) = '',
	@WarrentyPolicy  VARCHAR(50) = '',
	@CirtificationTraining VARCHAR(MAX) = '',
	@businessYrs decimal = 0,
	@underPresentComp decimal = 0,
	@websiteaddress VARCHAR(MAX) = '',
	@PersonName VARCHAR(MAX) = '',
	@PersonType VARCHAR(MAX) = '',
	@CompanyPrinciple VARCHAR(MAX) = '',
	@UserType VARCHAR(25) = '',
	@Email2	varchar(70)	= '',
	@Phone2	varchar(70)	= '',
	@CompanyName	varchar(100) = '',
	@SourceUser	varchar(10)	= '',
	@DateSourced	varchar(50)	= '',
	@InstallerType varchar(20) = '',
	@BusinessType varchar(50) = '',
	@CEO varchar(100) = '',
	@LegalOfficer	varchar(100) = '',
	@President	varchar(100) = '',
	@Owner	varchar(100) = '',
	@AllParteners	varchar(MAX) = '',
	@MailingAddress	varchar(100) = '',
	@Warrantyguarantee	bit = null,
	@WarrantyYrs	int = 0,
	@MinorityBussiness	bit = null,
	@WomensEnterprise	bit = null,
	@InterviewTime varchar(20) ='',
	@ActivationDate	varchar(50)	= '',
	@UserActivated	varchar(100) = '',
	@LIBC VARCHAR(5) = '',

	@CruntEmployement bit = null,
	@CurrentEmoPlace varchar(100) = '',
	@LeavingReason varchar(MAX) = '',
	@CompLit bit = null,
	@FELONY	bit = null,
	@shortterm	varchar(250) = '',
	@LongTerm	varchar(250) = '',
	@BestCandidate	varchar(MAX) = '',
	@TalentVenue	varchar(MAX) = '',
	@Boardsites	varchar(300) = '',
	@NonTraditional	varchar(MAX) = '',
	@ConSalTraning	varchar(100) = '',
	@BestTradeOne	varchar(50) = '',
	@BestTradeTwo	varchar(50) = '',
	@BestTradeThree	varchar(50) = '',

	@aOne	varchar(50)	= '',
	@aOneTwo	varchar(50)	= '',
	@bOne	varchar(50)	= '',
	@cOne	varchar(50)	= '',
	@aTwo	varchar(50)	= '',
	@aTwoTwo	varchar(50)	= '',
	@bTwo	varchar(50)	= '',
	@cTwo	varchar(50)	= '',
	@aThree	varchar(50)	= '',
	@aThreeTwo	varchar(50)	= '',
	@bThree	varchar(50)	= '',
	@cThree	varchar(50)	= '',
	@RejectionDate	varchar(50)	='',
	@RejectionTime	varchar(50)	='',
	@RejectedUserId  int = 0,
	@TC bit = null,
	@ExtraIncomeType varchar(MAX) = '',
	@AddedBy int = 0,
	@PositionAppliedFor varchar(50)	='',
	@Id int out,
	@result bit output  

AS BEGIN  

	DECLARE @MaxId int = 0

	INSERT INTO tblInstallUsers   
		(  
			FristName,LastName,Email,Phone,phonetype,[Address],Zip,[State],[City],
			Zip2,[State2],[City2],

			[Password],Designation,[Status],Picture,Attachements,Bussinessname,SSN,SSN1,SSN2,[Signature]
			,DOB,Citizenship,EIN1,EIN2,A,B,C,D,E,F,G,H,[5],[6],[7],maritalstatus,PrimeryTradeId
			,SecondoryTradeId,Source,Notes,StatusReason,GeneralLiability,PCLiscense,WorkerComp,HireDate,TerminitionDate,WorkersCompCode,NextReviewDate,EmpType,LastReviewDate
			,PayRates,ExtraEarning,ExtraEarningAmt,PayMethod,Deduction,DeductionType,AbaAccountNo,AccountNo,AccountType
			,InstallId,PTradeOthers,STradeOthers,DeductionReason,SuiteAptRoom,FullTimePosition,ContractorsBuilderOwner,MajorTools,DrugTest,ValidLicense,TruckTools
			,PrevApply,LicenseStatus,CrimeStatus,StartDate,SalaryReq,Avialability,ResumePath,skillassessmentstatus,assessmentPath,WarrentyPolicy,CirtificationTraining
			,businessYrs,underPresentComp,websiteaddress,PersonName,PersonType,CompanyPrinciple,UserType,Email2,Phone2,CompanyName,SourceUser,DateSourced,InstallerType
			,BusinessType,CEO,LegalOfficer,President,Owner,AllParteners,MailingAddress,Warrantyguarantee,WarrantyYrs,MinorityBussiness,WomensEnterprise,InterviewTime
			,ActivationDate,UserActivated,LIBC,CruntEmployement,CurrentEmoPlace,LeavingReason,CompLit,FELONY,shortterm,LongTerm,BestCandidate,TalentVenue,Boardsites
			,NonTraditional,ConSalTraning,BestTradeOne,BestTradeTwo,BestTradeThree,aOne,aOneTwo,bOne,cOne,aTwo,aTwoTwo,bTwo,cTwo,aThree,aThreeTwo,bThree,cThree
			,RejectionDate,RejectionTime,RejectedUserId,TC,ExtraIncomeType
			,PositionAppliedFor
		)  
	VALUES  
		(  
			@FristName,@LastName,@Email,@phone,@phonetype,@address,@Zip,@State,@City,
			
			@Zip2,@State2,@City2,

			@password,@designation,@status,@Picture,@Attachements,@bussinessname,@ssn,@ssn1,@ssn2,@signature
			,@dob,@citizenship,@ein1,@ein2,@a,@b,@c,@d,@e,@f,@g,@h,@i,@j,@k,@maritalstatus,@PrimeryTradeId,@SecondoryTradeId,@Source,@Notes,@StatusReason,@GeneralLiability
			,@PCLiscense,@WorkerComp,@HireDate,@TerminitionDate,@WorkersCompCode,@NextReviewDate,@EmpType,@LastReviewDate
			,@PayRates,@ExtraEarning,@ExtraEarningAmt,@PayMethod,@Deduction,@DeductionType,@AbaAccountNo,@AccountNo,@AccountType,@InstallId,@PTradeOthers,@STradeOthers
			,@DeductionReason,@SuiteAptRoom,@FullTimePosition,@ContractorsBuilderOwner,@MajorTools,@DrugTest,@ValidLicense,@TruckTools,@PrevApply,@LicenseStatus
			,@CrimeStatus,@StartDate,@SalaryReq,@Avialability,@ResumePath,@skillassessmentstatus,@assessmentPath,@WarrentyPolicy,@CirtificationTraining,@businessYrs
			,@underPresentComp,@websiteaddress,@PersonName,@PersonType,@CompanyPrinciple,@UserType,@Email2,@Phone2,@CompanyName,@SourceUser,@DateSourced,@InstallerType
			,@BusinessType,@CEO,@LegalOfficer,@President,@Owner,@AllParteners,@MailingAddress,@Warrantyguarantee,@WarrantyYrs,@MinorityBussiness,@WomensEnterprise,@InterviewTime
			,@ActivationDate,@UserActivated,@LIBC,@CruntEmployement,@CurrentEmoPlace,@LeavingReason,@CompLit,@FELONY,@shortterm,@LongTerm,@BestCandidate,@TalentVenue
			,@Boardsites,@NonTraditional,@ConSalTraning,@BestTradeOne,@BestTradeTwo,@BestTradeThree,@aOne,@aOneTwo,@bOne,@cOne,@aTwo,@aTwoTwo,@bTwo,@cTwo,@aThree,@aThreeTwo
			,@bThree,@cThree,@RejectionDate,@RejectionTime,@RejectedUserId,@TC,@ExtraIncomeType
			,@PositionAppliedFor
		) 

	SELECT @Id = SCOPE_IDENTITY();

	SELECT @MaxId = MAX(Id) FROM tblInstallUsers

	INSERT INTO [tblInstalledReport]
				([SourceId],[InstallerId],[Status])
		VALUES(Cast(@SourceUser as int),@MaxId,@status)

		IF @status = 'InterviewDate' OR @status = 'Interview Date'
		BEGIN
		INSERT INTO tbl_AnnualEvents(EventName,EventDate,EventAddedBy,ApplicantId)
								VALUES('InterViewDetails',@StatusReason,@AddedBy,@MaxId)--CAST(@SourceUser as int)(Added by Sandeep...)

		END


	SET @result ='1'  
  
	RETURN @result  
  
 END

GO

/****** Object:  StoredProcedure [dbo].[Sp_InsertUpdateUserPhone]    Script Date: 12/2/2016 4:50:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Bhavik J. Vaishnani
-- Create date: 23-11-2016
-- Description:	Insert/ Update User Phone
-- =============================================
CREATE PROCEDURE [dbo].[Sp_InsertUpdateUserPhone] 
	-- Add the parameters for the stored procedure here
	@isPrimaryPhone bit,
	@phoneText varchar(256),
	@phoneType varchar(50),
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM tblUserPhone WHERE UserID = @UserID


    INSERT INTO [dbo].[tblUserPhone]
           ([Phone]
           ,[IsPrimary]
           ,[PhoneTypeID]
           ,[UserID])
     VALUES
           (@phoneText
           ,@isPrimaryPhone
           ,@phoneType
           ,@UserID)
	
END

GO











GO

/****** Object:  StoredProcedure [dbo].[SP_GetUserEmailByUserId]    Script Date: 12/2/2016 4:51:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Bhavik J. Vaishnani.
-- Create date: 22-11-2016
-- Description:	get List of all email Id on the base of UserID
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetUserEmailByUserId] 
	-- Add the parameters for the stored procedure here
	@UserID int = 0
	  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From tblUserEmail tue where  tue.UserID = @UserID
END

GO












GO

/****** Object:  StoredProcedure [dbo].[SP_InsertUserEmail]    Script Date: 12/2/2016 4:51:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Bhavik
-- Create date: 22-11-2016
-- Description:	Insert email data
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertUserEmail] 
	-- Add the parameters for the stored procedure here
	@EmailID varchar(max), 
	@UserID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

---SPLIT THE VALUE --- START--
DECLARE @Split char(3),
        @X xml

SELECT @Split = '|,|'



SELECT @X = CONVERT(xml,' <root> <s>' + REPLACE(@EmailID,@Split,'</s> <s>') + '</s>   </root> ')
---SPLIT THE VALUE --- END--


DELETE FROM tblUserEmail WHERE UserID = @UserID

IF @EmailID <> ''
BEGIN
		INSERT INTO [dbo].[tblUserEmail]
				   ([emailID]
				   ,[IsPrimary]
				   ,[UserID])
		 SELECT [Value] = T.c.value('.','varchar(255)') , 0 ,@UserID
		FROM @X.nodes('/root/s') T(c)

END



END

GO











GO

/****** Object:  StoredProcedure [dbo].[USP_CheckDuplicateSalesUser]    Script Date: 12/2/2016 4:52:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Bhavik
-- Create date: 12-11-2016
-- Description:	Return ID if respective duplicate value is found
-- =============================================
ALTER PROCEDURE [dbo].[USP_CheckDuplicateSalesUser] 
	-- Add the parameters for the stored procedure here
    @CurrentID INT,
	@DataForValidation NVARCHAR(100),
	@DataType INT,
	@PhoneTypeID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Message NVARCHAR(1000)='';
	DECLARE @USERID INT;

	IF(@DataType = 1 ) --#Check Phone Number
	BEGIN 
		IF EXISTS (SELECT Id FROM tblInstallUsers WHERE Phone = @DataForValidation AND ID <> @CurrentID) --#This will work for Edit page also
		BEGIN
		 
		 SELECT @USERID = Id FROM tblInstallUsers WHERE Phone = @DataForValidation AND ID <> @CurrentID
			SET @Message = CONVERT(VARCHAR(20), @USERID)+'# Contact number already exists'
		END
		
		--ELSE IF EXISTS (SELECT UserPhoneID FROM tblUserPhone WHERE Phone = @DataForValidation AND PhoneTypeID = @PhoneTypeID AND UserID <> @CurrentID)
		ELSE IF EXISTS (SELECT UserPhoneID FROM tblUserPhone WHERE Phone = @DataForValidation AND UserID <> @CurrentID)
		BEGIN
				--SELECT @USERID = UserID FROM tblUserPhone WHERE Phone = @DataForValidation AND PhoneTypeID = @PhoneTypeID AND UserID <> @CurrentID
				SELECT @USERID = UserID FROM tblUserPhone WHERE Phone = @DataForValidation AND UserID <> @CurrentID
					SET @Message = CONVERT(VARCHAR(20), @USERID)+'# Contact number already exists'
		END
	END
	ELSE IF(@DataType = 2) --#Check Email ID
	BEGIN 
		
		IF EXISTS (SELECT Id FROM tblInstallUsers WHERE Email = @DataForValidation AND ID <> @CurrentID) --#This will work for Edit page also
		BEGIN
			SELECT @USERID = Id FROM tblInstallUsers WHERE Email = @DataForValidation AND ID <> @CurrentID
			   SET @Message = CONVERT(VARCHAR(20), @USERID) +  '#Email ID already exists'
		END
		ELSE IF EXISTS (SELECT UserEmailID FROM tblUserEmail WHERE emailID = @DataForValidation AND UserID <> @CurrentID) --#This will work for Edit page also
		BEGIN
			SELECT @USERID = UserID FROM tblUserEmail WHERE emailID = @DataForValidation AND UserID <> @CurrentID
			   SET @Message = CONVERT(VARCHAR(20), @USERID) +  '#Email ID already exists'
		END
		

	END
		
	SELECT @Message
END

GO


