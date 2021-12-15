//%attributes = {"invisible":true}
// Array_ConvertToTextDelimited (arrayPtr{; delimiter}) : delimitedText
// Array_ConvertToTextDelimited (pointer{; text}) : text
// 
// DESCRIPTION
//   Converts the passed text array into a delimited
//   text string. The delimiter defaults to "," if not supplied.
//
C_POINTER:C301($1; $vp_arrayPtr)
C_TEXT:C284($2; $vt_theDelimiter)  // OPTIONAL
C_TEXT:C284($vt_delimitedText)
// ----------------------------------------------------
//   Created by: DB (04/20/07)
// ----------------------------------------------------

$vt_delimitedText:=""
If (Asserted:C1132((Count parameters:C259=1) | (Count parameters:C259=2)))
	$vp_arrayPtr:=$1
	If (Count parameters:C259=2)
		$vt_theDelimiter:=$2
	Else 
		$vt_theDelimiter:=","
	End if 
	
	C_LONGINT:C283($i)
	For ($i; 1; Size of array:C274($vp_arrayPtr->))
		$vt_delimitedText:=$vt_delimitedText+$vp_arrayPtr->{$i}
		$vt_delimitedText:=$vt_delimitedText+Choose:C955($i<Size of array:C274($vp_arrayPtr->); $vt_theDelimiter; "")
	End for 
	
End if   // ASSERT
$0:=$vt_delimitedText