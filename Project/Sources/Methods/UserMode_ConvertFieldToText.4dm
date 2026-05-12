//%attributes = {"invisible":true}
// ----------------------------------------------------
// Anwender (OS): Thomas Maul
// Datum und Zeit: 26.02.09
// ----------------------------------------------------
// Methode: UserMode_ConvertFieldToText
// Internal - return field content as text
// 
#DECLARE($fieldptr : Pointer) : Text
// ----------------------------------------------------
var $Fieldtyp : Integer
var $text : Text

$Fieldtyp:=Type:C295($fieldptr->)

If ($fieldtyp#Is subtable:K8:11)
	
	Case of 
		: (($fieldtyp=Is alpha field:K8:1) | ($fieldtyp=Is text:K8:3))
			$text:=$fieldptr->
			$text:=Replace string:C233($text; Char:C90(13); " ")
			return Replace string:C233($text; Char:C90(9); " ")
			
		: ($fieldtyp=Is real:K8:4)
			return String:C10($fieldptr->)
			
		: (($fieldtyp=Is integer:K8:5) | ($fieldtyp=Is longint:K8:6))
			return String:C10($fieldptr->)
			
		: (($fieldtyp=Is date:K8:7))
			return String:C10($fieldptr->; Internal date short:K1:7)
			
		: (($fieldtyp=Is time:K8:8))
			return String:C10($fieldptr->; HH MM:K7:2)
			
		: (($fieldtyp=Is boolean:K8:9))
			return String:C10(Num:C11($fieldptr->))
			
	End case 
End if 

return ""