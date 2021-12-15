//%attributes = {"invisible":true,"shared":true}
// UserMode_AddUtilityMenuItem (MenuItemTitle; MethodToExecute) 
// UserMode_AddUtilityMenuItem (text; text) 
// 
// DESCRIPTION
//   Adds another item so that it will up on the UTILITY menu.
//   The method must be callable from the component.
//
C_TEXT:C284($1; $vt_MenuItemTitle)
C_TEXT:C284($2; $vt_MethodToExecute)
// ----------------------------------------------------
// HISTORY
//   Created by: DB (10/07/2016)
// ----------------------------------------------------

If (Asserted:C1132((Count parameters:C259=2); "Expecting two parms"))
	$vt_MenuItemTitle:=$1
	$vt_MethodToExecute:=$2
	
	If (Find in array:C230(ar_UTIL_title; $vt_MenuItemTitle)<1)
		APPEND TO ARRAY:C911(ar_UTIL_title; $vt_MenuItemTitle)
		APPEND TO ARRAY:C911(ar_UTIL_method; $vt_MethodToExecute)
	End if 
End if   // ASSERT

