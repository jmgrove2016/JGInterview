CREATE PROCEDURE usp_GetTaskMultilevelChildInfo  
(  
@TaskId INT  
)  
AS  
BEGIN  
   SELECT (SELECT TOP 1 InstallId FROM tblTask WHERE TaskId=@TaskId) AS InstallId,  
   IndentLevel AS Indent, Label AS LastChild FROM tblTaskMultilevelList         
      WHERE Id = (SELECT MAX(Id) FROM tblTaskMultilevelList WHERE ParentTaskId = @TaskId)  
END

GO

CREATE procedure usp_DeleteSubTaskChild
(@Id int)
AS
begin
declare @IndentLevel int declare @ParentTaskId int
set @ParentTaskId = (select ParentTaskId from tblTaskMultilevelList where Id=@Id)
set @IndentLevel = (select IndentLevel from tblTaskMultilevelList where Id=@Id)
delete from tblTaskMultilevelList where Id=@Id

if @IndentLevel=3
	begin
	update tblTaskMultilevelList 
	set Label=lower(char(((CAST(CAST(Label AS VARBINARY(4)) AS INT)-96)-1)+64))
		where 
		ParentTaskId=@ParentTaskId
		and 
		IndentLevel=@IndentLevel 
		and
		Id>@Id 
		--order by Id
	end
if @IndentLevel=2
	begin
	update tblTaskMultilevelList 
	set Label=lower(dbo.ToRomanNumerals(dbo.FromRomanNumerals(upper(Label))-1))
		where 
		ParentTaskId=@ParentTaskId
		and 
		IndentLevel=@IndentLevel 
		and
		Id>@Id 
		--order by Id
	end
if @IndentLevel=1
	begin
	update tblTaskMultilevelList 
	set Label=dbo.ToRomanNumerals(dbo.FromRomanNumerals(Label)-1)
		where 
		ParentTaskId=@ParentTaskId
		and 
		IndentLevel=@IndentLevel 
		and
		Id>@Id 
		--order by Id
	end

end

GO

-- =============================================      
-- Author:  Yogesh,Kapil      
-- Create date: 14 Nov 16      
-- Description: Inserts, Updates or Deletes a task.      
-- =============================================      
ALTER PROCEDURE [dbo].[SP_SaveOrDeleteTask]        
  @Mode tinyint, -- 0:Insert, 1: Update, 2: Delete        
  @TaskId bigint,        
  @Title varchar(250),        
  @Url varchar(250),      
  @Description varchar(MAX),        
  @Status tinyint,        
  @DueDate datetime = NULL,        
  @Hours varchar(25),      
  @CreatedBy int,       
  @InstallId varchar(50) = NULL,      
  @ParentTaskId bigint = NULL,      
  @TaskType tinyint = NULL,      
  @TaskLevel int,      
  @MainTaskId int,      
  @TaskPriority tinyint = null,      
  @IsTechTask bit = NULL,      
  @DeletedStatus TINYINT = 9,      
  @Sequence bigint = NULL,    
  @Result int output      
AS        
BEGIN        
        
 IF @Mode=0        
   BEGIN        
  INSERT INTO tblTask       
    (      
     Title,      
     Url,      
     [Description],      
     [Status],      
     DueDate,      
     [Hours],      
     CreatedBy,      
     CreatedOn,      
     IsDeleted,      
     InstallId,      
     ParentTaskId,      
     TaskType,      
     TaskPriority,      
     IsTechTask,      
     AdminStatus,      
     TechLeadStatus,      
     OtherUserStatus,      
     TaskLevel,      
     MainParentId      
    )      
  VALUES      
    (      
     @Title,      
     @Url,      
     @Description,      
     @Status,      
     @DueDate,      
     @Hours,      
     @CreatedBy,      
     GETDATE(),      
     0,      
     @InstallId,      
     @ParentTaskId,      
     @TaskType,      
     @TaskPriority,      
     @IsTechTask,      
     0,      
     0,      
     0,      
     @TaskLevel,      
     @MainTaskId      
    )        
        
  SET @Result=SCOPE_IDENTITY ()        
        
 --- Update task sequence    
   IF(@Result > 0)    
   BEGIN    
    
    
   -- if sequence is already assigned to some other task, all sequence will push back by 1 from alloted sequence.    
    IF EXISTS(SELECT TaskId FROM tblTask WHERE [Sequence] = @Sequence AND TaskId <> @Result)    
    BEGIN    
    
     UPDATE       tblTask    
     SET                [Sequence] = [Sequence] + 1       
     WHERE        ([Sequence] >= @Sequence)    
    
    END    
      
     UPDATE tblTask    
     SET                [Sequence] = @Sequence     
     WHERE        (TaskId = @Result)    
    
    
      END    
  
 --AUTO SEQUENCING: Assign Next Sequence to the newly inserted task  
 declare @Seq int  
 declare @SequenceDesignationId int  
 if exists(select top 1 [Sequence],  [SequenceDesignationId] from tblTask where ParentTaskId=@ParentTaskId and [Sequence] is not null   and [SequenceDesignationId] is not null)
 BEGIN
	 select top 1 @Seq=[Sequence],  
		 @SequenceDesignationId=[SequenceDesignationId]  
		 from tblTask   
		 where ParentTaskId=@ParentTaskId
		 and [Sequence] is not null   
		 and [SequenceDesignationId] is not null  
	 order by TaskId desc  
  END
  ELSE
  BEGIN
	select @Seq=[Sequence],  
		 @SequenceDesignationId=[SequenceDesignationId]  
		 from tblTask
		 where TaskId=@ParentTaskId
  END
 update tblTask set [Sequence]=@Seq+1, [SequenceDesignationId]=@SequenceDesignationId  
  where TaskId=@Result  
 --AUTO SEQUENCING  
    
  RETURN @Result        
 END        
 ELSE IF @Mode=1 -- Update        
 BEGIN          
  UPDATE tblTask        
  SET        
   Title=@Title,        
   Url = @Url,      
   [Description]=@Description,        
   [Status]=@Status,        
   DueDate=@DueDate,        
   [Hours]=@Hours,      
   [TaskType] = @TaskType,      
   [TaskPriority] = @TaskPriority,      
   [IsTechTask] = @IsTechTask      
  WHERE TaskId=@TaskId        
      
  SET @Result= @TaskId      
        
  RETURN @Result        
 END        
 ELSE IF @Mode=2 --Delete        
 BEGIN        
  UPDATE tblTask        
  SET        
   IsDeleted=1,      
   [Status] = @DeletedStatus      
  WHERE TaskId=@TaskId OR ParentTaskId=@TaskId        
 END        
        
END 