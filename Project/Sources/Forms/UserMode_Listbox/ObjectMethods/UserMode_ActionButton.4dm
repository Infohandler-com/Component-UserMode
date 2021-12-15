
C_TEXT:C284($text)
C_LONGINT:C283($selectedItem)

C_TEXT:C284(at_UserMode_ExecuteCallBack)
Case of 
		
		//: (Form event=On Clicked)
		//If (ar_UserMode_Execute{iUserMode_CurrentTable}) & (at_UserMode_ExecuteCallBack#"")
		//C_BOOLEAN($vb_wasHandled)
		//C_OBJECT($vo_details)
		//$vo_details:=Dialog_AskUserForChangesToMake 
		//If (OK=1)
		//EXECUTE METHOD(at_UserMode_ExecuteCallBack;$vb_wasHandled;$vo_details)
		//REDRAW(UserModeLB)
		//End if 
		//End if 
		
		
	: (Form event code:C388=On Alternative Click:K2:36) | (Form event code:C388=On Clicked:K2:4)
		C_TEXT:C284($tableObjName)
		$tableObjName:="t"+String:C10(iUserMode_CurrentTable)
		If (OB Is defined:C1231(UserMode_actionObj; $tableObjName))
			
			ARRAY OBJECT:C1221($actionChoices; 0)
			OB GET ARRAY:C1229(UserMode_actionObj; $tableObjName; $actionChoices)
			
			ARRAY TEXT:C222($at_choices; 0)
			For ($i; 1; Size of array:C274($actionChoices))
				APPEND TO ARRAY:C911($at_choices; OB Get:C1224($actionChoices{$i}; "name"))
			End for 
			
			C_LONGINT:C283($i)
			For ($i; 1; Size of array:C274($at_choices))
				If ($i#1)
					$text:=$text+";"
				End if 
				$text:=$text+$at_choices{$i}
			End for 
			
			$selectedItem:=Pop up menu:C542($text)
			
			Case of 
				: ($selectedItem=0)
					
				: ($at_choices{$selectedItem}="Apply to Selection...") & (at_UserMode_ExecuteCallBack="")
					ALERT:C41("The callback method has not been set for this function")
					
				: ($at_choices{$selectedItem}="Apply to Selection...") & (at_UserMode_ExecuteCallBack="4D Default")
					C_TEXT:C284($myFormula)
					$myFormula:=""
					EDIT FORMULA:C806(Table:C252(iUserMode_CurrentTable)->; $myFormula)
					If (OK=1)
						C_POINTER:C301($currentTablePtr)
						$currentTablePtr:=Table:C252(iUserMode_CurrentTable)
						APPLY TO SELECTION:C70($currentTablePtr->; EXECUTE FORMULA:C63(_myFormula))
						REDRAW:C174(UserModeLB)
					End if 
					
				: ($at_choices{$selectedItem}="Apply to Selection...")
					If (ar_UserMode_Execute{iUserMode_CurrentTable})
						C_BOOLEAN:C305($vb_wasHandled)
						C_OBJECT:C1216($vo_details)
						$vo_details:=Dialog_AskUserForChangesToMake
						If (OK=1)
							EXECUTE METHOD:C1007(at_UserMode_ExecuteCallBack; $vb_wasHandled; $vo_details)
							REDRAW:C174(UserModeLB)
						End if 
					End if 
					
				Else 
					C_TEXT:C284($callbackMethod)
					$callbackMethod:=OB Get:C1224($actionChoices{$selectedItem}; "callback")
					If ($callbackMethod#"")
						EXECUTE METHOD:C1007($callbackMethod; *; Table:C252(iUserMode_CurrentTable); $at_choices{$selectedItem})
						CREATE EMPTY SET:C140(Table:C252(iUserMode_CurrentTable)->; "UserSet")
						UserMode_UpdateSelectedRecordSt
					Else 
						ALERT:C41("The callback method has not been set for this function")
					End if 
			End case 
			
		End if 
		
		
End case 