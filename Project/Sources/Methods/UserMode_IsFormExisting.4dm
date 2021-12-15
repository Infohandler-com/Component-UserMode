//%attributes = {"invisible":true}

// ----------------------------------------------------
// Anwender (OS): Thomas Maul
// Datum und Zeit: 02.03.09
// ----------------------------------------------------
// Methode: UserMode_IsFormExisting
// Internal
// checks if Form is existing, if yes it is used as new input form
//
// Parameter
// $1 = form name
// $0 = true/false
// ----------------------------------------------------
C_TEXT:C284($name)

$name:=Method called on error:C704
UserMode_Error:=0
ON ERR CALL:C155("UserMode_OnErr")

FORM SET INPUT:C55(Table:C252(iUserMode_CurrentTable)->; $1)

ON ERR CALL:C155($name)

If (UserMode_Error=0)
	$0:=True:C214
Else 
	$0:=False:C215
End if 