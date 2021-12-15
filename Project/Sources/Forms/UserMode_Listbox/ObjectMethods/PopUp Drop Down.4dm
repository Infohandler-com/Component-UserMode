C_LONGINT:C283($newtable)

If ((ar_UserMode_TableNames>0) & (ar_UserMode_TableNames<=Size of array:C274(ar_UserMode_TablePtrs)))
	C_POINTER:C301($ptr)
	$ptr:=ar_UserMode_TablePtrs{ar_UserMode_TableNames}
	$newtable:=Table:C252($ptr)
	
	If ($newtable#iUserMode_CurrentTable)
		iUserMode_CurrentTable:=$newtable
		UserMode_Listbox_Init
	End if 
	
End if 
