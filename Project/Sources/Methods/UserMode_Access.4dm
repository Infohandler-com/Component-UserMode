//%attributes = {"invisible":true,"shared":true}
// UserMode_Access (accessTag, permissionArrPtr)
// UserMode_Access (text, pointer)
//
// DESCRIPTION
//   Allows to specify the Access rights
//   Valid access tags: Show, Report, Delete, Import, Export, New, Modify, Execute
//   
C_TEXT:C284($1)
C_POINTER:C301($2)  // ptr to boolean array (based on table numbers)
// ----------------------------------------------------
// HISTORY
//   Created by: Thomas Maul (26.02.2009)
// ----------------------------------------------------

UserMode_Init

If (Count parameters:C259=2)
	If ((Type:C295($1)=Is text:K8:3) | (Type:C295($1)=Is string var:K8:2) | (Type:C295($1)=Is alpha field:K8:1))
		If (Type:C295($2)=Is pointer:K8:14)
			If (Type:C295($2->)=Boolean array:K8:21)
				//%W-518.1
				Case of 
					: ($1="Show")
						COPY ARRAY:C226($2->; ar_UserMode_Show)
						ARRAY BOOLEAN:C223(ar_UserMode_Show; Get last table number:C254)
						
						UserMode_InitTableNames
						
					: ($1="Report")
						COPY ARRAY:C226($2->; ar_UserMode_Report)
						ARRAY BOOLEAN:C223(ar_UserMode_Report; Get last table number:C254)
						
					: ($1="Delete")
						COPY ARRAY:C226($2->; ar_UserMode_Delete)
						ARRAY BOOLEAN:C223(ar_UserMode_Delete; Get last table number:C254)
						
					: ($1="Import")
						COPY ARRAY:C226($2->; ar_UserMode_Import)
						ARRAY BOOLEAN:C223(ar_UserMode_Import; Get last table number:C254)
						
					: ($1="Export")
						COPY ARRAY:C226($2->; ar_UserMode_Export)
						ARRAY BOOLEAN:C223(ar_UserMode_Export; Get last table number:C254)
						
					: ($1="New")
						COPY ARRAY:C226($2->; ar_UserMode_New)
						ARRAY BOOLEAN:C223(ar_UserMode_New; Get last table number:C254)
						
					: ($1="Modify")
						COPY ARRAY:C226($2->; ar_UserMode_Modify)
						ARRAY BOOLEAN:C223(ar_UserMode_Modify; Get last table number:C254)
						
					: ($1="Execute")
						COPY ARRAY:C226($2->; ar_UserMode_Execute)
						ARRAY BOOLEAN:C223(ar_UserMode_Execute; Get last table number:C254)
						
						C_LONGINT:C283($i)
						For ($i; 1; Size of array:C274(ar_UserMode_Execute))
							If (ar_UserMode_Execute{$i})
								UserMode_AddSpecialAction(Table:C252($i); "Apply to Selection..."; "")
							End if 
						End for 
						
				End case 
				//%W+518.1
			End if 
		End if 
	End if 
End if 