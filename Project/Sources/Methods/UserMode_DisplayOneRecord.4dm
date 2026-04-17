//%attributes = {"invisible":true}
// UserMode_DisplayOneRecord (tablePtr, inputFormName)
//
#DECLARE($tablePtr : Pointer; $inputFormName : Text; $recordSetName : Text)
// ----------------------------------------------------

If (Asserted:C1132((Count parameters:C259=2) | (Count parameters:C259=3)))
	var $procName : Text
	$procName:="UMview_t"+String:C10(Table:C252($tablePtr))+"_r"+String:C10(Record number:C243($tablePtr->))
	Case of 
		: (Process number:C372($procName)#0) & (Process number:C372($procName)#Current process:C322)
			BRING TO FRONT:C326(Process number:C372($procName))
			
			
		: (Count parameters:C259=2)
			$recordSetName:="<>OneRec_"+String:C10(Milliseconds:C459)
			COPY SET:C600("UserSet"; $recordSetName)
			
			var $procId : Integer
			$procId:=New process:C317(Current method name:C684; 0; $procName; $tablePtr; $inputFormName; $recordSetName)
			
			
		Else 
			READ ONLY:C145($tablePtr->)
			USE SET:C118($recordSetName)
			CLEAR SET:C117($recordSetName)
			
			var $win : Integer
			$win:=Open form window:C675($tablePtr->; $inputFormName)
			//SET WINDOW TITLE("Check children for "+[Person]Name)
			DIALOG:C40($tablePtr->; $inputFormName)
	End case 
	
End if 