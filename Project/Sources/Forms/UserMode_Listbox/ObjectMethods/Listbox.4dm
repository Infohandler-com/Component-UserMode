Case of 
	: (Form event code:C388=On Begin Drag Over:K2:44)
		UserMode_Pasteboard
		
	: (Form event code:C388=On Clicked:K2:4)
		UserMode_UpdateSelectedRecordSt
		
		var $vlMouseX; $vlMouseY; $vlButton : Integer
		MOUSE POSITION:C468($vlMouseX; $vlMouseY; $vlButton)
		If (Macintosh control down:C544 | ($vlButton=2))
			
			var $col; $row : Integer
			var $fieldPtr : Pointer
			LISTBOX GET CELL POSITION:C971(UserModeLB; $col; $row; $fieldPtr)
			If ($row>0)
				var $varName : Text
				var $tableNo; $fieldNo : Integer
				RESOLVE POINTER:C394($fieldPtr; $varName; $tableNo; $fieldNo)
				
				If ($tableNo>0) & ($fieldNo>0)
					var $fieldType : Integer
					var $fieldName : Text
					$fieldType:=Type:C295($fieldPtr->)
					$fieldName:=Field name:C257($fieldPtr)
					
					ARRAY TEXT:C222($at_menuItems; 0)
					APPEND TO ARRAY:C911($at_menuItems; "Copy value")
					If ($fieldType=Is longint:K8:6) & (($fieldName="@_DTS@") | ($fieldName="@_TS@"))
						GOTO SELECTED RECORD:C245(Table:C252($tableNo)->; $row)
						APPEND TO ARRAY:C911($at_menuItems; "(DTS of "+Date2String(TS_GetDate($fieldPtr->); "yyyy-mm-dd")+" "+Time2String(TS_GetTime($fieldPtr->); "hh:mm:ss ampm"))
					End if 
					
					// Convert the array into the pop-up menu
					var $vtItems : Text
					var $i : Integer
					$vtItems:=""
					For ($i; 1; Size of array:C274($at_menuItems))
						If ($vtItems#"")
							$vtItems:=$vtItems+";"
						End if 
						$vtItems:=$vtItems+$at_menuItems{$i}
					End for 
					
					// Show pop-up and handle choice
					var $vlUserChoice : Integer
					$vlUserChoice:=Pop up menu:C542($vtItems)
					Case of 
						: ($at_menuItems{$vlUserChoice}="Copy value")
							GOTO SELECTED RECORD:C245(Table:C252($tableNo)->; $row)
							SET TEXT TO PASTEBOARD:C523(UserMode_ConvertFieldToText($fieldPtr))
							
						Else 
							
					End case 
					
				End if 
				
			End if 
		End if 
		
		//: (Form event=On@click)
		
End case 
