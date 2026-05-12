
Case of 
	: (UserMode_GetCurrentTable=0)
		CANCEL:C270
		
	: (Form event code:C388=On Activate:K2:9)
		Component_SetMenuBar
		
	: (Form event code:C388=On Load:K2:1)
		ARRAY TEXT:C222(at_fld; 0)
		var vr_fld : Real
		var vl_fld : Integer
		var vt_fld : Text
		var vd_fld : Date
		var vh_fld : Time
		
		Component_SetMenuBar
		
		<>_tableName:="["+Table name:C256(UserMode_GetCurrentTable)+"]"
		
		var $i : Integer
		ARRAY LONGINT:C221(al_UserMode_FieldNo; 0)
		ARRAY TEXT:C222(at_UserMode_FieldNames; 0)
		For ($i; 1; Last field number:C255(UserMode_GetCurrentTable))
			If (Is field number valid:C1000(UserMode_GetCurrentTable; $i))
				var $fieldPtr : Pointer
				$fieldPtr:=Field:C253(UserMode_GetCurrentTable; $i)
				
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
						GET FIELD PROPERTIES:C258(UserMode_GetCurrentTable; $i; $vl_fieldType; $vl_fieldLength)
						If ($vl_fieldLength=0)  // is UUID
							$vt_fieldName:=$vt_fieldName+" (UUID)"
						Else 
							$vt_fieldName:=$vt_fieldName+" (Alpha "+String:C10($vl_fieldLength)+")"
						End if 
						
					: ($vl_fieldType=Is text:K8:3)
						$vt_fieldName:=$vt_fieldName+" (Text)"
						
				End case 
				
				APPEND TO ARRAY:C911(al_UserMode_FieldNo; $i)
				APPEND TO ARRAY:C911(at_UserMode_FieldNames; $vt_fieldName)
			End if 
		End for 
		SORT ARRAY:C229(at_UserMode_FieldNames; al_UserMode_FieldNo; >)
		at_UserMode_FieldNames:=1
		
		ChangeDialog__FieldPopUpChanged
		
End case 
