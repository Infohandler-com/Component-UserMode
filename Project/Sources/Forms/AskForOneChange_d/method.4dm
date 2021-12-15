
Case of 
	: (Form event code:C388=On Activate:K2:9)
		Component_SetMenuBar
		
	: (Form event code:C388=On Load:K2:1)
		ARRAY TEXT:C222(at_fld; 0)
		C_REAL:C285(vr_fld)
		C_LONGINT:C283(vl_fld)
		C_TEXT:C284(vt_fld; va_fld)
		C_DATE:C307(vd_fld)
		C_TIME:C306(vh_fld)
		
		Component_SetMenuBar
		<>_tableName:="["+Table name:C256(_assignmentTablePtr)+"]"
		
		C_LONGINT:C283($assignmentTableNo)
		$assignmentTableNo:=Table:C252(_assignmentTablePtr)
		
		C_LONGINT:C283($i)
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
