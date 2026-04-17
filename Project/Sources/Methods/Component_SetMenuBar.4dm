//%attributes = {"invisible":true}
// Component_SetMenuBar
// 
// DESCRIPTION
//   Creates and sets the menu bar.
//
// ----------------------------------------------------
// CALLED BY
//   "UserMode_Listbox" project form
// ----------------------------------------------------
// HISTORY
//   Created by: DB (2013-10-06) - Added menu
// ----------------------------------------------------

var $_Menu_MenuBar_s; $_Menu_FileMenu_s; $_Menu_EditMenu_s; $_Menu_UtilMenu_s : Text
ARRAY LONGINT:C221($pluginNumbers_al; 0)
ARRAY TEXT:C222($pluginNames_at; 0)

If (True:C214)  // Misc commented out menu commands
	//APPEND MENU ITEM($_Menu_FileMenu_s;"About Code Analysis Component...")
	//SET MENU ITEM METHOD($_Menu_FileMenu_s;-1;"Component_About")
	//APPEND MENU ITEM($_Menu_FileMenu_s;"(-")  // Separator line
	//SET MENU ITEM PROPERTY($_Menu_FileMenu_s;-1;Start a New Process;1)  // Turn this on
End if 

// # File Menu
If (True:C214)
	$_Menu_FileMenu_s:=Create menu:C408
	
	APPEND MENU ITEM:C411($_Menu_FileMenu_s; "(About User Mode Component...")  // Adding a disabled menu item
	APPEND MENU ITEM:C411($_Menu_FileMenu_s; "(-")  // Separator line
	
	APPEND MENU ITEM:C411($_Menu_FileMenu_s; "New Window...")
	SET MENU ITEM SHORTCUT:C423($_Menu_FileMenu_s; -1; "N"; Command key mask:K16:1+Shift key mask:K16:3)
	SET MENU ITEM METHOD:C982($_Menu_FileMenu_s; -1; "Menu_NewWindow")
	
	APPEND MENU ITEM:C411($_Menu_FileMenu_s; "(-")  // Separator line
	APPEND MENU ITEM:C411($_Menu_FileMenu_s; "Quit")
	SET MENU ITEM PROPERTY:C973($_Menu_FileMenu_s; -1; Associated standard action name:K28:8; _o_Quit action:K59:25)
	SET MENU ITEM SHORTCUT:C423($_Menu_FileMenu_s; -1; "Q"; Command key mask:K16:1)
End if 


// # Edit Menu
If (True:C214)
	$_Menu_EditMenu_s:=Create menu:C408
	
	APPEND MENU ITEM:C411($_Menu_EditMenu_s; "Undo")
	SET MENU ITEM PROPERTY:C973($_Menu_EditMenu_s; -1; Associated standard action name:K28:8; ak undo:K76:51)
	SET MENU ITEM SHORTCUT:C423($_Menu_EditMenu_s; -1; "Z"; Command key mask:K16:1)
	
	APPEND MENU ITEM:C411($_Menu_EditMenu_s; "(-")  // Separator line
	
	APPEND MENU ITEM:C411($_Menu_EditMenu_s; "Cut")
	SET MENU ITEM PROPERTY:C973($_Menu_EditMenu_s; -1; Associated standard action name:K28:8; ak cut:K76:53)
	SET MENU ITEM SHORTCUT:C423($_Menu_EditMenu_s; -1; "X"; Command key mask:K16:1)
	
	APPEND MENU ITEM:C411($_Menu_EditMenu_s; "Copy")
	SET MENU ITEM PROPERTY:C973($_Menu_EditMenu_s; -1; Associated standard action name:K28:8; ak copy:K76:54)
	SET MENU ITEM SHORTCUT:C423($_Menu_EditMenu_s; -1; "C"; Command key mask:K16:1)
	
	APPEND MENU ITEM:C411($_Menu_EditMenu_s; "Paste")
	SET MENU ITEM PROPERTY:C973($_Menu_EditMenu_s; -1; Associated standard action name:K28:8; ak paste:K76:55)
	SET MENU ITEM SHORTCUT:C423($_Menu_EditMenu_s; -1; "V"; Command key mask:K16:1)
	
	APPEND MENU ITEM:C411($_Menu_EditMenu_s; "Clear")
	SET MENU ITEM PROPERTY:C973($_Menu_EditMenu_s; -1; Associated standard action name:K28:8; ak clear:K76:56)
	
	APPEND MENU ITEM:C411($_Menu_EditMenu_s; "Select All")
	SET MENU ITEM PROPERTY:C973($_Menu_EditMenu_s; -1; Associated standard action name:K28:8; ak select all:K76:57)
	SET MENU ITEM SHORTCUT:C423($_Menu_EditMenu_s; -1; "A"; Command key mask:K16:1)
	
	APPEND MENU ITEM:C411($_Menu_EditMenu_s; "(-")  // Separator line
	
	APPEND MENU ITEM:C411($_Menu_EditMenu_s; "Show Clipboard")
	SET MENU ITEM PROPERTY:C973($_Menu_EditMenu_s; -1; Associated standard action name:K28:8; _o_Show clipboard action:K59:23)
	//SET MENU ITEM METHOD($_Menu_EditMenu_s;-1;"_Menu_Preferences")
End if 


// # Utility Menu
If (True:C214)
	$_Menu_UtilMenu_s:=Create menu:C408
	
	var $i : Integer
	For ($i; 1; Size of array:C274(ar_UTIL_title))
		APPEND MENU ITEM:C411($_Menu_UtilMenu_s; ar_UTIL_title{$i})
		SET MENU ITEM METHOD:C982($_Menu_UtilMenu_s; -1; ar_UTIL_method{$i})
		If ($i<10)
			SET MENU ITEM SHORTCUT:C423($_Menu_UtilMenu_s; -1; String:C10($i); Command key mask:K16:1)
		End if 
	End for 
End if 

// # Create the full menu bar
$_Menu_MenuBar_s:=Create menu:C408
APPEND MENU ITEM:C411($_Menu_MenuBar_s; "File"; $_Menu_FileMenu_s)
APPEND MENU ITEM:C411($_Menu_MenuBar_s; "Edit"; $_Menu_EditMenu_s)
APPEND MENU ITEM:C411($_Menu_MenuBar_s; "Utilities"; $_Menu_UtilMenu_s)

SET MENU BAR:C67($_Menu_MenuBar_s)

// # Clean up memory
RELEASE MENU:C978($_Menu_MenuBar_s)
RELEASE MENU:C978($_Menu_FileMenu_s)
RELEASE MENU:C978($_Menu_EditMenu_s)
RELEASE MENU:C978($_Menu_UtilMenu_s)

