 
--usp_isAllExamsGivenByUserId 1144,0
Alter procedure dbo.[usp_isAllExamsGivenByUserId]
(
 @UserID bigint ,         
 @ExamGiven BIT = 0 OUTPUT   
)
As
Begin
	if exists(
	select x.ExamPerformanceStatus from (
	Select case when ExamPerformanceStatus = 0 or ExamPerformanceStatus = 1
	then 'complete' else 'incomplete' end as ExamPerformanceStatus from MCQ_Performance where UserId = @UserID)
	as x where ExamPerformanceStatus = 'incomplete')
	Begin
		set @ExamGiven = 0
	End
	else
	Begin
		set @ExamGiven = 1
	End
End