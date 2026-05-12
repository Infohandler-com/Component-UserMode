//%attributes = {"invisible":true,"preemptive":"capable"}
// Field_IsIndexed (fieldPtr) : isIndexed
//
#DECLARE($fieldPtr : Pointer)->$isIndexed : Boolean
// ----------------------------------------------------
$isIndexed:=False:C215

If (Asserted:C1132(Count parameters:C259=1))
	var $tableNo; $fieldNo : Integer
	$tableNo:=Table:C252($fieldPtr)
	$fieldNo:=Field:C253($fieldPtr)
	
	var $fieldType; $fieldLength : Integer
	GET FIELD PROPERTIES:C258($tableNo; $fieldNo; $fieldType; $fieldLength; $isIndexed)
End if 
