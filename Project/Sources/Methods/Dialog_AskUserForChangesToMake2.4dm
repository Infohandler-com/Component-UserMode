//%attributes = {"invisible":true}
// Dialog_AskUserForChangesToMake2 () : object
// 
// DESCRIPTION
//   Shows the change dialog
//
// ----------------------------------------------------
// HISTORY
//   Created by: DB (10/11/2016)
// ----------------------------------------------------

C_OBJECT:C1216($0; userMode_fieldChangeDetails)
userMode_fieldChangeDetails:=JSON Parse:C1218("{}")

C_LONGINT:C283($vl_winRef)
$vl_winRef:=Open form window:C675("AskUserForChangesToMake_OLD")
SET WINDOW TITLE:C213("Update Field on Records")
DIALOG:C40("AskUserForChangesToMake_OLD")
CLOSE WINDOW:C154($vl_winRef)

$0:=userMode_fieldChangeDetails
