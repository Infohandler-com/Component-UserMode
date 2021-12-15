//%attributes = {}
// UserMode_ShowWithCopyInit (processId) 
// UserMode_ShowWithCopyInit (longint)
//
// DESCRIPTION
//   
//
C_LONGINT:C283($1; $processId)
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (10/22/2019)
// ----------------------------------------------------

If (Asserted:C1132(Count parameters:C259=1))
	$processId:=$1
	
	UserMode_Init($processId)
	
	If (ar_UserMode_TableNames=0)
		UserMode_Show
	Else 
		UserMode_Show(Table:C252(ar_UserMode_TablePtrs{ar_UserMode_TableNames}))
	End if 
	
End if 