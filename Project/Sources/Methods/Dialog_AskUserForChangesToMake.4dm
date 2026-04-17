//%attributes = {"invisible":true}
// Dialog_AskUserForChangesToMake () : object
// 
// DESCRIPTION
//   Shows the change dialog
//
#DECLARE() : Object
// ----------------------------------------------------
// HISTORY
//   Created by: DB (10/11/2016)
// ----------------------------------------------------

var userMode_fieldChangeDetails : Object
userMode_fieldChangeDetails:=JSON Parse:C1218("{}")

var $vl_winRef : Integer
$vl_winRef:=Open form window:C675("AskUserForChangesToMake_d")
SET WINDOW TITLE:C213("Selected ["+Table name:C256(UserMode_GetCurrentTable)+"] Record Updates...")
DIALOG:C40("AskUserForChangesToMake_d")
CLOSE WINDOW:C154($vl_winRef)

return userMode_fieldChangeDetails
