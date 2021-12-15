//%attributes = {}
C_POINTER:C301($1; $tablePtr)
C_TEXT:C284($2; $actionToRun)

$tablePtr:=$1
$actionToRun:=$2

Case of 
	: ($tablePtr=(->[bTable_1:1])) & ($actionToRun="Test1")
		ALERT:C41("action "+$actionToRun+" selected for table [bTable_1]")
		
	: ($tablePtr=(->[bTable_1:1])) & ($actionToRun="Test2")
		ALERT:C41("action "+$actionToRun+" selected for table [bTable_1]")
		
End case 