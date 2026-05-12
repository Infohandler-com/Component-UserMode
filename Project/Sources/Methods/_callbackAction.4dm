//%attributes = {}

#DECLARE($tablePtr : Pointer; $actionToRun : Text)

Case of 
	: ($tablePtr=(->[bTable_1:1])) & ($actionToRun="Test1")
		ALERT:C41("action "+$actionToRun+" selected for table [bTable_1]")
		
	: ($tablePtr=(->[bTable_1:1])) & ($actionToRun="Test2")
		ALERT:C41("action "+$actionToRun+" selected for table [bTable_1]")
		
End case 