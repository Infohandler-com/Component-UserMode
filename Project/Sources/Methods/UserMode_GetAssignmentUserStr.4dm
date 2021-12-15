//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// UserMode_GetAssignmentUserStr (assignmentDetailsObj) : userFriendlyStr
// UserMode_GetAssignmentUserStr (object) : text
//
// DESCRIPTION
//   Returns a human readable string of all the assignment
//   statements that are in the object.
//
C_OBJECT:C1216($1; $assignmentDetailsObj)
C_TEXT:C284($0; $userFriendlyStr)
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (07/28/2017)
// ----------------------------------------------------

$userFriendlyStr:=""
If (Asserted:C1132(Count parameters:C259=1))
	$assignmentDetailsObj:=$1
	
	C_LONGINT:C283($tableNo)
	$tableNo:=OB Get:C1224($assignmentDetailsObj; "dstTableNo"; Is longint:K8:6)
	If ($tableNo>0)
		C_POINTER:C301($tablePtr)
		$tablePtr:=Table:C252($tableNo)
		
		C_LONGINT:C283($i)
		ARRAY OBJECT:C1221($assignmentStatements; 0)
		OB GET ARRAY:C1229($assignmentDetailsObj; "assignments"; $assignmentStatements)
		For ($i; 1; Size of array:C274($assignmentStatements))
			If ($i#1)
				$userFriendlyStr:=$userFriendlyStr+"\r"
			End if 
			$userFriendlyStr:=$userFriendlyStr+"- "+OB Get:C1224($assignmentStatements{$i}; "assignmentStatement")
		End for 
		
	End if 
End if 
$0:=$userFriendlyStr