//%attributes = {"invisible":true}
// Field_GetPrimaryKeyFieldNo (tableNo) : fieldNo
// Field_GetPrimaryKeyFieldNo (longint) : longint
// 
// DESCRIPTION
//   Returns the field number of the primary key field for
//   the specified table.
//
C_LONGINT:C283($1; $vl_tableNo)
C_LONGINT:C283($0; $vl_fieldNo)
// ----------------------------------------------------
// HISTORY
//   Created by: DB (09/15/2016)
// ----------------------------------------------------

$vl_fieldNo:=0
If (Asserted:C1132(Count parameters:C259=1))
	$vl_tableNo:=$1
	
	If ($vl_tableNo>0)
		Begin SQL
			--SELECT uc.constraint_type, ucc.table_name, ucc.table_id, ucc.column_name, ucc.column_id, ucc.column_position 
			SELECT ucc.column_id
			FROM _USER_CONS_COLUMNS ucc
			INNER JOIN _USER_CONSTRAINTS uc on uc.CONSTRAINT_ID=ucc.CONSTRAINT_ID
			WHERE uc.constraint_type='P' and ucc.table_id=:$vl_tableNo
			INTO :$vl_fieldNo
		End SQL
	End if 
	
End if   // ASSERT
$0:=$vl_fieldNo