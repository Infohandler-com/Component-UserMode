//%attributes = {"invisible":true}
// AskForOneChange_selectField ()
//
// DESCRIPTION
//   Manages the UI for the "AskForOneChange_d" dialog
//   when the "Value from Another Field" radio button is selected.
//
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (07/28/2017)
// ----------------------------------------------------

OBJECT SET VISIBLE:C603(*; "@_fld"; False:C215)
OBJECT SET VISIBLE:C603(*; "anotherField_fld"; True:C214)

Array_Empty(->al_UserMode_FieldNo_COPY)
Array_Empty(->at_UserMode_FieldNames_COPY)

COPY ARRAY:C226(al_UserMode_FieldNo; al_UserMode_FieldNo_COPY)
COPY ARRAY:C226(at_UserMode_FieldNames; at_UserMode_FieldNames_COPY)

C_LONGINT:C283($i)
For ($i; Size of array:C274(al_UserMode_FieldNo_COPY); 1; -1)
	If (al_UserMode_FieldNo{$i}=al_UserMode_FieldNo{at_UserMode_FieldNames})  // Remove the same field from the dropdown
		DELETE FROM ARRAY:C228(al_UserMode_FieldNo_COPY; $i; 1)
		DELETE FROM ARRAY:C228(at_UserMode_FieldNames_COPY; $i; 1)
		
	Else 
		
		If (al_UserMode_FieldType{$i}#al_UserMode_FieldType{at_UserMode_FieldNames})  // Remove any fields that don't match the type
			DELETE FROM ARRAY:C228(al_UserMode_FieldNo_COPY; $i; 1)
			DELETE FROM ARRAY:C228(at_UserMode_FieldNames_COPY; $i; 1)
		End if 
	End if 
End for 
at_UserMode_FieldNames_COPY:=1  // no value selected


If (Size of array:C274(at_UserMode_FieldNames_COPY)=0)
	OBJECT SET ENABLED:C1123(bContinue; False:C215)
Else 
	OBJECT SET ENABLED:C1123(bContinue; True:C214)
End if 