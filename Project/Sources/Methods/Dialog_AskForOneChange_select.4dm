//%attributes = {"invisible":true}
// Dialog_AskForOneChange_select ()
// 
// DESCRIPTION
//   Does what is needed to keep the ChangeDialog up to date
//
// ----------------------------------------------------
// HISTORY
//   Created by: DB (10/11/2016)
// ----------------------------------------------------

var $RB_useCustomValuePtr; $RB_userValueFromFieldPtr : Pointer
$RB_useCustomValuePtr:=OBJECT Get data source:C1265(*; "rb_customValue")
$RB_userValueFromFieldPtr:=OBJECT Get data source:C1265(*; "rb_fromField")

If ($RB_useCustomValuePtr->=0) & ($RB_userValueFromFieldPtr->=0)
	$RB_useCustomValuePtr->:=1
End if 

OBJECT SET ENABLED:C1123(bContinue; True:C214)

If ($RB_useCustomValuePtr->=1)
	AskForOneChange_selectCustom
End if 

If ($RB_userValueFromFieldPtr->=1)
	AskForOneChange_selectField
End if 