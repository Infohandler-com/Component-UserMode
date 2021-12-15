//%attributes = {"invisible":true,"shared":true}
// UserMode_AddSpecialQuery (tablePtr, queryName, callbackMethod)
// UserMode_AddSpecialQuery (pointer, text, text)
//
// DESCRIPTION
//   
//
C_POINTER:C301($1; $tablePtr)
C_TEXT:C284($2; $queryName)
C_TEXT:C284($3; $callbackMethod)
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (04/12/2018)
// ----------------------------------------------------

If (Asserted:C1132(Count parameters:C259=3))
	$tablePtr:=$1
	$queryName:=$2
	$callbackMethod:=$3
	
	UserMode_Init
	
	C_TEXT:C284($tableQueryObjName)
	$tableQueryObjName:="t"+String:C10(Table:C252($tablePtr))
	
	ARRAY OBJECT:C1221($tableQueryDetailsArray; 0)
	If (OB Is defined:C1231(UserMode_queryObj; $tableQueryObjName))
		OB GET ARRAY:C1229(UserMode_queryObj; $tableQueryObjName; $tableQueryDetailsArray)
	End if 
	
	C_OBJECT:C1216($queryObj)
	OB SET:C1220($queryObj; "name"; $queryName)
	OB SET:C1220($queryObj; "callback"; $callbackMethod)
	
	APPEND TO ARRAY:C911($tableQueryDetailsArray; $queryObj)
	
	OB SET ARRAY:C1227(UserMode_queryObj; $tableQueryObjName; $tableQueryDetailsArray)
End if 