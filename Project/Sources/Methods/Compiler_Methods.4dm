//%attributes = {"invisible":true}


//UserMode_Show
C_LONGINT:C283(UserMode_Show; $1)

//UserMode_IsFormExisting
C_BOOLEAN:C305(UserMode_IsFormExisting; $0)
C_TEXT:C284(UserMode_IsFormExisting; $1)

//UserMode_Init
C_LONGINT:C283(UserMode_Init; $1)

//UserMode_Forms
C_POINTER:C301(UserMode_Forms; $1)

//UserMode_ConvertFieldToText
C_TEXT:C284(UserMode_ConvertFieldToText; $0)
C_POINTER:C301(UserMode_ConvertFieldToText; $1)

//UserMode_Access
C_TEXT:C284(UserMode_Access; $1)
C_POINTER:C301(UserMode_Access; $2)

//UserMode_SetExecuteCallback
C_TEXT:C284(UserMode_SetExecuteCallback; $1)

//_callbackExecute
C_BOOLEAN:C305(_callbackExecute; $0)
C_OBJECT:C1216(_callbackExecute; $1)

//_callbackView
C_BOOLEAN:C305(_callbackView; $0)
C_POINTER:C301(_callbackView; $1)
C_OBJECT:C1216(_callbackView; $2)

//UserMode_SetViewCallback
C_TEXT:C284(UserMode_SetViewCallback; $1)

//UserMode_Show_SetView
C_LONGINT:C283(UserMode_Show_SetView; $1)
C_OBJECT:C1216(UserMode_Show_SetView; $2)

//TS_GetDate
C_DATE:C307(TS_GetDate; $0)
C_LONGINT:C283(TS_GetDate; $1)

//TS_GetTime
C_TIME:C306(TS_GetTime; $0)
C_LONGINT:C283(TS_GetTime; $1)

//UserMode_AddUtilityMenuItem
C_TEXT:C284(UserMode_AddUtilityMenuItem; $1)
C_TEXT:C284(UserMode_AddUtilityMenuItem; $2)

//UserMode_GetCurrentTable
C_LONGINT:C283(UserMode_GetCurrentTable; $0)

//Dialog_AskUserForChangesToMake
C_OBJECT:C1216(Dialog_AskUserForChangesToMake; $0)

//Dialog_AskUserForChangesToMake2
C_OBJECT:C1216(Dialog_AskUserForChangesToMake2; $0)

//Dialog_AskForOneChange
C_OBJECT:C1216(Dialog_AskForOneChange; $0)
C_POINTER:C301(Dialog_AskForOneChange; $1)

//AskForOneChange_InitFieldArrays
C_LONGINT:C283(AskForOneChange_InitFieldArrays; $1)
C_POINTER:C301(AskForOneChange_InitFieldArrays; $2)
C_POINTER:C301(AskForOneChange_InitFieldArrays; $3)
C_POINTER:C301(AskForOneChange_InitFieldArrays; $4)

//Array_Empty
C_POINTER:C301(Array_Empty; $1)

//UserMode_GetAssignmentUserStr
C_TEXT:C284(UserMode_GetAssignmentUserStr; $0)
C_OBJECT:C1216(UserMode_GetAssignmentUserStr; $1)

//UserMode_ExecuteFldAssignments
C_OBJECT:C1216(UserMode_ExecuteFldAssignments; $0)
C_OBJECT:C1216(UserMode_ExecuteFldAssignments; $1)

//UserMode_AddSpecialQuery
C_POINTER:C301(UserMode_AddSpecialQuery; $1)
C_TEXT:C284(UserMode_AddSpecialQuery; $2)
C_TEXT:C284(UserMode_AddSpecialQuery; $3)

//_callbackQuery
C_POINTER:C301(_callbackQuery; $1)
C_TEXT:C284(_callbackQuery; $2)

//Array_ConvertFromTextDelimited
C_POINTER:C301(Array_ConvertFromTextDelimited; $1)
C_TEXT:C284(Array_ConvertFromTextDelimited; $2)
C_TEXT:C284(Array_ConvertFromTextDelimited; $3)

//Array_ConvertToTextDelimited
C_TEXT:C284(Array_ConvertToTextDelimited; $0)
C_POINTER:C301(Array_ConvertToTextDelimited; $1)
C_TEXT:C284(Array_ConvertToTextDelimited; $2)

//UserMode_AddSpecialAction
C_POINTER:C301(UserMode_AddSpecialAction; $1)
C_TEXT:C284(UserMode_AddSpecialAction; $2)
C_TEXT:C284(UserMode_AddSpecialAction; $3)

//_callbackAction
C_POINTER:C301(_callbackAction; $1)
C_TEXT:C284(_callbackAction; $2)

//Field_IsIndexed
C_BOOLEAN:C305(Field_IsIndexed; $0)
C_POINTER:C301(Field_IsIndexed; $1)

//Field_GetPrimaryKeyFieldNo
C_LONGINT:C283(Field_GetPrimaryKeyFieldNo; $0)
C_LONGINT:C283(Field_GetPrimaryKeyFieldNo; $1)

//UserMode_ShowWithCopyInit
C_LONGINT:C283(UserMode_ShowWithCopyInit; $1)

//UserMode_DisplayOneRecord
C_POINTER:C301(UserMode_DisplayOneRecord; $1)
C_TEXT:C284(UserMode_DisplayOneRecord; $2)
C_TEXT:C284(UserMode_DisplayOneRecord; $3)

//Date2String
C_TEXT:C284(Date2String; $0)
C_DATE:C307(Date2String; $1)
C_TEXT:C284(Date2String; $2)

//Time2String
C_TEXT:C284(Time2String; $0)
C_TIME:C306(Time2String; $1)
C_TEXT:C284(Time2String; $2)