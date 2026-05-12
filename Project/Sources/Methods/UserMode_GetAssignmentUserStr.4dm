//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// UserMode_GetAssignmentUserStr (assignmentDetailsObj) : userFriendlyStr
//
// DESCRIPTION
//   Returns a human readable string of all the assignment
//   statements that are in the object.
//
#DECLARE($assignmentDetailsObj : Object)->$userFriendlyStr : Text
// ----------------------------------------------------

$userFriendlyStr:=""
If (Asserted:C1132(Count parameters:C259=1))
	var $tableNo : Integer
	$tableNo:=OB Get:C1224($assignmentDetailsObj; "dstTableNo"; Is longint:K8:6)
	If ($tableNo>0)
		var $tablePtr : Pointer
		$tablePtr:=Table:C252($tableNo)
		
		var $i : Integer
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
