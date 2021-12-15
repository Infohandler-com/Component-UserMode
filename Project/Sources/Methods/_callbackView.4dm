//%attributes = {}
C_POINTER:C301($1; $vp_tablePtr)
C_OBJECT:C1216($2; $vo_views)
C_BOOLEAN:C305($0; $vb_wasHandled)

$vp_tablePtr:=$1
$vo_views:=$2


If ($vp_tablePtr=(->[bTable_1:1]))
	ARRAY OBJECT:C1221($ao_oneView; 2)
	
	OB SET:C1220($ao_oneView{1}; "viewName"; "Default")
	ARRAY POINTER:C280($ap_viewFields; 0)
	APPEND TO ARRAY:C911($ap_viewFields; ->[bTable_1:1]Field_3_h:3)
	APPEND TO ARRAY:C911($ap_viewFields; ->[bTable_1:1]Field_4_a:4)
	OB SET ARRAY:C1227($ao_oneView{1}; "viewFieldPtrs"; $ap_viewFields)
	
	OB SET:C1220($ao_oneView{1}; "viewName"; "myView")
	ARRAY POINTER:C280($ap_viewFields; 0)
	APPEND TO ARRAY:C911($ap_viewFields; ->[bTable_1:1]Field_3_h:3)
	APPEND TO ARRAY:C911($ap_viewFields; ->[bTable_1:1]Field_4_a:4)
	OB SET ARRAY:C1227($ao_oneView{1}; "viewFieldPtrs"; $ap_viewFields)
	
	OB SET:C1220($ao_oneView{2}; "viewName"; "2nd View")
	ARRAY POINTER:C280($ap_viewFields; 0)
	APPEND TO ARRAY:C911($ap_viewFields; ->[bTable_1:1]guid:1)
	APPEND TO ARRAY:C911($ap_viewFields; ->[bTable_1:1]Field_2_d:2)
	APPEND TO ARRAY:C911($ap_viewFields; ->[bTable_1:1]Field_3_h:3)
	APPEND TO ARRAY:C911($ap_viewFields; ->[bTable_1:1]Field_4_a:4)
	OB SET ARRAY:C1227($ao_oneView{2}; "viewFieldPtrs"; $ap_viewFields)
	
	OB SET ARRAY:C1227($vo_views; "views"; $ao_oneView)
	
	$vb_wasHandled:=True:C214
Else 
	$vb_wasHandled:=False:C215
End if 

$0:=$vb_wasHandled