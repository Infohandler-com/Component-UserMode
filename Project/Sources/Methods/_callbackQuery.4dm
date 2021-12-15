//%attributes = {}
C_POINTER:C301($1; $tablePtr)
C_TEXT:C284($2; $queryToRun)

$tablePtr:=$1
$queryToRun:=$2

Case of 
	: ($tablePtr=(->[bTable_1:1])) & ($queryToRun="Test1")
		ALL RECORDS:C47([bTable_1:1])
		REDUCE SELECTION:C351([bTable_1:1]; 1)
		
	: ($tablePtr=(->[bTable_1:1])) & ($queryToRun="Test2")
		ALERT:C41("In here "+$queryToRun)
		
End case 