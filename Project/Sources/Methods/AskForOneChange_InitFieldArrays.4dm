//%attributes = {"invisible":true}
// AskForOneChange_InitFieldArrays (parm1, parm2) : result
//
#DECLARE($assignmentTableNo : Integer\
; $fieldNameArrPtr : Pointer\
; $fieldNoArrPtr : Pointer\
; $fieldTypeArrPtr : Pointer)
// ----------------------------------------------------

If (Asserted:C1132(Count parameters:C259=4))
	Array_Empty($fieldNameArrPtr)
	Array_Empty($fieldNoArrPtr)
	Array_Empty($fieldTypeArrPtr)
	
	var $i : Integer
	For ($i; 1; Last field number:C255($assignmentTableNo))
		If (Is field number valid:C1000($assignmentTableNo; $i))
			var $fieldPtr : Pointer
			$fieldPtr:=Field:C253($assignmentTableNo; $i)
			
			var $vt_fieldName : Text
			$vt_fieldName:=Field name:C257($fieldPtr)
			
			var $vl_fieldType; $vl_fieldLength : Integer
			$vl_fieldType:=Type:C295($fieldPtr->)
			Case of 
				: ($vl_fieldType=Is boolean:K8:9)
					$vt_fieldName:=$vt_fieldName+" (Boolean)"
					
				: ($vl_fieldType=Is longint:K8:6) | ($vl_fieldType=Is integer:K8:5) | ($vl_fieldType=Is integer 64 bits:K8:25)
					$vt_fieldName:=$vt_fieldName+" (Integer)"
					
				: ($vl_fieldType=Is real:K8:4)
					$vt_fieldName:=$vt_fieldName+" (Float)"
					
				: ($vl_fieldType=Is date:K8:7)
					$vt_fieldName:=$vt_fieldName+" (Date)"
					
				: ($vl_fieldType=Is time:K8:8)
					$vt_fieldName:=$vt_fieldName+" (Time)"
					
				: ($vl_fieldType=Is alpha field:K8:1)
					GET FIELD PROPERTIES:C258($assignmentTableNo; $i; $vl_fieldType; $vl_fieldLength)
					If ($vl_fieldLength=0)  // is UUID
						$vt_fieldName:=$vt_fieldName+" (UUID)"
					Else 
						$vt_fieldName:=$vt_fieldName+" (Alpha "+String:C10($vl_fieldLength)+")"
					End if 
					
				: ($vl_fieldType=Is text:K8:3)
					$vt_fieldName:=$vt_fieldName+" (Text)"
					
			End case 
			
			APPEND TO ARRAY:C911($fieldTypeArrPtr->; $vl_fieldType)
			APPEND TO ARRAY:C911($fieldNoArrPtr->; $i)
			APPEND TO ARRAY:C911($fieldNameArrPtr->; $vt_fieldName)
		End if 
	End for 
End if 