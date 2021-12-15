Case of 
	: (Form event code:C388=On Begin Drag Over:K2:44)
		UserMode_Pasteboard
		
	: (Form event code:C388=On Clicked:K2:4)
		UserMode_UpdateSelectedRecordSt
		
		C_LONGINT:C283($vlMouseX; $vlMouseY; $vlButton)
		GET MOUSE:C468($vlMouseX; $vlMouseY; $vlButton)
		If (Macintosh control down:C544 | ($vlButton=2))
			
			C_LONGINT:C283($col; $row)
			C_POINTER:C301($fieldPtr)
			LISTBOX GET CELL POSITION:C971(UserModeLB; $col; $row; $fieldPtr)
			If ($row>0)
				C_TEXT:C284($varName)
				C_LONGINT:C283($tableNo; $fieldNo)
				RESOLVE POINTER:C394($fieldPtr; $varName; $tableNo; $fieldNo)
				
				If ($tableNo>0) & ($fieldNo>0)
					C_LONGINT:C283($fieldType)
					C_TEXT:C284($fieldName)
					$fieldType:=Type:C295($fieldPtr->)
					$fieldName:=Field name:C257($fieldPtr)
					
					ARRAY TEXT:C222($at_menuItems; 0)
					APPEND TO ARRAY:C911($at_menuItems; "Copy value")
					If ($fieldType=Is longint:K8:6) & (($fieldName="@_DTS@") | ($fieldName="@_TS@"))
						GOTO SELECTED RECORD:C245(Table:C252($tableNo)->; $row)
						APPEND TO ARRAY:C911($at_menuItems; "(DTS of "+Date2String(TS_GetDate($fieldPtr->); "yyyy-mm-dd")+" "+Time2String(TS_GetTime($fieldPtr->); "hh:mm:ss ampm"))
					End if 
					
					// Convert the array into the pop-up menu
					C_TEXT:C284($vtItems)
					C_LONGINT:C283($i)
					$vtItems:=""
					For ($i; 1; Size of array:C274($at_menuItems))
						If ($vtItems#"")
							$vtItems:=$vtItems+";"
						End if 
						$vtItems:=$vtItems+$at_menuItems{$i}
					End for 
					
					// Show pop-up and handle choice
					C_LONGINT:C283($vlUserChoice)
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
