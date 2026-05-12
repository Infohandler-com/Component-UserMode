//%attributes = {}
// Menu_NewWindow ()
//
// DESCRIPTION
//   
//
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (10/22/2019)
// ----------------------------------------------------

var $procId : Integer

$procId:=New process:C317("UserMode_ShowWithCopyInit"; 0; "UserMode_"+String:C10(Milliseconds:C459); Current process:C322)