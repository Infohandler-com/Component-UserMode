//%attributes = {"invisible":true}
// UserMode_Show_SetView (viewNo; viewsObject)
// UserMode_Show_SetView (longint; object)
// 
// DESCRIPTION
//   Set the listbox up for the view that is being requested.
//
C_LONGINT:C283($1; $vl_viewNo)
C_OBJECT:C1216($2; $vo_views)
// ----------------------------------------------------
// HISTORY
//   Created by: DB (09/11/2016)
// ----------------------------------------------------

$vl_viewNo:=$1

LISTBOX DELETE COLUMN:C830(*; "Listbox"; 1; LISTBOX Get number of columns:C831(*; "Listbox"))
LISTBOX SET TABLE SOURCE:C1013(*; "Listbox"; iUserMode_CurrentTable)

ARRAY OBJECT:C1221($ao_oneView; 0)
OB GET ARRAY:C1229(vo_viewDefnObject; "views"; $ao_oneView)

ARRAY POINTER:C280($ap_viewFields; 0)
OB GET ARRAY:C1229($ao_oneView{$vl_viewNo}; "viewFieldPtrs"; $ap_viewFields)

C_LONGINT:C283($counter; $i; $fieldType)
C_POINTER:C301($Fieldptr; $Headerptr)
$counter:=1
For ($i; 1; Size of array:C274($ap_viewFields))
	If ($i<=100)
		$Fieldptr:=$ap_viewFields{$i}
		$fieldType:=Type:C295($Fieldptr->)
		If (($fieldType#Is picture:K8:10) & ($fieldType#Is BLOB:K8:12) & ($fieldType#Is object:K8:27))
			$Headerptr:=Get pointer:C304("Header"+String:C10($counter))
			$Headerptr->:=0
			LISTBOX INSERT COLUMN:C829(*; "ListBox"; $counter; "Field"+String:C10($counter); $Fieldptr->; "Header"+String:C10($counter); $Headerptr->)
			OBJECT SET TITLE:C194($Headerptr->; Field name:C257($Fieldptr))
			
			If (Field_IsIndexed($Fieldptr))
				OBJECT SET FONT STYLE:C166($Headerptr->; Bold:K14:2)
			Else 
				OBJECT SET FONT STYLE:C166($Headerptr->; Plain:K14:1)
			End if 
			
			Case of 
				: ($fieldType=Is time:K8:8) | ($fieldType=Is date:K8:7)
					OBJECT SET HORIZONTAL ALIGNMENT:C706($Headerptr->; Align center:K42:3)
					OBJECT SET HORIZONTAL ALIGNMENT:C706($Fieldptr->; Align center:K42:3)
					
				: ($fieldType=Is longint:K8:6) | ($fieldType=Is integer:K8:5) | ($fieldType=Is real:K8:4)
					OBJECT SET HORIZONTAL ALIGNMENT:C706($Headerptr->; Align right:K42:4)
					OBJECT SET HORIZONTAL ALIGNMENT:C706($Fieldptr->; Align right:K42:4)
					
				Else 
					OBJECT SET HORIZONTAL ALIGNMENT:C706($Headerptr->; Align left:K42:2)
					OBJECT SET HORIZONTAL ALIGNMENT:C706($Fieldptr->; Align left:K42:2)
			End case 
			
			$counter:=$counter+1
		End if 
	End if 
End for 

SET WINDOW TITLE:C213("["+Table name:C256(iUserMode_CurrentTable)+"] viewing "+OB Get:C1224($ao_oneView{$vl_viewNo}; "viewName"))