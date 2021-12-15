//%attributes = {}


ARRAY TEXT:C222($at; Get last table number:C254)
$at{Table:C252(->[bTable_1:1])}:="Input"  // table 1
$at{Table:C252(->[aTable_2:2])}:="Input"  // table 2
$at{Table:C252(->[cTable_3:3])}:="Input"  // table 3
$at{Table:C252(->[Treatments:4])}:="Input"  // table 3
UserMode_Forms(->$at)


ARRAY BOOLEAN:C223($al_emptyArray; Get last table number:C254)
$al_emptyArray{Table:C252(->[aTable_2:2])}:=True:C214  //t1
$al_emptyArray{Table:C252(->[bTable_1:1])}:=True:C214  //t1
$al_emptyArray{Table:C252(->[cTable_3:3])}:=True:C214  //t1
$al_emptyArray{Table:C252(->[Treatments:4])}:=True:C214
UserMode_Access("Delete"; ->$al_emptyArray)
UserMode_Access("Report"; ->$al_emptyArray)
UserMode_Access("Import"; ->$al_emptyArray)
UserMode_Access("Export"; ->$al_emptyArray)
UserMode_Access("Show"; ->$al_emptyArray)

$al_emptyArray{Table:C252(->[bTable_1:1])}:=False:C215  //t1
UserMode_Access("Modify"; ->$al_emptyArray)

$al_emptyArray{Table:C252(->[aTable_2:2])}:=False:C215
$al_emptyArray{Table:C252(->[bTable_1:1])}:=True:C214
UserMode_Access("Execute"; ->$al_emptyArray)
UserMode_Access("New"; ->$al_emptyArray)

UserMode_AddSpecialQuery(->[bTable_1:1]; "Test1"; "_callbackQuery")
UserMode_AddSpecialQuery(->[bTable_1:1]; "Test2"; "_callbackQuery")

UserMode_AddSpecialAction(->[bTable_1:1]; "Test1"; "_callbackAction")
UserMode_AddSpecialAction(->[bTable_1:1]; "Test2"; "_callbackAction")

UserMode_SetExecuteCallback("_callbackExecute")
UserMode_SetViewCallback("_callbackView")

UserMode_AddUtilityMenuItem("2ndDTS"; "Utility_DTS_to_DateAndTime")

UserMode_Show(Table:C252(->[aTable_2:2]))