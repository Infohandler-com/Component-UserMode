//%attributes = {"invisible":true,"shared":true}
// UserMode_AddSpecialQuery (tablePtr, queryName, callbackMethod)
//
#DECLARE($tablePtr : Pointer; $queryName : Text; $callbackMethod : Text)
// ----------------------------------------------------

If (Asserted:C1132(Count parameters:C259=3))
	UserMode_Init
	
	var $tableQueryObjName : Text
	$tableQueryObjName:="t"+String:C10(Table:C252($tablePtr))
	
	ARRAY OBJECT:C1221($tableQueryDetailsArray; 0)
	If (OB Is defined:C1231(UserMode_queryObj; $tableQueryObjName))
		OB GET ARRAY:C1229(UserMode_queryObj; $tableQueryObjName; $tableQueryDetailsArray)
	End if 
	
	var $queryObj : Object
	OB SET:C1220($queryObj; "name"; $queryName)
	OB SET:C1220($queryObj; "callback"; $callbackMethod)
	
	APPEND TO ARRAY:C911($tableQueryDetailsArray; $queryObj)
	
	OB SET ARRAY:C1227(UserMode_queryObj; $tableQueryObjName; $tableQueryDetailsArray)
End if 