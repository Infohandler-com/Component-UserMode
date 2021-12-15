//%attributes = {"invisible":true}
// ----------------------------------------------------
// Anwender (OS): Thomas Maul
// Datum und Zeit: 26.02.09
// ----------------------------------------------------
// Methode: UserMode_Init
// Internal - handles necessary variable initialisation
// 
//
C_LONGINT:C283($1; $processId)  // Optional, if supplied, copies vars from that process
// ----------------------------------------------------

If (Count parameters:C259=1)
	$processId:=$1
End if 

C_TEXT:C284(<>_userMakingChange; <>_reasonForChange; UserModeFormula)
C_LONGINT:C283($maxtables; iUserMode_CurrentTable)
C_LONGINT:C283($i)

C_BOOLEAN:C305(bUserMode_Init)
If (Not:C34(bUserMode_Init)) | ($processId#0)
	bUserMode_Init:=True:C214
	
	C_OBJECT:C1216(UserMode_queryObj; UserMode_actionObj)
	If ($processId=0)
		UserMode_queryObj:=JSON Parse:C1218("{}")
		UserMode_actionObj:=JSON Parse:C1218("{}")
	Else 
		GET PROCESS VARIABLE:C371($processId; UserMode_queryObj; UserMode_queryObj)
		GET PROCESS VARIABLE:C371($processId; UserMode_actionObj; UserMode_actionObj)
	End if 
	
	$maxtables:=Get last table number:C254
	ARRAY BOOLEAN:C223(ar_UserMode_Show; $maxtables)
	ARRAY BOOLEAN:C223(ar_UserMode_Report; $maxtables)
	ARRAY BOOLEAN:C223(ar_UserMode_Delete; $maxtables)
	ARRAY BOOLEAN:C223(ar_UserMode_Import; $maxtables)
	ARRAY BOOLEAN:C223(ar_UserMode_Export; $maxtables)
	ARRAY BOOLEAN:C223(ar_UserMode_New; $maxtables)
	ARRAY BOOLEAN:C223(ar_UserMode_Modify; $maxtables)
	ARRAY BOOLEAN:C223(ar_UserMode_Execute; $maxtables)
	ARRAY TEXT:C222(ar_UserMode_Forms; $maxtables)
	
	If ($processId=0)
		For ($i; 1; $maxtables)
			If (Is table number valid:C999($i))
				If (Records in table:C83(Table:C252($i)->)>0)  // Only show, by default, tables that have records
					ar_UserMode_Show{$i}:=True:C214
				End if 
			End if 
		End for 
		COPY ARRAY:C226(ar_UserMode_Show; ar_UserMode_Report)
		COPY ARRAY:C226(ar_UserMode_Show; ar_UserMode_Delete)
		COPY ARRAY:C226(ar_UserMode_Show; ar_UserMode_Import)
		COPY ARRAY:C226(ar_UserMode_Show; ar_UserMode_Export)
		COPY ARRAY:C226(ar_UserMode_Show; ar_UserMode_New)
		COPY ARRAY:C226(ar_UserMode_Show; ar_UserMode_Modify)
		COPY ARRAY:C226(ar_UserMode_Show; ar_UserMode_Execute)
		
	Else 
		
		GET PROCESS VARIABLE:C371($processId; ar_UserMode_Show; ar_UserMode_Show)
		GET PROCESS VARIABLE:C371($processId; ar_UserMode_Report; ar_UserMode_Report)
		GET PROCESS VARIABLE:C371($processId; ar_UserMode_Delete; ar_UserMode_Delete)
		GET PROCESS VARIABLE:C371($processId; ar_UserMode_Import; ar_UserMode_Import)
		GET PROCESS VARIABLE:C371($processId; ar_UserMode_Export; ar_UserMode_Export)
		GET PROCESS VARIABLE:C371($processId; ar_UserMode_New; ar_UserMode_New)
		GET PROCESS VARIABLE:C371($processId; ar_UserMode_Modify; ar_UserMode_Modify)
		GET PROCESS VARIABLE:C371($processId; ar_UserMode_Execute; ar_UserMode_Execute)
		GET PROCESS VARIABLE:C371($processId; ar_UserMode_Forms; ar_UserMode_Forms)
	End if 
	
	C_TEXT:C284(at_UserMode_ExecuteCallBack; at_UserMode_ViewCallBack)
	at_UserMode_ExecuteCallBack:=""
	at_UserMode_ViewCallBack:=""
	If ($processId#0)
		GET PROCESS VARIABLE:C371($processId; at_UserMode_ExecuteCallBack; at_UserMode_ExecuteCallBack)
		GET PROCESS VARIABLE:C371($processId; at_UserMode_ViewCallBack; at_UserMode_ViewCallBack)
	End if 
	
	ARRAY TEXT:C222(ar_UserMode_TableViews; 0)
	
	ARRAY TEXT:C222(ar_UserMode_TableNames; 0)
	ARRAY POINTER:C280(ar_UserMode_TablePtrs; 0)
	If ($processId=0)
		UserMode_InitTableNames
	Else 
		GET PROCESS VARIABLE:C371($processId; ar_UserMode_TableNames; ar_UserMode_TableNames)
		GET PROCESS VARIABLE:C371($processId; ar_UserMode_TablePtrs; ar_UserMode_TablePtrs)
	End if 
	
	ARRAY TEXT:C222(ar_UTIL_title; 0)
	ARRAY TEXT:C222(ar_UTIL_method; 0)
	If ($processId#0)
		GET PROCESS VARIABLE:C371($processId; ar_UTIL_title; ar_UTIL_title)
		GET PROCESS VARIABLE:C371($processId; ar_UTIL_method; ar_UTIL_method)
	End if 
End if 
