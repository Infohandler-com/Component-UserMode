//%attributes = {"invisible":true,"shared":true}
// UserMode_AddSpecialAction (tablePtr, actionName, callbackMethod)
// UserMode_AddSpecialAction (pointer, text, text)
//
// DESCRIPTION
//   
//
C_POINTER:C301($1; $tablePtr)
C_TEXT:C284($2; $actionName)
C_TEXT:C284($3; $callbackMethod)
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (02/14/2019)
// ----------------------------------------------------

If (Asserted:C1132(Count parameters:C259=3))
	$tablePtr:=$1
	$actionName:=$2
	$callbackMethod:=$3
	
	UserMode_Init
	
	C_TEXT:C284($tableObjName)
	$tableObjName:="t"+String:C10(Table:C252($tablePtr))
	
	ARRAY OBJECT:C1221($tableActionDetailsArray; 0)
	If (OB Is defined:C1231(UserMode_actionObj; $tableObjName))
		OB GET ARRAY:C1229(UserMode_actionObj; $tableObjName; $tableActionDetailsArray)
	End if 
	
	C_OBJECT:C1216($actionObj)
	OB SET:C1220($actionObj; "name"; $actionName)
	OB SET:C1220($actionObj; "callback"; $callbackMethod)
	
	APPEND TO ARRAY:C911($tableActionDetailsArray; $actionObj)
	
	OB SET ARRAY:C1227(UserMode_actionObj; $tableObjName; $tableActionDetailsArray)
End if 