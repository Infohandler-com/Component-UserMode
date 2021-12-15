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
			OB SET:C1220(userMode_fieldChangeDetails; "dstTableNo"; UserMode_GetCurrentTable)
			OB SET ARRAY:C1227(userMode_fieldChangeDetails; "assignments"; assignmentObjects)
			
			ACCEPT:C269
	End case 
	
	
	If ($vt_errMsg="")
		
		
	Else 
		BEEP:C151
		ALERT:C41($vt_errMsg)
	End if 
	
End if 