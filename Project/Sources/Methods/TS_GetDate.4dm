//%attributes = {"invisible":true}
// METHOD: TS_GetDate
// $1 = Date and time in a Longint
// $0 = date
#DECLARE($DateTime : Integer) : Date

var $RefDate : Date
var $Offset : Integer
$RefDate:=!1990-01-01!
$Offset:=86400  // aka 24*60*60

return $RefDate+Int:C8($DateTime/$Offset)

