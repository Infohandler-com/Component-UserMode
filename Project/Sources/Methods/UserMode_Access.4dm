//%attributes = {"invisible":true,"shared":true}
// UserMode_Access (accessTag, permissionArrPtr)
//
// DESCRIPTION
//   Allows to specify the Access rights
//   Valid access tags: Show, Report, Delete, Import, Export, New, Modify, Execute
//   
#DECLARE($accessTag : Text; $permissionArrPtr : Pointer)
// ----------------------------------------------------

UserMode_Init

If (Count parameters:C259=2)
	If ((Type:C295($accessTag)=Is text:K8:3) | (Type:C295($accessTag)=Is string var:K8:2) | (Type:C295($accessTag)=Is alpha field:K8:1))
		If (Type:C295($permissionArrPtr)=Is pointer:K8:14)
			If (Type:C295($permissionArrPtr->)=Boolean array:K8:21)
				//%W-518.1
				Case of 
					: ($accessTag="Show")
						COPY ARRAY:C226($permissionArrPtr->; ar_UserMode_Show)
						ARRAY BOOLEAN:C223(ar_UserMode_Show; Last table number:C254)
						
						UserMode_InitTableNames
						
					: ($accessTag="Report")
						COPY ARRAY:C226($permissionArrPtr->; ar_UserMode_Report)
						ARRAY BOOLEAN:C223(ar_UserMode_Report; Last table number:C254)
						
					: ($accessTag="Delete")
						COPY ARRAY:C226($permissionArrPtr->; ar_UserMode_Delete)
						ARRAY BOOLEAN:C223(ar_UserMode_Delete; Last table number:C254)
						
					: ($accessTag="Import")
						COPY ARRAY:C226($permissionArrPtr->; ar_UserMode_Import)
						ARRAY BOOLEAN:C223(ar_UserMode_Import; Last table number:C254)
						
					: ($accessTag="Export")
						COPY ARRAY:C226($permissionArrPtr->; ar_UserMode_Export)
						ARRAY BOOLEAN:C223(ar_UserMode_Export; Last table number:C254)
						
					: ($accessTag="New")
						COPY ARRAY:C226($permissionArrPtr->; ar_UserMode_New)
						ARRAY BOOLEAN:C223(ar_UserMode_New; Last table number:C254)
						
					: ($accessTag="Modify")
						COPY ARRAY:C226($permissionArrPtr->; ar_UserMode_Modify)
						ARRAY BOOLEAN:C223(ar_UserMode_Modify; Last table number:C254)
						
					: ($accessTag="Execute")
						COPY ARRAY:C226($permissionArrPtr->; ar_UserMode_Execute)
						ARRAY BOOLEAN:C223(ar_UserMode_Execute; Last table number:C254)
						
						var $i : Integer
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