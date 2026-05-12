
Case of 
	: (Form event code:C388=On Activate:K2:9)
		Component_SetMenuBar
		
	: (Form event code:C388=On Load:K2:1)
		ARRAY TEXT:C222(at_fld; 0)
		var vr_fld : Real
		var vl_fld : Integer
		var vt_fld; va_fld : Text
		var vd_fld : Date
		var vh_fld : Time
		
		Component_SetMenuBar
		<>_tableName:="["+Table name:C256(_assignmentTablePtr)+"]"
		
		var $assignmentTableNo : Integer
		$assignmentTableNo:=Table:C252(_assignmentTablePtr)
		
		var $i : Integer
		ARRAY LONGINT:C221(al_UserMode_FieldType; 0)
		ARRAY LONGINT:C221(al_UserMode_FieldNo; 0)
		ARRAY TEXT:C222(at_UserMode_FieldNames; 0)
		AskForOneChange_InitFieldArrays($assignmentTableNo; ->at_UserMode_FieldNames; ->al_UserMode_FieldNo; ->al_UserMode_FieldType)
		SORT ARRAY:C229(at_UserMode_FieldNames; al_UserMode_FieldNo; al_UserMode_FieldType; >)
		at_UserMode_FieldNames:=1
		
		// used when selecting custom values
		ARRAY LONGINT:C221(al_UserMode_FieldNo_COPY; 0)
		ARRAY TEXT:C222(at_UserMode_FieldNames_COPY; 0)
		
		Dialog_AskForOneChange_select
End case 
