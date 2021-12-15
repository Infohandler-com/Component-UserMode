//%attributes = {"invisible":true}
// Dialog_AskForOneChange_select ()
// 
// DESCRIPTION
//   Does what is needed to keep the ChangeDialog up to date
//
// ----------------------------------------------------
// HISTORY
//   Created by: DB (10/11/2016)
// ----------------------------------------------------

C_LONGINT:C283($vl_fieldNo)
$vl_fieldNo:=al_UserMode_FieldNo{at_UserMode_FieldNames}
If (Is field number valid:C1000(UserMode_GetCurrentTable; $vl_fieldNo))
	C_LONGINT:C283($vl_fieldType)
	$vl_fieldType:=Type:C295(Field:C253(UserMode_GetCurrentTable; $vl_fieldNo)->)
	
	OBJECT SET VISIBLE:C603(*; "@_fld"; False:C215)
	Case of 
		: ($vl_fieldType=Is boolean:K8:9)
			ARRAY TEXT:C222(at_fld; 0)
			APPEND TO ARRAY:C911(at_fld; "True")
			APPEND TO ARRAY:C911(at_fld; "False")
			at_fld:=1
			OBJECT SET VISIBLE:C603(*; "at_fld"; True:C214)
			
		: ($vl_fieldType=Is longint:K8:6) | ($vl_fieldType=Is integer:K8:5) | ($vl_fieldType=Is integer 64 bits:K8:25)
			OBJECT SET VISIBLE:C603(*; "vl_fld"; True:C214)
			
		: ($vl_fieldType=Is real:K8:4) | ($vl_fieldType=_o_Is float:K8:26)
			OBJECT SET VISIBLE:C603(*; "vr_fld"; True:C214)
			
		: ($vl_fieldType=Is date:K8:7)
			OBJECT SET VISIBLE:C603(*; "vd_fld"; True:C214)
			
		: ($vl_fieldType=Is time:K8:8)
			OBJECT SET VISIBLE:C603(*; "vh_fld"; True:C214)
			
		: ($vl_fieldType=Is alpha field:K8:1)
			OBJECT SET VISIBLE:C603(*; "va_fld"; True:C214)
			
		: ($vl_fieldType=Is text:K8:3)
			OBJECT SET VISIBLE:C603(*; "vt_fld"; True:C214)
			
		Else 
			
	End case 
	
End if 
