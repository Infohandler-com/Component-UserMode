//%attributes = {"invisible":true}
// Dialog_AskForOneChange (tablePtr) : assignmentObj
// Dialog_AskForOneChange (pointer) : object
// 
// DESCRIPTION
//   Shows a dialog that allows the user to specifies
//   the detail of the assign statement they want to 
//   use.
//
C_POINTER:C301($1; _assignmentTablePtr)
C_OBJECT:C1216($0; $assignmentObj)
// ----------------------------------------------------
// HISTORY
//   Created by: DB (07/27/2017)
// ----------------------------------------------------

If (Asserted:C1132(Count parameters:C259=1))
	_assignmentTablePtr:=$1
	
	C_OBJECT:C1216(_assignmentStatementDetails)
	_assignmentStatementDetails:=JSON Parse:C1218("{}")
	
	C_LONGINT:C283($vl_winRef)
	$vl_winRef:=Open form window:C675("AskForOneChange_d"; Movable dialog box:K34:7)
	SET WINDOW TITLE:C213("Define Change to Make")
	DIALOG:C40("AskForOneChange_d")
	CLOSE WINDOW:C154($vl_winRef)
	
	$0:=_assignmentStatementDetails
	CLEAR VARIABLE:C89(_assignmentStatementDetails)
End if 
