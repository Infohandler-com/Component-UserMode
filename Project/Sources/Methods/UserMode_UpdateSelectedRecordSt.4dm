//%attributes = {"invisible":true,"preemptive":"capable"}
// UserMode_UpdateSelectedRecordSt ()
//
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (09/09/2016)
// ----------------------------------------------------

var tbl_selectedRecs : Text
If (ar_UserMode_TableNames=0)
	tbl_selectedRecs:=""
	
Else 
	var $vp_tablePtr : Pointer
	$vp_tablePtr:=ar_UserMode_TablePtrs{ar_UserMode_TableNames}
	
	var $vl_selectedRecords; $vl_foundRecords : Integer
	$vl_selectedRecords:=Records in set:C195("UserSet")
	$vl_foundRecords:=Records in selection:C76($vp_tablePtr->)
	
	var $vt_tableName : Text
	$vt_tableName:=Table name:C256($vp_tablePtr)
	
	tbl_selectedRecs:=String:C10($vl_selectedRecords)+" of "+String:C10($vl_foundRecords)+" records selected"
	
	tbl_selectedRecs:=tbl_selectedRecs+"; "+String:C10(Records in table:C83($vp_tablePtr->))+" records in table"
	
End if 