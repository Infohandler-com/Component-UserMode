//%attributes = {"invisible":true}
// UserMode_UpdateSelectedRecordSt ()
//
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (09/09/2016)
// ----------------------------------------------------

C_TEXT:C284(tbl_selectedRecs)
If (ar_UserMode_TableNames=0)
	tbl_selectedRecs:=""
	
Else 
	C_POINTER:C301($vp_tablePtr)
	$vp_tablePtr:=ar_UserMode_TablePtrs{ar_UserMode_TableNames}
	
	C_LONGINT:C283($vl_selectedRecords; $vl_foundRecords)
	$vl_selectedRecords:=Records in set:C195("UserSet")
	$vl_foundRecords:=Records in selection:C76($vp_tablePtr->)
	
	C_TEXT:C284($vt_tableName)
	$vt_tableName:=Table name:C256($vp_tablePtr)
	
	tbl_selectedRecs:=String:C10($vl_selectedRecords)+" of "+String:C10($vl_foundRecords)+" records selected"
	
	tbl_selectedRecs:=tbl_selectedRecs+"; "+String:C10(Records in table:C83($vp_tablePtr->))+" records in table"
	
End if 