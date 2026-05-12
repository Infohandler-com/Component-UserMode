var $text : Text
var $selectedItem : Integer

Case of 
	: (Form event code:C388=On Clicked:K2:4) & (ar_UserMode_Report{iUserMode_CurrentTable})
		QR REPORT:C197(Table:C252(iUserMode_CurrentTable)->; Char:C90(1); True:C214; True:C214)
		
		
	: (Form event code:C388=On Alternative Click:K2:36) | (Form event code:C388=On Clicked:K2:4)
		ARRAY TEXT:C222($at_choices; 0)
		If (ar_UserMode_Report{iUserMode_CurrentTable})
			APPEND TO ARRAY:C911($at_choices; "Report")
		End if 
		If (ar_UserMode_Import{iUserMode_CurrentTable})
			APPEND TO ARRAY:C911($at_choices; "Import")
		End if 
		If (ar_UserMode_Export{iUserMode_CurrentTable})
			APPEND TO ARRAY:C911($at_choices; "Export")
		End if 
		
		var $i : Integer
		For ($i; 1; Size of array:C274($at_choices))
			If ($i#1)
				$text:=$text+";"
			End if 
			$text:=$text+$at_choices{$i}
		End for 
		
		$selectedItem:=Pop up menu:C542($text)
		
		Case of 
			: ($at_choices{$selectedItem}="Report")
				If (ar_UserMode_Report{iUserMode_CurrentTable})
					QR REPORT:C197(Table:C252(iUserMode_CurrentTable)->; Char:C90(1); True:C214; True:C214)
				End if 
				
			: ($at_choices{$selectedItem}="Import")
				If (ar_UserMode_Import{iUserMode_CurrentTable})
					DEFAULT TABLE:C46(Table:C252(iUserMode_CurrentTable)->)
					
					ARRAY TEXT:C222($tableTitles; 0)
					ARRAY LONGINT:C221($tableID; 0)
					GET TABLE TITLES:C803($tableTitles; $tableID)
					ARRAY TEXT:C222($newtableTitles; 1)
					ARRAY LONGINT:C221($newtableID; 1)
					$newtableTitles{1}:=Table name:C256(iUserMode_CurrentTable)
					$newtableID{1}:=iUserMode_CurrentTable
					SET TABLE TITLES:C601($newtableTitles; $newtableID)
					IMPORT DATA:C665(""; *)
					SET TABLE TITLES:C601($tableTitles; $tableID)
				End if 
				
			: ($at_choices{$selectedItem}="Export")
				If (ar_UserMode_Export{iUserMode_CurrentTable})
					var $project : Text
					$project:="<?xml version=\"1.0\" encoding=\"UTF-8\"?><settings-import-export char_display_format=\"decimal\" encoding=\"UTF-8\" format=\"text\" platform=\"automatic\" table_no=\""+String:C10(iUserMode_CurrentTable)+"\"><text_settings delimiter_field=\"9\" delimiter_record=\"13\" with_column_title=\"false\"/><xml_setti"+"ngs export_xsl_mode=\"none\"/></settings-import-export>"
					
					ARRAY TEXT:C222($tableTitles; 0)
					ARRAY LONGINT:C221($tableID; 0)
					GET TABLE TITLES:C803($tableTitles; $tableID)
					ARRAY TEXT:C222($newtableTitles; 1)
					ARRAY LONGINT:C221($newtableID; 1)
					$newtableTitles{1}:=Table name:C256(iUserMode_CurrentTable)
					$newtableID{1}:=iUserMode_CurrentTable
					SET TABLE TITLES:C601($newtableTitles; $newtableID)
					EXPORT DATA:C666(""; $project; *)
					SET TABLE TITLES:C601($tableTitles; $tableID)
				End if 
		End case 
End case 



