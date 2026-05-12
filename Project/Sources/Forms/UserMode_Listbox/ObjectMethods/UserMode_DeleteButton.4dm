
var $message : Text

If (ar_UserMode_Delete{iUserMode_CurrentTable})
	COPY NAMED SELECTION:C331(Table:C252(iUserMode_CurrentTable)->; "myTmpNamedSet")  // Keep the current selection
	
	$message:=Localized string:C991("UserMode DeleteAlert")
	$message:=Replace string:C233($message; "$1"; String:C10(Records in set:C195("UserSet")))
	$message:=Replace string:C233($message; "$2"; Table name:C256(iUserMode_CurrentTable))
	CONFIRM:C162($message)
	If (OK=1)
		READ WRITE:C146(Table:C252(iUserMode_CurrentTable)->)
		USE SET:C118("UserSet")
		
		
		
		DELETE SELECTION:C66(Table:C252(iUserMode_CurrentTable)->)
		READ ONLY:C145(Table:C252(iUserMode_CurrentTable)->)
		
		USE NAMED SELECTION:C332("myTmpNamedSet")  // Restore the current selection
	End if 
	
	CLEAR NAMED SELECTION:C333("myTmpNamedSet")  // Clean up
End if 


