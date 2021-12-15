//%attributes = {"invisible":true,"shared":true}
// UserMode_GetCurrentTable () : tableNo
// UserMode_GetCurrentTable () : longint
// 
// DESCRIPTION
//   Returns the table number that is currently being displayed.
//   A 0 is returned if the current process is not showing a UserMode window.
//
C_LONGINT:C283($0; iUserMode_CurrentTable)
// ----------------------------------------------------
// CALLED BY
//   
// ----------------------------------------------------
// HISTORY
//   Created by: DB (10/08/2016)
// ----------------------------------------------------

$0:=iUserMode_CurrentTable
