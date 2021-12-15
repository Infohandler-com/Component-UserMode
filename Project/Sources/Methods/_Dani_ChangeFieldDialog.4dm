//%attributes = {}


C_POINTER:C301($tablePtr)
$tablePtr:=->[bTable_1:1]
$tablePtr:=->[aTable_2:2]
//$tablePtr:=->[cTable_3]

READ WRITE:C146($tablePtr->)
UserMode_Init
C_OBJECT:C1216($vo_new; $vo_old)
//$vo_new:=Dialog_AskForOneChange ($tablePtr)


C_LONGINT:C283(iUserMode_CurrentTable)
iUserMode_CurrentTable:=Table:C252($tablePtr)  // setup UserMode_GetCurrentTable
$vo_new:=Dialog_AskUserForChangesToMake
//$vo_old:=Dialog_AskUserForChangesToMake2 

//ALERT(UserMode_GetAssignmentUserStr ($vo_new))

C_OBJECT:C1216($vo)
ALL RECORDS:C47($tablePtr->)
$vo:=UserMode_ExecuteFldAssignments($vo_new)

//If (OK=1)
//TRACE
//Else 
//TRACE
//End if 
