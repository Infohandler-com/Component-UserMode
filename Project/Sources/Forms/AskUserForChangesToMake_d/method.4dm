
Case of 
	: (UserMode_GetCurrentTable=0)
		CANCEL:C270
		
	: (Form event code:C388=On Activate:K2:9)
		Component_SetMenuBar
		
	: (Form event code:C388=On Load:K2:1)
		Component_SetMenuBar
		
		ARRAY TEXT:C222(assignmentTypes; 0)
		ARRAY TEXT:C222(assignmentStatements; 0)
		ARRAY OBJECT:C1221(assignmentObjects; 0)
End case 

If (Size of array:C274(assignmentTypes)>0)
	OBJECT SET ENABLED:C1123(bContinue; True:C214)
	If (assignmentTypes>0) & (assignmentTypes<=Size of array:C274(assignmentTypes))
		OBJECT SET ENABLED:C1123(bRemove; True:C214)
	Else 
		OBJECT SET ENABLED:C1123(bRemove; False:C215)
	End if 
Else 
	OBJECT SET ENABLED:C1123(bContinue; False:C215)
	OBJECT SET ENABLED:C1123(bRemove; False:C215)
End if 
