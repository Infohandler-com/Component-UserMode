//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// UserMode_ExecuteFldAssignments (assignmentDetailsObj) : fieldAuditObject
//
// DESCRIPTION
//   Performs all the assigments on the currently loaded record based on the object.
//   Returns an audit object that contains before/after values.
//
#DECLARE($assignmentDetailsObj : Object)->$fieldAuditObject : Object
// ----------------------------------------------------

$fieldAuditObject:=JSON Parse:C1218("{}")
If (Asserted:C1132(Count parameters:C259=1))
	
	var $tableNo : Integer
	$tableNo:=OB Get:C1224($assignmentDetailsObj; "dstTableNo"; Is longint:K8:6)
	If ($tableNo>0)
		var $tablePtr : Pointer
		$tablePtr:=Table:C252($tableNo)
		
		ARRAY OBJECT:C1221($assignmentStatements; 0)
		OB GET ARRAY:C1229($assignmentDetailsObj; "assignments"; $assignmentStatements)
		
		var $i : Integer
		ARRAY OBJECT:C1221($assigmentsMade; 0)
		For ($i; 1; Size of array:C274($assignmentStatements))
			var $tmpObj : Object
			$tmpObj:=JSON Parse:C1218("{}")
			
			var $update_fieldType : Integer
			var $update_fieldPtr : Pointer
			$update_fieldType:=OB Get:C1224($assignmentStatements{$i}; "dstFieldType")
			$update_fieldPtr:=Field:C253($tableNo; OB Get:C1224($assignmentStatements{$i}; "dstFieldNo"))
			
			OB SET:C1220($tmpObj; "fieldNo"; OB Get:C1224($assignmentStatements{$i}; "dstFieldNo"))
			OB SET:C1220($tmpObj; "before"; $update_fieldPtr->)
			
			If (OB Get:C1224($assignmentStatements{$i}; "assignmentType")="fromField")
				var $sourceFieldPtr : Pointer
				$sourceFieldPtr:=Field:C253($tableNo; OB Get:C1224($assignmentStatements{$i}; "setFromField"))
				$update_fieldPtr->:=$sourceFieldPtr->
				
			Else 
				
				// do the data update
				Case of 
					: ($update_fieldType=Is boolean:K8:9)
						var $vb_someBoolean : Boolean
						$vb_someBoolean:=OB Get:C1224($assignmentStatements{$i}; "setToValue"; Is boolean:K8:9)
						$update_fieldPtr->:=$vb_someBoolean
						
					: ($update_fieldType=Is longint:K8:6) | ($update_fieldType=Is integer:K8:5) | ($update_fieldType=Is integer 64 bits:K8:25)
						var $vl_someLong : Integer
						$vl_someLong:=OB Get:C1224($assignmentStatements{$i}; "setToValue"; Is longint:K8:6)
						$update_fieldPtr->:=$vl_someLong
						
					: ($update_fieldType=Is real:K8:4)
						var $vr_someReal : Real
						$vr_someReal:=OB Get:C1224($assignmentStatements{$i}; "setToValue"; Is real:K8:4)
						$update_fieldPtr->:=$vr_someReal
						
					: ($update_fieldType=Is date:K8:7)
						var $vd_someDate : Date
						$vd_someDate:=OB Get:C1224($assignmentStatements{$i}; "setToValue"; Is date:K8:7)
						$update_fieldPtr->:=$vd_someDate
						
					: ($update_fieldType=Is time:K8:8)
						var $vh_someTime : Time
						$vh_someTime:=OB Get:C1224($assignmentStatements{$i}; "setToValue"; Is time:K8:8)
						$update_fieldPtr->:=$vh_someTime
						
					: ($update_fieldType=Is alpha field:K8:1) | ($update_fieldType=Is text:K8:3)
						var $textValue : Text
						$textValue:=OB Get:C1224($assignmentStatements{$i}; "setToValue"; Is text:K8:3)
						$update_fieldPtr->:=$textValue
						
					Else 
						// NOP
				End case 
				
			End if 
			
			OB SET:C1220($tmpObj; "after"; $update_fieldPtr->)
			APPEND TO ARRAY:C911($assigmentsMade; $tmpObj)
		End for 
		OB SET ARRAY:C1227($fieldAuditObject; "fieldUpdates"; $assigmentsMade)
	End if 
End if 
