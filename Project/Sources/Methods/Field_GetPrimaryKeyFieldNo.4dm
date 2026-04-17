//%attributes = {"invisible":true}
// Field_GetPrimaryKeyFieldNo (tableNo) : fieldNo
// 
// DESCRIPTION
//   Returns the field number of the primary key field for
//   the specified table.
//
#DECLARE($vl_tableNo : Integer) : Integer
// ----------------------------------------------------

var _table_No; _field_no : Integer
If (Asserted:C1132(Count parameters:C259=1)) && ($vl_tableNo>0)
	table_No:=$vl_tableNo
	
	Begin SQL
		--SELECT uc.constraint_type, ucc.table_name, ucc.table_id, ucc.column_name, ucc.column_id, ucc.column_position 
		SELECT ucc.column_id
		FROM _USER_CONS_COLUMNS ucc
		INNER JOIN _USER_CONSTRAINTS uc on uc.CONSTRAINT_ID=ucc.CONSTRAINT_ID
		WHERE uc.constraint_type='P' and ucc.table_id=:table_No
		INTO :_field_no
	End SQL
	
End if   // ASSERT

return _field_no