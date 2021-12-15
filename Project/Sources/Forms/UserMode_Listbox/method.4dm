C_LONGINT:C283(Field1; Field2; Field3; Field4; Field5; Field6; Field7; Field8; Field9; Field10; Field11; Field12; Field13; Field14; Field15; Field16; Field17; Field18; Field19)
C_LONGINT:C283(Field20; Field21; Field22; Field23; Field24; Field25; Field26; Field27; Field28; Field29; Field30; Field31; Field32; Field33; Field34; Field35; Field36; Field37; Field38; Field39)
C_LONGINT:C283(Field40; Field41; Field42; Field43; Field44; Field45; Field46; Field47; Field48; Field49; Field50)
C_LONGINT:C283(Field51; Field52; Field53; Field54; Field55; Field56; Field57; Field58; Field59; Field60; Field61; Field62; Field63; Field64; Field65; Field66; Field67; Field68; Field69; Field70; Field71; Field72; Field73; Field74; Field75; Field76; Field77; Field78; Field79; Field80; Field81; Field82; Field83; Field84; Field85; Field86; Field87; Field88; Field89; Field90; Field91; Field92; Field93; Field94; Field95; Field96; Field97; Field98; Field99; Field100)

C_LONGINT:C283(Header1; Header2; Header3; Header4; Header5; Header6; Header7; Header8; Header9; Header10; Header11; Header12; Header13; Header14; Header15; Header16; Header17; Header18; Header19)
C_LONGINT:C283(Header20; Header21; Header22; Header23; Header24; Header25; Header26; Header27; Header28; Header29; Header30; Header31; Header32; Header33; Header34; Header35; Header36; Header37; Header38; Header39)
C_LONGINT:C283(header40; Header41; Header42; Header43; Header44; Header45; Header46; Header47; Header48; Header49; Header50)
C_LONGINT:C283(Header51; Header52; Header53; Header54; Header55; Header56; Header57; Header58; Header59; Header60; Header61; Header62; Header63; Header64; Header65; Header66; Header67; Header68; Header69; Header70; Header71; Header72; Header73; Header74; Header75; Header76; Header77; Header78; Header79; Header80; Header81; Header82; Header83; Header84; Header85; Header86; Header87; Header88; Header89; Header90; Header91; Header92; Header93; Header94; Header95; Header96; Header97; Header98; Header99; Header100)

C_TEXT:C284($name)
C_TEXT:C284($text1; $text2; $text3)
C_TEXT:C284($who)
C_TEXT:C284($t)
C_LONGINT:C283($pos)
C_LONGINT:C283($mylong)

Case of 
	: (Process aborted:C672)
		CANCEL:C270
		
	: (Form event code:C388=On Activate:K2:9)
		Component_SetMenuBar
		
	: (Form event code:C388=On Load:K2:1)
		UserMode_Init  // should have been done already...
		UserMode_Listbox_Init
		Component_SetMenuBar
		
		If (iUserMode_CurrentTable>0)
			$name:=Table name:C256(iUserMode_CurrentTable)
			$pos:=Find in array:C230(ar_UserMode_TableNames; $name)
			If ($pos>0)
				ar_UserMode_TableNames:=$pos  // popup
			Else 
				ar_UserMode_TableNames:=1
			End if 
		End if 
		
		
	: (Form event code:C388=On Close Box:K2:21)
		CANCEL:C270
		
		
	: (Form event code:C388=On Double Clicked:K2:5)
		If (UserMode_IsFormExisting(ar_UserMode_Forms{iUserMode_CurrentTable}))
			//CUT NAMED SELECTION(Table(iUserMode_CurrentTable)->;"UserMode_memory")
			If (ar_UserMode_Modify{iUserMode_CurrentTable})
				READ WRITE:C146(Table:C252(iUserMode_CurrentTable)->)
			Else 
				READ ONLY:C145(Table:C252(iUserMode_CurrentTable)->)
			End if 
			//USE SET("UserSet")
			
			//If (Locked(Table(iUserMode_CurrentTable)->))
			LOAD RECORD:C52(Table:C252(iUserMode_CurrentTable)->)
			//End if 
			
			If (Is record loaded:C669(Table:C252(iUserMode_CurrentTable)->))
				If (Locked:C147(Table:C252(iUserMode_CurrentTable)->)) & (ar_UserMode_Modify{iUserMode_CurrentTable})
					LOCKED BY:C353(Table:C252(iUserMode_CurrentTable)->; $mylong; $text1; $text2; $text3)
					$name:=Table name:C256(iUserMode_CurrentTable)
					$who:=$text1+"/"+$text2+" ("+$text3+")"
					$t:=Get localized string:C991("UserMode Locked")
					$t:=Replace string:C233($t; "$1"; $name)
					$t:=Replace string:C233($t; "$2"; $who)
					CONFIRM:C162($t)
					If (OK=1)
						LOAD RECORD:C52(Table:C252(iUserMode_CurrentTable)->)  // record lost by confirm redraw
						ONE RECORD SELECT:C189(Table:C252(iUserMode_CurrentTable)->)
						READ ONLY:C145(Table:C252(iUserMode_CurrentTable)->)
						DISPLAY SELECTION:C59(Table:C252(iUserMode_CurrentTable)->)
						READ WRITE:C146(Table:C252(iUserMode_CurrentTable)->)
					End if 
				Else 
					If (ar_UserMode_Modify{iUserMode_CurrentTable})
						MODIFY RECORD:C57(Table:C252(iUserMode_CurrentTable)->; *)
						REDRAW:C174(UserModeLB)
					Else 
						UserMode_DisplayOneRecord(Table:C252(iUserMode_CurrentTable); ar_UserMode_Forms{iUserMode_CurrentTable})
						//DISPLAY SELECTION(Table(iUserMode_CurrentTable)->)
					End if 
				End if 
			Else 
				BEEP:C151
			End if 
			
			//USE NAMED SELECTION("UserMode_memory")
		End if 
		
		
End case 

If (Form event code:C388=On Load:K2:1) | (Form event code:C388=On Clicked:K2:4)
	UserMode_UpdateSelectedRecordSt
End if 