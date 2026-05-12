//%attributes = {"invisible":true}
// Array_ConvertFromTextDelimited (ArrayPtr, srcText{; delimiter})
// Array_ConvertFromTextDelimited (pointer; text{; text})
//
// DESCRIPTION
//   Converts a delimited text string into values
//   in the passed text array.  The delimiter defaults to "," if not supplied.
//
#DECLARE($vp_arrayPtr : Pointer; $vt_srcTxt : Text; $theDelimiter : Text)
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (04/19/07)
//   Mod: DB (09/25/2012) - Fixed bug if last character of srcTxt is the delimiter
//   Mod: DB (09/25/2012) - Removed code that trimed extra spaces
// ----------------------------------------------------

ASSERT:C1129(Count parameters:C259>=2)
ASSERT:C1129(Count parameters:C259<=3)

If ($theDelimiter="")
	$theDelimiter:=","
End if 

Array_Empty($vp_arrayPtr)

var $vl_delSize; $pos : Integer
$vl_delSize:=Length:C16($theDelimiter)

If ($vt_srcTxt#"")
	$pos:=Position:C15($theDelimiter; $vt_srcTxt; *)
	While ($pos>0)
		APPEND TO ARRAY:C911($vp_arrayPtr->; Substring:C12($vt_srcTxt; 1; $pos-1))
		$vt_srcTxt:=Substring:C12($vt_srcTxt; $pos+$vl_delSize)
		
		$pos:=Position:C15($theDelimiter; $vt_srcTxt; *)
	End while 
	
	//   Mod: DB (09/25/2012) - Add the an element for the last line.
	APPEND TO ARRAY:C911($vp_arrayPtr->; $vt_srcTxt)
End if 
