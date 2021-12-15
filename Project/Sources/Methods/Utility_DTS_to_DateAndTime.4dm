//%attributes = {"invisible":true}
// Utility_DTS_to_DateAndTime ()
// 
// DESCRIPTION
//   lets the user provide a DTS Number and it converts
//   it to a date and time.
//
// ----------------------------------------------------
// HISTORY
//   Created by: DB (10/07/2016)
// ----------------------------------------------------

C_LONGINT:C283($vl_dts)
$vl_dts:=Num:C11(Request:C163("DTS Number to convert:"; ""; "Get Date & Time"; "Cancel"))
Case of 
	: (OK=0)
		// User Cancelled
		
	: ($vl_dts<0)
		ALERT:C41("Expecting a number > 0.")
		
End case 

If ($vl_dts>0)
	C_DATE:C307($vd)
	C_TIME:C306($vh)
	$vd:=TS_GetDate($vl_dts)
	$vh:=TS_GetTime($vl_dts)
	
	ALERT:C41(String:C10($vl_dts)+" converts to ...\r\r\rDate: "+String:C10($vd; System date short:K1:1)+"\rTime: "+String:C10($vh; System time short:K7:9))
End if 