If (Form event code:C388=On Clicked:K2:4)
	var $pos : Integer
	$pos:=assignmentTypes
	
	If ($pos>0) & ($pos<=Size of array:C274(assignmentTypes))
		DELETE FROM ARRAY:C228(assignmentTypes; $pos; 1)
		DELETE FROM ARRAY:C228(assignmentStatements; $pos; 1)
		DELETE FROM ARRAY:C228(assignmentObjects; $pos; 1)
	Else 
		BEEP:C151
	End if 
End if 