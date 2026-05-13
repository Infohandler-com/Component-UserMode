// Must be non compiled and not as a component
If (Not:C34(Is compiled mode:C492)) & (Structure file:C489(*)=Structure file:C489)
	
	//Run 4DPop
	//This code is available even if the component is not present like in the final application.
	If (Not:C34(Is compiled mode:C492))
		ARRAY TEXT:C222($tTxt_Components; 0)
		COMPONENT LIST:C1001($tTxt_Components)
		If (Find in array:C230($tTxt_Components; "4DPop")>0)
			EXECUTE METHOD:C1007("4DPop_Palette")
		End if 
	End if 
	
	
	ARRAY TEXT:C222($at_components; 0)
	COMPONENT LIST:C1001($at_components)
	If (Find in array:C230($at_components; "Code Analysis")>0)
		EXECUTE METHOD:C1007("CA_OnStartup")
	End if 
	
	Manifest_SetAuthor("Dani Beaubien")
	Manifest_SetBuildDate(Current date:C33)
	Manifest_SetURL("http://infohandler.com")
	Manifest_SetCopyright("n/a; modifed open source")
	Manifest_SetVersion("build "+Date2String(Current date:C33; "YYYYMMDD"); True:C214)
End if 