//%attributes = {"invisible":true}
// Array_ConvertToTextDelimited (arrayPtr{; delimiter}) : delimitedText
// 
// DESCRIPTION
//   Converts the passed text array into a delimited
//   text string. The delimiter defaults to "," if not supplied.
//
#DECLARE($vp_arrayPtr : Pointer\
; $vt_theDelimiter : Text)->$vt_delimitedText : Text
// ----------------------------------------------------
$vt_delimitedText:=""

If (Asserted:C1132((Count parameters:C259=1) | (Count parameters:C259=2)))
	If ($vt_theDelimiter="")
		$vt_theDelimiter:=","
	End if 
	
	var $i : Integer
	For ($i; 1; Size of array:C274($vp_arrayPtr->))
		$vt_delimitedText:=$vt_delimitedText+$vp_arrayPtr->{$i}
		$vt_delimitedText:=$vt_delimitedText+Choose:C955($i<Size of array:C274($vp_arrayPtr->); $vt_theDelimiter; "")
	End for 
	
End if 
