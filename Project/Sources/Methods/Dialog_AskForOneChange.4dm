//%attributes = {"invisible":true}
// Dialog_AskForOneChange (tablePtr) : assignmentObj
// 
// DESCRIPTION
//   Shows a dialog that allows the user to specifies
//   the detail of the assign statement they want to 
//   use.
//
#DECLARE($_assignmentTablePtr : Pointer)->$assignmentObj : Object
// ----------------------------------------------------

var _assignmentTablePtr : Pointer
If (Asserted:C1132(Count parameters:C259=1))
	_assignmentTablePtr:=$_assignmentTablePtr
	
	var _assignmentStatementDetails : Object
	_assignmentStatementDetails:=JSON Parse:C1218("{}")
	
	var $vl_winRef : Integer
	$vl_winRef:=Open form window:C675("AskForOneChange_d"; Movable dialog box:K34:7)
	SET WINDOW TITLE:C213("Define Change to Make")
	DIALOG:C40("AskForOneChange_d")
	CLOSE WINDOW:C154($vl_winRef)
	
	return _assignmentStatementDetails
End if 
