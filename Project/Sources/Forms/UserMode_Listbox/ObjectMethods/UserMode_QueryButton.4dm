
var $text : Text
var $selectedItem : Integer

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		QUERY:C277(Table:C252(iUserMode_CurrentTable)->)
		
	: (Form event code:C388=On Alternative Click:K2:36) | (Form event code:C388=On Clicked:K2:4)
		var $tableQueryObjName : Text
		$tableQueryObjName:="t"+String:C10(iUserMode_CurrentTable)
		If (OB Is defined:C1231(UserMode_queryObj; $tableQueryObjName))
			
			ARRAY OBJECT:C1221($queryChoices; 0)
			OB GET ARRAY:C1229(UserMode_queryObj; $tableQueryObjName; $queryChoices)
			
			ARRAY TEXT:C222($at_choices; 0)
			For ($i; 1; Size of array:C274($queryChoices))
				APPEND TO ARRAY:C911($at_choices; OB Get:C1224($queryChoices{$i}; "name"))
			End for 
			
			var $i : Integer
			For ($i; 1; Size of array:C274($at_choices))
				If ($i#1)
					$text:=$text+";"
				End if 
				$text:=$text+$at_choices{$i}
			End for 
			
			$selectedItem:=Pop up menu:C542($text)
			
			If ($selectedItem>0)
				var $callbackMethod : Text
				$callbackMethod:=OB Get:C1224($queryChoices{$selectedItem}; "callback")
				If ($callbackMethod#"")
					EXECUTE METHOD:C1007($callbackMethod; *; Table:C252(iUserMode_CurrentTable); $at_choices{$selectedItem})
					CREATE EMPTY SET:C140(Table:C252(iUserMode_CurrentTable)->; "UserSet")
					UserMode_UpdateSelectedRecordSt
				Else 
					ALERT:C41("unknown callback method")
				End if 
			End if 
			
		End if 
		
End case 



