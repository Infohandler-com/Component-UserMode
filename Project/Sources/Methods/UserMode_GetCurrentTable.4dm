//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// UserMode_GetCurrentTable () : tableNo
// 
// DESCRIPTION
//   Returns the table number that is currently being displayed.
//   A 0 is returned if the current process is not showing a UserMode window.
//
#DECLARE() : Integer
// ----------------------------------------------------
// HISTORY
//   Created by: DB (10/08/2016)
// ----------------------------------------------------

var iUserMode_CurrentTable : Integer

return iUserMode_CurrentTable