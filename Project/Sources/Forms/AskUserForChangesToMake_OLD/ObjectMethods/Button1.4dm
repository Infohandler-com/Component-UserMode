If (Form event code:C388=On Clicked:K2:4)
	
	// Enforce mandatory fields
	C_TEXT:C284($vt_errMsg; <>_userMakingChange; <>_reasonForChange)
	$vt_errMsg:=""
	Case of 
		: (<>_userMakingChange="")
			$vt_errMsg:="You must provide your name to continue."
			GOTO OBJECT:C206(<>_userMakingChange)
			
		: (<>_reasonForChange="")
			$vt_errMsg:="You must provide the reason that you are making this change to continue."
			GOTO OBJECT:C206(<>_reasonForChange)
			
		Else 
			C_TEXT:C284(UserModeFormula)
			UserModeFormula:=""
			
			C_LONGINT:C283($vl_fieldNo; $vl_fieldType)
			$vl_fieldNo:=al_UserMode_FieldNo{at_UserMode_FieldNames}
			$vl_fieldType:=Type:C295(Field:C253(UserMode_GetCurrentTable; $vl_fieldNo)->)
			
			C_OBJECT:C1216(userMode_fieldChangeDetails)
			userMode_fieldChangeDetails:=JSON Parse:C1218("{}")
			OB SET:C1220(userMode_fieldChangeDetails; "user"; <>_userMakingChange)
			OB SET:C1220(userMode_fieldChangeDetails; "reason"; <>_reasonForChange)
			OB SET:C1220(userMode_fieldChangeDetails; "tableNo"; iUserMode_CurrentTable)
			OB SET:C1220(userMode_fieldChangeDetails; "fieldNo"; $vl_fieldNo)
			OB SET:C1220(userMode_fieldChangeDetails; "fieldType"; $vl_fieldType)
			
			Case of 
				: ($vl_fieldType=Is boolean:K8:9)
					If (at_fld{at_fld}="True")
						OB SET:C1220(userMode_fieldChangeDetails; "fieldToValue"; True:C214)
					Else 
						OB SET:C1220(userMode_fieldChangeDetails; "fieldToValue"; False:C215)
					End if 
					
				: ($vl_fieldType=Is longint:K8:6) | ($vl_fieldType=Is integer:K8:5) | ($vl_fieldType=Is integer 64 bits:K8:25)
					OB SET:C1220(userMode_fieldChangeDetails; "fieldToValue"; vl_fld)
					
				: ($vl_fieldType=Is real:K8:4) | ($vl_fieldType=_o_Is float:K8:26)
					OB SET:C1220(userMode_fieldChangeDetails; "fieldToValue"; vr_fld)
					
				: ($vl_fieldType=Is date:K8:7)
					OB SET:C1220(userMode_fieldChangeDetails; "fieldToValue"; vd_fld)
					
				: ($vl_fieldType=Is time:K8:8)
					OB SET:C1220(userMode_fieldChangeDetails; "fieldToValue"; vh_fld)
					
				: ($vl_fieldType=Is alpha field:K8:1)
					OB SET:C1220(userMode_fieldChangeDetails; "fieldToValue"; va_fld)
					
				: ($vl_fieldType=Is text:K8:3)
					OB SET:C1220(userMode_fieldChangeDetails; "fieldToValue"; vt_fld)
					
				Else 
					
			End case 
			
			ACCEPT:C269
	End case 
	
	
	If ($vt_errMsg="")
		
		
	Else 
		BEEP:C151
		ALERT:C41($vt_errMsg)
	End if 
	
End if 