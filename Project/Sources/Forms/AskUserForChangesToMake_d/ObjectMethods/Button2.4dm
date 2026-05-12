If (Form event code:C388=On Clicked:K2:4)
	
	var $assignmentObj : Object
	$assignmentObj:=Dialog_AskForOneChange(Table:C252(UserMode_GetCurrentTable))
	
	If (OK=1)
		APPEND TO ARRAY:C911(assignmentTypes; OB Get:C1224($assignmentObj; "assignmentType"))
		APPEND TO ARRAY:C911(assignmentStatements; OB Get:C1224($assignmentObj; "assignmentStatement"))
		APPEND TO ARRAY:C911(assignmentObjects; $assignmentObj)
	End if 
End if 