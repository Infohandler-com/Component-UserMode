//%attributes = {}


var $tablePtr : Pointer
$tablePtr:=->[bTable_1:1]
$tablePtr:=->[aTable_2:2]
//$tablePtr:=->[cTable_3]

READ WRITE:C146($tablePtr->)
UserMode_Init
var $vo_new; $vo_old : Object
//$vo_new:=Dialog_AskForOneChange ($tablePtr)


var iUserMode_CurrentTable : Integer
iUserMode_CurrentTable:=Table:C252($tablePtr)  // setup UserMode_GetCurrentTable
$vo_new:=Dialog_AskUserForChangesToMake
//$vo_old:=Dialog_AskUserForChangesToMake2 

//ALERT(UserMode_GetAssignmentUserStr ($vo_new))

var $vo : Object
ALL RECORDS:C47($tablePtr->)
$vo:=UserMode_ExecuteFldAssignments($vo_new)

//If (OK=1)
//TRACE
//Else 
//TRACE
//End if 
