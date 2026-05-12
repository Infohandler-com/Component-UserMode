//%attributes = {"invisible":true,"shared":true}
// UserMode_Show ({tableNo})
//   Displays the user mode. Optional param says which
//   table to show by default.
// 
#DECLARE($tableNo : Integer)
// ----------------------------------------------------
// Anwender (OS): Thomas Maul
// Datum und Zeit: 26.02.09
// ----------------------------------------------------
var $pos : Integer
var $newtable : Integer
var $win : Integer
var $name : Text
var $windowtitle : Text


UserMode_Init

If (Count parameters:C259>0)
	If (($tableNo>=1) & ($tableNo<=Last table number:C254))
		If (Is table number valid:C999($tableNo))
			$name:=Table name:C256($tableNo)
			$pos:=Find in array:C230(ar_UserMode_TableNames; $name)
			If ($pos>0)
				var $ptr : Pointer
				$ptr:=ar_UserMode_TablePtrs{$pos}
				$newtable:=Table:C252($ptr)
				If ($newtable#iUserMode_CurrentTable)
					iUserMode_CurrentTable:=$newtable
					<>_tableName:="["+Table name:C256(iUserMode_CurrentTable)+"]"
					//UserMode_Listbox_Init 
				End if 
			End if 
		End if 
	End if 
End if 

If (iUserMode_CurrentTable>0)
	$windowtitle:=Localized string:C991("UserMode WindowTitle")
	$win:=Open window:C153(80; 120; Screen width:C187-80; Screen height:C188-80; Plain window:K34:13; $windowtitle; "UserMode_CloseWindow")
	DIALOG:C40("UserMode_Listbox")
	CLOSE WINDOW:C154($win)
End if 
