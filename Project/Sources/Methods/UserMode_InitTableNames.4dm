//%attributes = {"invisible":true}
// ----------------------------------------------------
// Anwender (OS): Thomas Maul
// Datum und Zeit: 26.02.09
// ----------------------------------------------------
// Methode: UserMode_InitTableNames
// Internal - InitTableNames array, needed after changing displayed/hidden tables
// 
//
// Parameter  -  none
// ----------------------------------------------------
var $i : Integer

ARRAY TEXT:C222(ar_UserMode_TableNames; 0)  // force reset
ARRAY POINTER:C280(ar_UserMode_TablePtrs; 0)  // force reset

iUserMode_CurrentTable:=0
For ($i; 1; Size of array:C274(ar_UserMode_Show))
	If (ar_UserMode_Show{$i})
		If (Is table number valid:C999($i))
			If (iUserMode_CurrentTable=0)
				iUserMode_CurrentTable:=$i
			End if 
			APPEND TO ARRAY:C911(ar_UserMode_TableNames; Table name:C256($i))
			APPEND TO ARRAY:C911(ar_UserMode_TablePtrs; Table:C252($i))
		End if 
	End if 
End for 
SORT ARRAY:C229(ar_UserMode_TableNames; ar_UserMode_TablePtrs; >)