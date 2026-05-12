//%attributes = {"invisible":true}
// ----------------------------------------------------
// Anwender (OS): Thomas Maul
// Datum und Zeit: 26.02.09
// ----------------------------------------------------
// Methode: UserMode_Listbox_init
// Internal - switches table. Called in on Load and from popup
// 
//
// Parameter  -  none
// ----------------------------------------------------
var $tableptr : Pointer
var $fieldPtr : Pointer
var $Headerptr : Pointer
var $countfields : Integer
var $counter : Integer
var $fieldNo : Integer
var $fieldType : Integer
var $name : Text

If (Is table number valid:C999(iUserMode_CurrentTable))
	$tableptr:=Table:C252(iUserMode_CurrentTable)
	CREATE EMPTY SET:C140($tableptr->; "UserSet")
	
	var UserModeFormula : Text
	UserModeFormula:=""
	
	
	// ### Handle creating the table's views (default or defined)
	If (True:C214)
		var at_UserMode_ViewCallBack : Text
		var $vb_wasHandled : Boolean
		var vo_viewDefnObject : Object
		vo_viewDefnObject:=JSON Parse:C1218("{}")
		OB SET:C1220(vo_viewDefnObject; "tableNo"; iUserMode_CurrentTable)
		If (at_UserMode_ViewCallBack#"")
			EXECUTE METHOD:C1007(at_UserMode_ViewCallBack; $vb_wasHandled; $tableptr; vo_viewDefnObject)
		End if 
		
		var $defaultViewObj : Object
		ARRAY OBJECT:C1221($ao_oneView; 0)
		If ($vb_wasHandled)
			OB GET ARRAY:C1229(vo_viewDefnObject; "views"; $ao_oneView)
		End if 
		
		If (True:C214)
			$defaultViewObj:=New object:C1471
			OB SET:C1220($defaultViewObj; "viewName"; "Default")
			APPEND TO ARRAY:C911($ao_oneView; $defaultViewObj)
			OB SET ARRAY:C1227(vo_viewDefnObject; "views"; $ao_oneView)
			
			// Create a default view of the first 100 fields
			ARRAY POINTER:C280($ap_viewFields; 0)
			ARRAY TEXT:C222($fieldNamesArr; 0)
			$countfields:=Last field number:C255(iUserMode_CurrentTable)
			$counter:=1
			$fieldNo:=1
			While (($fieldNo<=$countfields) & ($counter<=100))
				If (Is field number valid:C1000(iUserMode_CurrentTable; $fieldNo))
					$fieldPtr:=Field:C253(iUserMode_CurrentTable; $fieldNo)
					var $fieldLength : Integer
					var $isIndexed; $isUnique : Boolean
					GET FIELD PROPERTIES:C258($fieldPtr; $fieldType; $fieldLength; $isIndexed; $isUnique)
					
					If (($fieldType#Is picture:K8:10) & ($fieldType#Is BLOB:K8:12) & ($fieldType#Is object:K8:27))
						APPEND TO ARRAY:C911($ap_viewFields; $fieldPtr)
						APPEND TO ARRAY:C911($fieldNamesArr; Field name:C257($fieldPtr))
						If ($isIndexed)
							$fieldNamesArr{Size of array:C274($fieldNamesArr)}:="  "+$fieldNamesArr{Size of array:C274($fieldNamesArr)}  // Helps sort to the top
						End if 
						If ($fieldNamesArr{Size of array:C274($fieldNamesArr)}="@_ID") | ($fieldNamesArr{Size of array:C274($fieldNamesArr)}="@GUID") | ($fieldNamesArr{Size of array:C274($fieldNamesArr)}="@key")
							$fieldNamesArr{Size of array:C274($fieldNamesArr)}:=" "+$fieldNamesArr{Size of array:C274($fieldNamesArr)}  // Helps sort to the top
						End if 
						$counter:=$counter+1
					End if 
				End if 
				$fieldNo:=$fieldNo+1
			End while 
			SORT ARRAY:C229($fieldNamesArr; $ap_viewFields; >)
			OB SET ARRAY:C1227($defaultViewObj; "viewFieldPtrs"; $ap_viewFields)
			
		End if 
	End if 
	
	
	
	// ### Build out the view arrays
	var $i : Integer
	ARRAY OBJECT:C1221($ao_oneView; 0)
	OB GET ARRAY:C1229(vo_viewDefnObject; "views"; $ao_oneView)
	ARRAY TEXT:C222(ar_UserMode_TableViews; Size of array:C274($ao_oneView))
	For ($i; 1; Size of array:C274($ao_oneView))
		ar_UserMode_TableViews{$i}:=OB Get:C1224($ao_oneView{$i}; "viewName"; Is text:K8:3)
	End for 
	ar_UserMode_TableViews:=1
	
	
	
	// ### Handle read only/write
	If (ar_UserMode_Modify{iUserMode_CurrentTable})
		READ WRITE:C146($tableptr->)
	Else 
		READ ONLY:C145($tableptr->)
	End if 
	ALL RECORDS:C47($tableptr->)
	
	UserMode_Show_SetView(1; vo_viewDefnObject)
	
	
	// ### Button handling
	If (True:C214)
		OBJECT SET ENABLED:C1123(*; "UserMode_DeleteButton"; ar_UserMode_Delete{iUserMode_CurrentTable})
		OBJECT SET ENABLED:C1123(*; "UserMode_ReportButton"; ((ar_UserMode_Report{iUserMode_CurrentTable}) | (ar_UserMode_Import{iUserMode_CurrentTable}) | (ar_UserMode_Export{iUserMode_CurrentTable})))
		
		If (Not:C34(ar_UserMode_New{iUserMode_CurrentTable}))
			OBJECT SET ENABLED:C1123(*; "UserMode_NewButton"; False:C215)
		Else 
			$name:=ar_UserMode_Forms{iUserMode_CurrentTable}
			If ($name="")
				$name:="UserMode"
				ar_UserMode_Forms{iUserMode_CurrentTable}:=$name
			End if 
			If (UserMode_IsFormExisting($name))
				OBJECT SET ENABLED:C1123(*; "UserMode_NewButton"; True:C214)
			Else 
				ar_UserMode_Modify{iUserMode_CurrentTable}:=False:C215
				OBJECT SET ENABLED:C1123(*; "UserMode_NewButton"; False:C215)
			End if 
		End if 
		
		var $tableObjName : Text
		$tableObjName:="t"+String:C10(iUserMode_CurrentTable)
		
		// Determine if the drop down is visible or not on the query button
		var $formatStr : Text
		ARRAY TEXT:C222($formatStrAsArray; 0)
		$formatStr:=OBJECT Get format:C894(*; "UserMode_QueryButton")
		Array_ConvertFromTextDelimited(->$formatStrAsArray; $formatStr; ";")
		If (OB Is defined:C1231(UserMode_queryObj; $tableObjName))
			$formatStrAsArray{11}:="2"
		Else 
			$formatStrAsArray{11}:="0"
		End if 
		$formatStr:=Array_ConvertToTextDelimited(->$formatStrAsArray; ";")
		OBJECT SET FORMAT:C236(*; "UserMode_QueryButton"; $formatStr)
		
		// Determine if the drop down is visible or not on the action button
		ARRAY TEXT:C222($formatStrAsArray; 0)
		//$formatStr:=OBJECT Get format(*;"UserMode_ActionButton")
		//Array_ConvertFromTextDelimited (->$formatStrAsArray;$formatStr;";")
		//If (OB Is defined(UserMode_actionObj;$tableObjName))
		//$formatStrAsArray{11}:="2"
		//Else 
		//$formatStrAsArray{11}:="0"
		//End if 
		//$formatStr:=Array_ConvertToTextDelimited (->$formatStrAsArray;";")
		//OBJECT SET FORMAT(*;"UserMode_ActionButton";$formatStr)
		If (OB Is defined:C1231(UserMode_actionObj; $tableObjName)) | (ar_UserMode_Execute{iUserMode_CurrentTable})
			OBJECT SET ENABLED:C1123(*; "UserMode_ActionButton"; True:C214)
		Else 
			OBJECT SET ENABLED:C1123(*; "UserMode_ActionButton"; False:C215)
		End if 
		
	End if 
End if 