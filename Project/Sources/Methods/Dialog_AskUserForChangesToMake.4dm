//%attributes = {"invisible":true}
// Dialog_AskUserForChangesToMake () : object
// 
// DESCRIPTION
//   Shows the change dialog
//
C_OBJECT:C1216($0; userMode_fieldChangeDetails)
// ----------------------------------------------------
// HISTORY
//   Created by: DB (10/11/2016)
// ----------------------------------------------------

userMode_fieldChangeDetails:=JSON Parse:C1218("{}")

C_LONGINT:C283($vl_winRef)
$vl_winRef:=Open form window:C675("AskUserForChangesToMake_d")
SET WINDOW TITLE:C213("Selected ["+Table name:C256(UserMode_GetCurrentTable)+"] Record Updates...")
DIALOG:C40("AskUserForChangesToMake_d")
CLOSE WINDOW:C154($vl_winRef)

$0:=userMode_fieldChangeDetails
