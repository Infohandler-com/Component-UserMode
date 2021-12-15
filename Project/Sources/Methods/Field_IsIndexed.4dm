//%attributes = {"invisible":true,"preemptive":"capable"}
// Field_IsIndexed (fieldPtr) : isIndexed
//
// DESCRIPTION
//   
//
C_POINTER:C301($1; $fieldPtr)
C_BOOLEAN:C305($0; $isIndexed)
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (08/19/2019)
// ----------------------------------------------------

$isIndexed:=False:C215
If (Asserted:C1132(Count parameters:C259=1))
	$fieldPtr:=$1
	
	C_LONGINT:C283($tableNo; $fieldNo)
	$tableNo:=Table:C252($fieldPtr)
	$fieldNo:=Field:C253($fieldPtr)
	
	C_LONGINT:C283($fieldType; $fieldLength)
	GET FIELD PROPERTIES:C258($tableNo; $fieldNo; $fieldType; $fieldLength; $isIndexed)
End if 
$0:=$isIndexed