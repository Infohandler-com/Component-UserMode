//%attributes = {"invisible":true,"shared":true}
// UserMode_SetExecuteCallback (callbackMethod)
// UserMode_SetExecuteCallback (text)
// 
// DESCRIPTION
//   The callback method to use when the "Apply to Selection..."
//   choice is made from the action menu.
//   If "4D Default" is the callback then 4D's apply to selection
//   dialog will be shown.
//
C_TEXT:C284($1; at_UserMode_ExecuteCallBack)
// ----------------------------------------------------
// CALLED BY
//   
// ----------------------------------------------------
// HISTORY
//   Created by: DB (09/10/2016)
// ----------------------------------------------------

at_UserMode_ExecuteCallBack:=$1
