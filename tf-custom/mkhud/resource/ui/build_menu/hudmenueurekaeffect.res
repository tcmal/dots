"Resource/UI/build_menu/HudMenuEurekaEffect.res"
{
	"MainBackground"	
	{
		"ControlName"	"CIconPanel"
		"fieldName"		"MainBackground"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"0"
		"wide"			"447"
		"tall"			"170"
		"visible"		"0"
		"enabled"		"0"
		"scaleImage"	"1"	
		"icon"			"hud_menu_bg"
		"iconColor"		"0 0 0 0"
	}
	
	"MenuBG"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"MenuBG"
		"xpos"			"20"
		"ypos"			"0"
		"zpos"			"-10"
		"wide"			"150"
		"tall"			"100"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"0"
		"enabled"		"0"
		"tabPosition"	"0"	
		"fillcolor"		"mkGUI"
		"PaintBackgroundType"	"2"
	}
	"blueheader"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"blueheader"
		"xpos"			"20"
		"ypos"			"40"
		"zpos"			"5"
		"wide"			"150"
		"tall"			"15"
		"fillcolor"		"mktopbar"
	}
	"top"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"top"
		"xpos"			"20"
		"ypos"			"40"
		"zpos"			"2"
		"wide"			"150"
		"tall"			"100"
		"fillcolor"		"mkgui"
	}
	"leftline"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"leftline"
		"xpos"			"0"
		"ypos"			"0"
		"zpos"			"1234"
		"wide"			"0"
		"tall"			"88"
		"fillcolor"		"mkguibg"
	}
	"rightline"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"rightline"
		"xpos"			"150"
		"ypos"			"0"
		"zpos"			"1234"
		"wide"			"0"
		"tall"			"88"
		"fillcolor"		"mkguibg"
	}
	"BuildIcon"	
	{
		"ControlName"	"CIconPanel"
		"fieldName"		"BuildIcon"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"1"
		"wide"			"48"
		"tall"			"48"
		"visible"		"0"
		"enabled"		"0"
		"scaleImage"	"1"	
		"icon"			"ico_build"
		"iconColor"		"0 0 0 0"
	}
	
	"BuildIconShadow"	
	{
		"ControlName"	"CIconPanel"
		"fieldName"		"BuildIconShadow"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"0"
		"wide"			"48"
		"tall"			"48"
		"visible"		"0"
		"enabled"		"0"
		"scaleImage"	"1"	
		"icon"			"ico_build"
		"iconColor"		"0 0 0 255"
	}
	
	"TitleLabel"
	{	
		"ControlName"	"CExLabel"
		"fieldName"		"TitleLabel"
		"font"			"product14"
		"xpos"			"-30"			// align me to the left edge of the first selection
		"ypos"			"36"
		"zpos"			"12342"
		"wide"			"150"
		"tall"			"22"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"teleport"
		"textAlignment"	"center"
		"dulltext"		"0"
		"brighttext"	"0"
		"fgcolor"		"mklightblue"
	}
	"BlackBGShadow"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"BlackBGShadow"
		"xpos"			"17"
		"ypos"			"37"
		"zpos"			"3"
		"wide"			"155"
		"tall"			"20"
		"scaleImage"	"1"
//		"fillcolor"		"mkGUI"
		"image"			"replay\thumbnails\menu\Shadow3"
	}
	"BlackBGShadow2"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"BlackBGShadow2"
		"xpos"			"14"
		"ypos"			"37"
		"zpos"			"-9"
		"wide"			"162"
		"tall"			"107"
		"scaleImage"	"1"
//		"fillcolor"		"mkGUI"
		"image"			"replay\thumbnails\menu\Shadow4"
	}
	
	"CancelLabel"
	{	
		"ControlName"	"CExLabel"
		"fieldName"		"CancelLabel"
		"font"			"SpectatorKeyHints"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"1"
		"wide"			"200"
		"tall"			"13"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"0"
		"enabled"		"0"
		"labelText"		"#Hud_Menu_Build_Cancel"
		"textAlignment"	"East"
		"dulltext"		"0"
		"brighttext"	"0"
	}
	
	"available_target_1"
	{
		"ControlName"	"EditablePanel"
		"fieldName"		"available_target_1"
		"xpos"			"20"
		"ypos"			"57"
		"zpos"			"10"
		"wide"			"100"
		"tall"			"124"
		"visible"		"1"
	}	
	
	"available_target_2"
	{
		"ControlName"	"EditablePanel"
		"fieldName"		"available_target_2"
		"xpos"			"80"
		"ypos"			"57"
		"zpos"			"1"
		"wide"			"100"
		"tall"			"124"
		"visible"		"1"
	}	

	"unavailable_target_1"
	{
		"ControlName"	"EditablePanel"
		"fieldName"		"unavailable_target_1"
		"xpos"			"20"
		"ypos"			"57"
		"zpos"			"1"
		"wide"			"100"
		"tall"			"124"
		"visible"		"0"
	}	
	
	"unavailable_target_2"
	{
		"ControlName"	"EditablePanel"
		"fieldName"		"unavailable_target_2"
		"xpos"			"80"
		"ypos"			"57"
		"zpos"			"1"
		"wide"			"100"
		"tall"			"124"
		"visible"		"0"
	}	
}