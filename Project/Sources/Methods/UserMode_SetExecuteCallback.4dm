//%attributes = {"invisible":true,"shared":true}
// UserMode_SetExecuteCallback (callbackMethod)
// 
// DESCRIPTION
//   The callback method to use when the "Apply to Selection..."
//   choice is made from the action menu.
//
//   If "4D Default" is the callback then 4D's apply to selection
//   dialog will be shown.
//
#DECLARE($callBack : Text)
// ----------------------------------------------------

var at_UserMode_ExecuteCallBack : Text

at_UserMode_ExecuteCallBack:=$callBack