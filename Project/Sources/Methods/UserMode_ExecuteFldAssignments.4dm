//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// UserMode_ExecuteFldAssignments (assignmentDetailsObj) : fieldAuditObject
// UserMode_ExecuteFldAssignments (object) : object
//
// DESCRIPTION
//   Performs all the assigments on the currently loaded record based on the object.
//   Returns an audit object that contains before/after values.
//
C_OBJECT:C1216($1; $assignmentDetailsObj)
C_OBJECT:C1216($0; $fieldAuditObject)
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (07/28/2017)
// ----------------------------------------------------

$fieldAuditObject:=JSON Parse:C1218("{}")
If (Asserted:C1132(Count parameters:C259=1))
	$assignmentDetailsObj:=$1
	
	C_LONGINT:C283($tableNo)
	$tableNo:=OB Get:C1224($assignmentDetailsObj; "dstTableNo"; Is longint:K8:6)
	If ($tableNo>0)
		C_POINTER:C301($tablePtr)
		$tablePtr:=Table:C252($tableNo)
		
		ARRAY OBJECT:C1221($assignmentStatements; 0)
		OB GET ARRAY:C1229($assignmentDetailsObj; "assignments"; $assignmentStatements)
		
		C_LONGINT:C283($i)
		ARRAY OBJECT:C1221($assigmentsMade; 0)
		For ($i; 1; Size of array:C274($assignmentStatements))
			C_OBJECT:C1216($tmpObj)
			$tmpObj:=JSON Parse:C1218("{}")
			
			C_LONGINT:C283($update_fieldType)
			C_POINTER:C301($update_fieldPtr)
			$update_fieldType:=OB Get:C1224($assignmentStatements{$i}; "dstFieldType")
			$update_fieldPtr:=Field:C253($tableNo; OB Get:C1224($assignmentStatements{$i}; "dstFieldNo"))
			
			OB SET:C1220($tmpObj; "fieldNo"; OB Get:C1224($assignmentStatements{$i}; "dstFieldNo"))
			OB SET:C1220($tmpObj; "before"; $update_fieldPtr->)
			
			If (OB Get:C1224($assignmentStatements{$i}; "assignmentType")="fromField")
				C_POINTER:C301($sourceFieldPtr)
				$sourceFieldPtr:=Field:C253($tableNo; OB Get:C1224($assignmentStatements{$i}; "setFromField"))
				$update_fieldPtr->:=$sourceFieldPtr->
				
			Else 
				
				// do the data update
				Case of 
					: ($update_fieldType=Is boolean:K8:9)
						C_BOOLEAN:C305($vb_someBoolean)
						$vb_someBoolean:=OB Get:C1224($assignmentStatements{$i}; "setToValue"; Is boolean:K8:9)
						$update_fieldPtr->:=$vb_someBoolean
						
					: ($update_fieldType=Is longint:K8:6) | ($update_fieldType=Is integer:K8:5) | ($update_fieldType=Is integer 64 bits:K8:25)
						C_LONGINT:C283($vl_someLong)
						$vl_someLong:=OB Get:C1224($assignmentStatements{$i}; "setToValue"; Is longint:K8:6)
						$update_fieldPtr->:=$vl_someLong
						
					: ($update_fieldType=Is real:K8:4) | ($update_fieldType=_o_Is float:K8:26)
						C_REAL:C285($vr_someReal)
						$vr_someReal:=OB Get:C1224($assignmentStatements{$i}; "setToValue"; Is real:K8:4)
						$update_fieldPtr->:=$vr_someReal
						
					: ($update_fieldType=Is date:K8:7)
						C_DATE:C307($vd_someDate)
						$vd_someDate:=OB Get:C1224($assignmentStatements{$i}; "setToValue"; Is date:K8:7)
						$update_fieldPtr->:=$vd_someDate
						
					: ($update_fieldType=Is time:K8:8)
						C_TIME:C306($vh_someTime)
						$vh_someTime:=OB Get:C1224($assignmentStatements{$i}; "setToValue"; Is time:K8:8)
						$update_fieldPtr->:=$vh_someTime
						
					: ($update_fieldType=Is alpha field:K8:1) | ($update_fieldType=Is text:K8:3)
						C_TEXT:C284($textValue)
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
$0:=$fieldAuditObject