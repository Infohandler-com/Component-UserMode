//%attributes = {}

#DECLARE($tablePtr : Pointer; $queryToRun : Text)

Case of 
	: ($tablePtr=(->[bTable_1:1])) & ($queryToRun="Test1")
		ALL RECORDS:C47([bTable_1:1])
		REDUCE SELECTION:C351([bTable_1:1]; 1)
		
	: ($tablePtr=(->[bTable_1:1])) & ($queryToRun="Test2")
		ALERT:C41("In here "+$queryToRun)
		
End case 