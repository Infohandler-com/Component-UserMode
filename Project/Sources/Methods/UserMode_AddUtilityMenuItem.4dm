//%attributes = {"invisible":true,"shared":true}
// UserMode_AddUtilityMenuItem (MenuItemTitle; MethodToExecute) 
// 
// DESCRIPTION
//   Adds another item so that it will up on the UTILITY menu.
//   The method must be callable from the component.
//
#DECLARE($vt_MenuItemTitle : Text; $vt_MethodToExecute : Text)
// ----------------------------------------------------
// HISTORY
//   Created by: DB (10/07/2016)
// ----------------------------------------------------

If (Asserted:C1132((Count parameters:C259=2); "Expecting two parms"))
	If (Find in array:C230(ar_UTIL_title; $vt_MenuItemTitle)<1)
		APPEND TO ARRAY:C911(ar_UTIL_title; $vt_MenuItemTitle)
		APPEND TO ARRAY:C911(ar_UTIL_method; $vt_MethodToExecute)
	End if 
End if   // ASSERT

