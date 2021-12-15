If (Form event code:C388=On Clicked:K2:4)
	
	C_POINTER:C301($RB_useCustomValuePtr; $RB_userValueFromFieldPtr)
	$RB_useCustomValuePtr:=OBJECT Get data source:C1265(*; "rb_customValue")
	$RB_userValueFromFieldPtr:=OBJECT Get data source:C1265(*; "rb_fromField")
	
	C_LONGINT:C283($assignmentTableNo)
	$assignmentTableNo:=Table:C252(_assignmentTablePtr)
	
	C_OBJECT:C1216(_assignmentStatementDetails)
	_assignmentStatementDetails:=JSON Parse:C1218("{}")
	
	C_TEXT:C284($userFriendlyAssignStatment)
	$userFriendlyAssignStatment:="["+Table name:C256(_assignmentTablePtr)+"]"+Field name:C257($assignmentTableNo; al_UserMode_FieldNo{at_UserMode_FieldNames})
	
	C_LONGINT:C283($vl_fieldNo; $vl_fieldType)
	$vl_fieldNo:=al_UserMode_FieldNo{at_UserMode_FieldNames}
	$vl_fieldType:=al_UserMode_FieldType{at_UserMode_FieldNames}
	
	OB SET:C1220(_assignmentStatementDetails; "dstFieldNo"; $vl_fieldNo)
	OB SET:C1220(_assignmentStatementDetails; "dstFieldType"; $vl_fieldType)
	
	
	If ($RB_userValueFromFieldPtr->=1)
		OB SET:C1220(_assignmentStatementDetails; "assignmentType"; "fromField")
		OB SET:C1220(_assignmentStatementDetails; "setFromField"; al_UserMode_FieldNo_COPY{at_UserMode_FieldNames_COPY})
		$userFriendlyAssignStatment:=$userFriendlyAssignStatment+"   SET FROM  ["+Table name:C256(_assignmentTablePtr)+"]"+Field name:C257($assignmentTableNo; al_UserMode_FieldNo_COPY{at_UserMode_FieldNames_COPY})
		
	Else 
		OB SET:C1220(_assignmentStatementDetails; "assignmentType"; "fromCustomValue")
		$userFriendlyAssignStatment:=$userFriendlyAssignStatment+":="
		
		Case of 
			: ($vl_fieldType=Is boolean:K8:9)
				If (at_fld{at_fld}="True")
					OB SET:C1220(_assignmentStatementDetails; "setToValue"; True:C214)
					$userFriendlyAssignStatment:=$userFriendlyAssignStatment+"True"
				Else 
					OB SET:C1220(_assignmentStatementDetails; "setToValue"; False:C215)
					$userFriendlyAssignStatment:=$userFriendlyAssignStatment+"False"
				End if 
				
			: ($vl_fieldType=Is longint:K8:6) | ($vl_fieldType=Is integer:K8:5) | ($vl_fieldType=Is integer 64 bits:K8:25)
				OB SET:C1220(_assignmentStatementDetails; "setToValue"; vl_fld)
				$userFriendlyAssignStatment:=$userFriendlyAssignStatment+String:C10(vl_fld)
				
			: ($vl_fieldType=Is real:K8:4) | ($vl_fieldType=_o_Is float:K8:26)
				OB SET:C1220(_assignmentStatementDetails; "setToValue"; vr_fld)
				$userFriendlyAssignStatment:=$userFriendlyAssignStatment+String:C10(vr_fld)
				
			: ($vl_fieldType=Is date:K8:7)
				OB SET:C1220(_assignmentStatementDetails; "setToValue"; vd_fld)
				$userFriendlyAssignStatment:=$userFriendlyAssignStatment+"!"+String:C10(vd_fld)+"!"
				
			: ($vl_fieldType=Is time:K8:8)
				OB SET:C1220(_assignmentStatementDetails; "setToValue"; vh_fld)
				$userFriendlyAssignStatment:=$userFriendlyAssignStatment+"?"+String:C10(vh_fld)+"?"
				
			: ($vl_fieldType=Is alpha field:K8:1)
				OB SET:C1220(_assignmentStatementDetails; "setToValue"; va_fld)
				$userFriendlyAssignStatment:=$userFriendlyAssignStatment+"\""+va_fld+"\""
				
			: ($vl_fieldType=Is text:K8:3)
				OB SET:C1220(_assignmentStatementDetails; "setToValue"; vt_fld)
				$userFriendlyAssignStatment:=$userFriendlyAssignStatment+"\""+vt_fld+"\""
				
			Else 
				
		End case 
	End if 
	
	OB SET:C1220(_assignmentStatementDetails; "assignmentStatement"; $userFriendlyAssignStatment)
	
	ACCEPT:C269
End if 