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
#DECLARE() : Object

var userMode_fieldChangeDetails : Object
userMode_fieldChangeDetails:=JSON Parse:C1218("{}")

var $vl_winRef : Integer
$vl_winRef:=Open form window:C675("AskUserForChangesToMake_OLD")
SET WINDOW TITLE:C213("Update Field on Records")
DIALOG:C40("AskUserForChangesToMake_OLD")
CLOSE WINDOW:C154($vl_winRef)

return userMode_fieldChangeDetails
