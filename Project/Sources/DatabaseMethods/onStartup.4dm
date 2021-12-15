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
		CA_ShowQuickLauncher
	End if 
	If (Find in array:C230($at_components; "Mainfest Generator")>0)
		EXECUTE METHOD:C1007("Manifest_SetAuthor"; *; "Dani Beaubien")
		EXECUTE METHOD:C1007("Manifest_SetBuildDate"; *; Current date:C33)
		EXECUTE METHOD:C1007("Manifest_SetURL"; *; "http://infohandler.com")
		EXECUTE METHOD:C1007("Manifest_SetCopyright"; *; "n/a; modifed open source")
		EXECUTE METHOD:C1007("Manifest_SetVersion"; *\
			; "build "+String:C10(Year of:C25(Current date:C33); "0000")+String:C10(Month of:C24(Current date:C33); "00")+String:C10(Day of:C23(Current date:C33); "00")\
			; True:C214)
	End if 
End if 