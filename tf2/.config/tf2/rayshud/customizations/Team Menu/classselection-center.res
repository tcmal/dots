"Resource/UI/ClassSelection.res"
{
	"class"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"class"
		"xpos"			"0"
		"ypos"			"0"
		"wide"			"f0"
		"tall"			"480"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"fillcolor"		"0 0 0 128"
	}
	
	"SysMenu"
	{
		"ControlName"	"Menu"
		"fieldName"		"SysMenu"
		"xpos"			"0"
		"ypos"			"0"
		"wide"			"64"
		"tall"			"24"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"0"
		"enabled"		"0"
		"tabPosition"	"0"
	}
	
	"SelectClassLabel"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"SelectClassLabel"
		"xpos"			"30"
		"ypos"			"r40"
		"zpos"			"5"
		"wide"			"450"
		"tall"			"30"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"#TF_SelectAClass"
		"textAlignment"	"west"
		"font"			"CerbeticaBold32"
		"fgcolor"		"HudOffWhite"
	}
	
	"scout"
	{
		"ControlName"		"CExImageButton"
		"fieldName"			"scout"
		"xpos"				"c81"
		"ypos"				"193"
		"zpos"				"6"
		"wide"				"150"
		"tall"				"16"
		"autoResize"		"0"
		"pinCorner"			"2"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"labelText"			"&1  Scout"
		"textAlignment"		"west"
		"Command"			"joinclass scout"
		"Default"			"1"
		"font"				"CerbeticaBold16"
		"scaleImage"		"1"
		"paintbackground"	"0"
		
		"fgcolor"					"TanDark"
		"defaultFgColor_override"	"TanDark"
		"armedFgColor_override"		"TanDark"
		"depressedFgColor_override" "TanDark"
		"selectedFgColor_override" 	"TanLight"
		
		"sound_depressed"	"UI/buttonclick.wav"
		"sound_released"	"UI/buttonclickrelease.wav"
		"sound_armed"		"UI/buttonrollover.wav"
		
		"stayselectedonclick"	"1"
		"selectonhover"			"1"
		"keyboardinputenabled"	"0"
	}
	
	"soldier"
	{
		"ControlName"		"CExImageButton"
		"fieldName"			"soldier"
		"xpos"				"c80"
		"ypos"				"207"
		"zpos"				"6"
		"wide"				"150"
		"tall"				"16"
		"autoResize"		"0"
		"pinCorner"			"2"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"labelText"			"&2  Soldier"
		"textAlignment"		"west"
		"Command"			"joinclass soldier"
		"Default"			"0"
		"font"				"CerbeticaBold16"
		"scaleImage"		"1"
		"paintbackground"	"0"
		
		"fgcolor"					"TanDark"
		"defaultFgColor_override"	"TanDark"
		"armedFgColor_override"		"TanDark"
		"depressedFgColor_override" "TanDark"
		"selectedFgColor_override" 	"TanLight"
		
		"sound_depressed"	"UI/buttonclick.wav"
		"sound_released"	"UI/buttonclickrelease.wav"
		"sound_armed"		"UI/buttonrollover.wav"
		
		"stayselectedonclick"	"1"
		"selectonhover"			"1"
		"keyboardinputenabled"	"0"
	}
	
	"pyro"
	{
		"ControlName"		"CExImageButton"
		"fieldName"			"pyro"
		"xpos"				"c80"
		"ypos"				"221"
		"zpos"				"6"
		"wide"				"150"
		"tall"				"16"
		"autoResize"		"0"
		"pinCorner"			"2"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"labelText"			"&3  Pyro"
		"textAlignment"		"west"
		"Command"			"joinclass pyro"
		"Default"			"0"
		"font"				"CerbeticaBold16"
		"scaleImage"		"1"
		"paintbackground"	"0"
		
		"fgcolor"					"TanDark"
		"defaultFgColor_override"	"TanDark"
		"armedFgColor_override"		"TanDark"
		"depressedFgColor_override" "TanDark"
		"selectedFgColor_override" 	"TanLight"
		
		"sound_depressed"	"UI/buttonclick.wav"
		"sound_released"	"UI/buttonclickrelease.wav"
		"sound_armed"		"UI/buttonrollover.wav"
		
		"stayselectedonclick"	"1"
		"selectonhover"			"1"
		"keyboardinputenabled"	"0"
	}
	
	"demoman"
	{
		"ControlName"		"CExImageButton"
		"fieldName"			"demoman"
		"xpos"				"c80"
		"ypos"				"241"
		"zpos"				"6"
		"wide"				"150"
		"tall"				"16"
		"autoResize"		"0"
		"pinCorner"			"2"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"labelText"			"&4  Demoman"
		"textAlignment"		"west"
		"Command"			"joinclass demoman"
		"Default"			"0"
		"font"				"CerbeticaBold16"
		"scaleImage"		"1"
		"paintbackground"	"0"
		
		"fgcolor"					"TanDark"
		"defaultFgColor_override"	"TanDark"
		"armedFgColor_override"		"TanDark"
		"depressedFgColor_override" "TanDark"
		"selectedFgColor_override" 	"TanLight"
		
		"sound_depressed"	"UI/buttonclick.wav"
		"sound_released"	"UI/buttonclickrelease.wav"
		"sound_armed"		"UI/buttonrollover.wav"
		
		"stayselectedonclick"	"1"
		"selectonhover"			"1"
		"keyboardinputenabled"	"0"
	}

	"heavyweapons"
	{
		"ControlName"		"CExLabel"
		"fieldName"			"heavyweapons"
		"xpos"				"c80"
		"ypos"				"255"
		"zpos"				"6"
		"wide"				"150"
		"tall"				"16"
		"autoResize"		"0"
		"pinCorner"			"2"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"labelText"			"&5  Heavy"
		"textAlignment"		"west"
		"Command"			"joinclass heavyweapons"
		"Default"			"0"
		"font"				"CerbeticaBold16"
		"scaleImage"		"1"
		"paintbackground"	"0"
		
		"fgcolor"					"TanDark"
		"defaultFgColor_override"	"TanDark"
		"armedFgColor_override"		"TanDark"
		"depressedFgColor_override" "TanDark"
		"selectedFgColor_override" 	"TanLight"
		
		"sound_depressed"	"UI/buttonclick.wav"
		"sound_released"	"UI/buttonclickrelease.wav"
		"sound_armed"		"UI/buttonrollover.wav"
		
		"stayselectedonclick"	"1"
		"selectonhover"			"1"
		"keyboardinputenabled"	"0"
	}
	
	"engineer"
	{
		"ControlName"		"CExLabel"
		"fieldName"			"engineer"
		"xpos"				"c80"
		"ypos"				"269"
		"zpos"				"6"
		"wide"				"150"
		"tall"				"16"
		"autoResize"		"0"
		"pinCorner"			"2"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"labelText"			"&6  Engineer"
		"textAlignment"		"west"
		"Command"			"joinclass engineer"
		"Default"			"0"
		"font"				"CerbeticaBold16"
		"scaleImage"		"1"
		"paintbackground"	"0"
		
		"fgcolor"					"TanDark"
		"defaultFgColor_override"	"TanDark"
		"armedFgColor_override"		"TanDark"
		"depressedFgColor_override" "TanDark"
		"selectedFgColor_override" 	"TanLight"
		
		"sound_depressed"	"UI/buttonclick.wav"
		"sound_released"	"UI/buttonclickrelease.wav"
		"sound_armed"		"UI/buttonrollover.wav"
		
		"stayselectedonclick"	"1"
		"selectonhover"			"1"
		"keyboardinputenabled"	"0"
	}
	
	"medic"
	{
		"ControlName"		"CExImageButton"
		"fieldName"			"medic"
		"xpos"				"c80"
		"ypos"				"289"
		"zpos"				"6"
		"wide"				"150"
		"tall"				"16"
		"autoResize"		"0"
		"pinCorner"			"2"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"labelText"			"&7  Medic"
		"textAlignment"		"west"
		"Command"			"joinclass medic"
		"Default"			"0"
		"font"				"CerbeticaBold16"
		"scaleImage"		"1"
		"paintbackground"	"0"
		
		"fgcolor"					"TanDark"
		"defaultFgColor_override"	"TanDark"
		"armedFgColor_override"		"TanDark"
		"depressedFgColor_override" "TanDark"
		"selectedFgColor_override" 	"TanLight"
		
		"sound_depressed"	"UI/buttonclick.wav"
		"sound_released"	"UI/buttonclickrelease.wav"
		"sound_armed"		"UI/buttonrollover.wav"
		
		"stayselectedonclick"	"1"
		"selectonhover"			"1"
		"keyboardinputenabled"	"0"
	}

	"sniper"
	{
		"ControlName"		"CExImageButton"
		"fieldName"			"sniper"
		"xpos"				"c80"
		"ypos"				"303"
		"zpos"				"6"
		"wide"				"150"
		"tall"				"16"
		"autoResize"		"0"
		"pinCorner"			"2"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"labelText"			"&8  Sniper"
		"textAlignment"		"west"
		"Command"			"joinclass sniper"
		"Default"			"0"
		"font"				"CerbeticaBold16"
		"scaleImage"		"1"
		"paintbackground"	"0"
		
		"fgcolor"					"TanDark"
		"defaultFgColor_override"	"TanDark"
		"armedFgColor_override"		"TanDark"
		"depressedFgColor_override" "TanDark"
		"selectedFgColor_override" 	"TanLight"
		
		"sound_depressed"	"UI/buttonclick.wav"
		"sound_released"	"UI/buttonclickrelease.wav"
		"sound_armed"		"UI/buttonrollover.wav"
		
		"stayselectedonclick"	"1"
		"selectonhover"			"1"
		"keyboardinputenabled"	"0"
	}
	
	"spy"
	{
		"ControlName"		"CExImageButton"
		"fieldName"			"spy"
		"xpos"				"c80"
		"ypos"				"317"
		"zpos"				"6"
		"wide"				"150"
		"tall"				"16"
		"autoResize"		"0"
		"pinCorner"			"2"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"labelText"			"&9  Spy"
		"textAlignment"		"west"
		"Command"			"joinclass spy"
		"Default"			"0"
		"font"				"CerbeticaBold16"
		"scaleImage"		"1"
		"paintbackground"	"0"
		
		"fgcolor"					"TanDark"
		"defaultFgColor_override"	"TanDark"
		"armedFgColor_override"		"TanDark"
		"depressedFgColor_override" "TanDark"
		"selectedFgColor_override" 	"TanLight"
		
		"sound_depressed"	"UI/buttonclick.wav"
		"sound_released"	"UI/buttonclickrelease.wav"
		"sound_armed"		"UI/buttonrollover.wav"
		
		"stayselectedonclick"	"1"
		"selectonhover"			"1"
		"keyboardinputenabled"	"0"
	}

	"random"
	{
		"ControlName"		"CExLabel"
		"fieldName"			"random"
		"xpos"				"c80"
		"ypos"				"c101"
		"zpos"				"6"
		"wide"				"150"
		"tall"				"16"
		"autoResize"		"0"
		"pinCorner"			"2"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"labelText"			"&R  Random"
		"textAlignment"		"west"
		"Command"			"joinclass random"
		"Default"			"0"
		"font"				"CerbeticaBold16"
		"scaleImage"		"1"
		"paintbackground"	"0"
		
		"fgcolor"					"TanDark"
		"defaultFgColor_override"	"TanDark"
		"armedFgColor_override"		"TanDark"
		"depressedFgColor_override" "TanDark"
		"selectedFgColor_override" 	"TanLight"
		
		"sound_depressed"	"UI/buttonclick.wav"
		"sound_released"	"UI/buttonclickrelease.wav"
		"sound_armed"		"UI/buttonrollover.wav"
		
		"stayselectedonclick"	"1"
		"selectonhover"			"1"
		"keyboardinputenabled"	"0"
	}
	
	"EditLoadoutButton" [$WIN32]
	{
		"ControlName"	"CExButton"
		"fieldName"		"EditLoadoutButton"
		"xpos"			"r180"
		"ypos"			"r38"
		"zpos"			"6"
		"wide"			"100"
		"tall"			"25"
		"autoResize"	"0"
		"pinCorner"		"2"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"paintbackground" "0"
		"labelText"		"#EditLoadout"
		"textAlignment"	"center"
		"Command"		"openloadout"
		"font"			"CerbeticaBold16"
	}
	
	"CancelButton" [$WIN32]
	{
		"ControlName"	"CExButton"
		"fieldName"		"CancelButton"
		"xpos"			"c-295"
		"ypos"			"r38"
		"zpos"			"6"
		"wide"			"100"
		"tall"			"25"
		"autoResize"	"0"
		"pinCorner"		"2"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"#TF_ClassMenu_Cancel"
		"textAlignment"	"center"
		"Command"		"vguicancel"
		"font"			"CerbeticaBold16"
		"paintbackground" "0"
		"fgcolor"		"200 80 60 255"
	}
	"LoadoutButtonBackground"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"LoadoutButtonBackground"
		"xpos"			"c98"
		"ypos"			"c114"
		"wide"			"20"
		"tall"			"0"
	}
	"ResetButton"
	{
		"ControlName"	"CExButton"
		"fieldName"		"ResetButton"
		"xpos"			"r470"
		"ypos"			"r38"
		"zpos"			"6"
		"wide"			"110"
		"tall"			"25"
		"autoResize"	"0"
		"pinCorner"		"2"
		"visible"		"0"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"#TF_ClassMenu_Reset"
		"paintbackground""0"
		"textAlignment"	"center"
		"Command"		"resetclass"
		"font"			"CerbeticaBold16"
	}
	
	"MenuBG"
	{
		"ControlName"	"CModelPanel"
		"fieldName"		"MenuBG"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"0"		
		"wide"			"f0"
		"tall"			"480"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"fov"			"16"
		
		"model"
		{
			"modelname"	"models/vgui/UI_class01.mdl"
			"skin"		"0"
			"angles_x" "0"
			"angles_y" "180"
			"angles_z" "0"
			"origin_x" "365"
			"origin_y" "0"
			"origin_z" "-40"
		}
	}
	
	"Hint"
	{	
		"ControlName"	"CExLabel"
		"fieldName"		"Hint"
		"xpos"			"c-300"
		"ypos"			"95"
		"zpos"			"2"
		"wide"			"600"
		"tall"			"50"
		"autoResize"	"1"
		"pinCorner"		"2"
		"visible"		"0"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"%hint%"
		"textAlignment"	"left"
		"wrap"			"1"
		"font"			"HudFontMediumSmallSecondary"
		"fgcolor"		"HudTrainingHint"
	}
	
	"ShadedBar"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"ShadedBar"
		"xpos"			"9999"
		"ypos"			"r50"
		"zpos"			"4"
		"wide"			"f0"
		"tall"			"50"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"	
		"image"			"loadout_bottom_gradient"
		"tileImage"		"1"
		"PaintBackgroundType"	"0"
	}
	
	"countImage0" [$WIN32]
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"countImage0"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"9"
		"wide"			"30"
		"tall"			"60"
		"visible"		"0"
		"enabled"		"1"
		"image"			""
		"scaleImage"	"1"
	}
	
	"countImage1" [$WIN32]
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"countImage1"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"9"
		"wide"			"30"
		"tall"			"60"
		"visible"		"0"
		"enabled"		"1"
		"image"			""
		"scaleImage"	"1"
	}
	
	"countImage2" [$WIN32]
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"countImage2"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"9"
		"wide"			"30"
		"tall"			"60"
		"visible"		"0"
		"enabled"		"1"
		"image"			""
		"scaleImage"	"1"
	}
	
	"countImage3" [$WIN32]
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"countImage3"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"9"
		"wide"			"30"
		"tall"			"60"
		"visible"		"0"
		"enabled"		"1"
		"image"			""
		"scaleImage"	"1"
	}
	
	"countImage4" [$WIN32]
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"countImage4"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"9"
		"wide"			"30"
		"tall"			"60"
		"visible"		"0"
		"enabled"		"1"
		"image"			""
		"scaleImage"	"1"
	}
	
	"countImage5" [$WIN32]
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"countImage5"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"9"
		"wide"			"30"
		"tall"			"60"
		"visible"		"0"
		"enabled"		"1"
		"image"			""
		"scaleImage"	"1"
	}
	
	"countImage6" [$WIN32]
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"countImage6"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"9"
		"wide"			"30"
		"tall"			"60"
		"visible"		"0"
		"enabled"		"1"
		"image"			""
		"scaleImage"	"1"
	}
	
	"countImage7" [$WIN32]
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"countImage7"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"9"
		"wide"			"30"
		"tall"			"60"
		"visible"		"0"
		"enabled"		"1"
		"image"			""
		"scaleImage"	"1"
	}
	
	"countImage8" [$WIN32]
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"countImage8"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"9"
		"wide"			"30"
		"tall"			"60"
		"visible"		"0"
		"enabled"		"1"
		"image"			""
		"scaleImage"	"1"
	}
	
	"countImage9" [$WIN32]
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"countImage9"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"9"
		"wide"			"30"
		"tall"			"60"
		"visible"		"0"
		"enabled"		"1"
		"image"			""
		"scaleImage"	"1"
	}
	
	"countImage10" [$WIN32]
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"countImage10"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"9"
		"wide"			"30"
		"tall"			"60"
		"visible"		"0"
		"enabled"		"1"
		"image"			""
		"scaleImage"	"1"
	}
	
	"numScout"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"numScout"
		"xpos"			"c158"
		"ypos"			"195"
		"zpos"			"5"
		"wide"			"100"
		"tall"			"12"
		"autoResize"	"1"
		"pinCorner"		"2"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"%numScout%"
		"textAlignment"	"west"
		"font"			"CerbeticaBold16"
		"fgcolor"		"TanLight"
	}
	
	"numSoldier"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"numSoldier"
		"xpos"			"c158"
		"ypos"			"209"
		"zpos"			"5"
		"wide"			"100"
		"tall"			"12"
		"autoResize"	"1"
		"pinCorner"		"2"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"%numSoldier%"
		"textAlignment"	"west"
		"font"			"CerbeticaBold16"
		"fgcolor"		"TanLight"
	}
	
	"numPyro"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"numPyro"
		"xpos"			"c158"
		"ypos"			"223"
		"zpos"			"5"
		"wide"			"100"
		"tall"			"12"
		"autoResize"	"1"
		"pinCorner"		"2"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"%numPyro%"
		"textAlignment"	"west"
		"font"			"CerbeticaBold16"
		"fgcolor"		"TanLight"
	}
	
	"numDemoman"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"numDemoman"
		"xpos"			"c158"
		"ypos"			"243"
		"zpos"			"5"
		"wide"			"100"
		"tall"			"12"
		"autoResize"	"1"
		"pinCorner"		"2"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"%numDemoman%"
		"textAlignment"	"west"
		"font"			"CerbeticaBold16"
		"fgcolor"		"TanLight"
	}
	
	"numHeavy"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"numHeavy"
		"xpos"			"c158"
		"ypos"			"257"
		"zpos"			"5"
		"wide"			"100"
		"tall"			"12"
		"autoResize"	"1"
		"pinCorner"		"2"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"%numHeavy%"
		"textAlignment"	"west"
		"font"			"CerbeticaBold16"
		"fgcolor"		"TanLight"
	}
	
	"numEngineer"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"numEngineer"
		"xpos"			"c158"
		"ypos"			"271"
		"zpos"			"5"
		"wide"			"100"
		"tall"			"12"
		"autoResize"	"1"
		"pinCorner"		"2"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"%numEngineer%"
		"textAlignment"	"west"
		"font"			"CerbeticaBold16"
		"fgcolor"		"TanLight"
	}
	
	"numMedic"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"numMedic"
		"xpos"			"c158"
		"ypos"			"291"
		"zpos"			"5"
		"wide"			"100"
		"tall"			"12"
		"autoResize"	"1"
		"pinCorner"		"2"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"%numMedic%"
		"textAlignment"	"west"
		"font"			"CerbeticaBold16"
		"fgcolor"		"TanLight"
	}
	
	"numSniper"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"numSniper"
		"xpos"			"c158"
		"ypos"			"305"
		"zpos"			"5"
		"wide"			"100"
		"tall"			"12"
		"autoResize"	"1"
		"pinCorner"		"2"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"%numSniper%"
		"textAlignment"	"west"
		"font"			"CerbeticaBold16"
		"fgcolor"		"TanLight"
	}
	
	"numSpy"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"numMedic"
		"xpos"			"c158"
		"ypos"			"319"
		"zpos"			"5"
		"wide"			"100"
		"tall"			"12"
		"autoResize"	"1"
		"pinCorner"		"2"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"%numSpy%"
		"textAlignment"	"west"
		"font"			"CerbeticaBold16"
		"fgcolor"		"TanLight"
	}
	
	"MvMUpgradeImageScout"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"MvMUpgradeImageScout"
		"xpos"			"c-270"
		"ypos"			"30"
		"zpos"			"10"
		"wide"			"10"
		"tall"			"10"
		"visible"		"0"
		"enabled"		"1"
		"image"			"mvm/class_upgraded"
		"scaleImage"	"1"
	}
	
	"MvMUpgradeImageSolider"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"MvMUpgradeImageSolider"
		"xpos"			"c-220"
		"ypos"			"30"
		"zpos"			"10"
		"wide"			"10"
		"tall"			"10"
		"visible"		"0"
		"enabled"		"1"
		"image"			"mvm/class_upgraded"
		"scaleImage"	"1"
	}
	
	"MvMUpgradeImagePyro" 
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"MvMUpgradeImagePyro" 
		"xpos"			"c-170"
		"ypos"			"30"
		"zpos"			"10"
		"wide"			"10"
		"tall"			"10"
		"visible"		"0"
		"enabled"		"1"
		"image"			"mvm/class_upgraded"
		"scaleImage"	"1"
	}
	
	"MvMUpgradeImageDemoman" 
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"MvMUpgradeImageDemoman" 
		"xpos"			"c-80"
		"ypos"			"30"
		"zpos"			"10"
		"wide"			"10"
		"tall"			"10"
		"visible"		"0"
		"enabled"		"1"
		"image"			"mvm/class_upgraded"
		"scaleImage"	"1"
	}
	
	"MvMUpgradeImageHeavy"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"MvMUpgradeImageHeavy" 
		"xpos"			"c-30"
		"ypos"			"30"
		"zpos"			"10"
		"wide"			"10"
		"tall"			"10"
		"visible"		"0"
		"enabled"		"1"
		"image"			"mvm/class_upgraded"
		"scaleImage"	"1"
	}
	
	"MvMUpgradeImageEngineer"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"MvMUpgradeImageEngineer"
		"xpos"			"c20"
		"ypos"			"30"
		"zpos"			"10"
		"wide"			"10"
		"tall"			"10"
		"visible"		"0"
		"enabled"		"1"
		"image"			"mvm/class_upgraded"
		"scaleImage"	"1"
	}
	
	"MvMUpgradeImageMedic"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"MvMUpgradeImageMedic"
		"xpos"			"c108"
		"ypos"			"30"
		"zpos"			"10"
		"wide"			"10"
		"tall"			"10"
		"visible"		"0"
		"enabled"		"1"
		"image"			"mvm/class_upgraded"
		"scaleImage"	"1"
	}
	
	"MvMUpgradeImageSniper"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"MvMUpgradeImageSniper"
		"xpos"			"c158"
		"ypos"			"30"
		"zpos"			"10"
		"wide"			"10"
		"tall"			"10"
		"visible"		"0"
		"enabled"		"1"
		"image"			"mvm/class_upgraded"
		"scaleImage"	"1"
	}
	
	"MvMUpgradeImageSpy"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"MvMUpgradeImageSpy"
		"xpos"			"c208"
		"ypos"			"30"
		"zpos"			"10"
		"wide"			"10"
		"tall"			"10"
		"visible"		"0"
		"enabled"		"1"
		"image"			"mvm/class_upgraded"
		"scaleImage"	"1"
	}
	
	"TFPlayerModel"
	{
		"ControlName"	"CTFPlayerModelPanel"
		"fieldName"		"TFPlayerModel"
		"xpos"			"c-360"
		"ypos"			"0"
		"zpos"			"6"
		"wide"			"480"
		"tall"			"480"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"fov"			"25"
		"allow_rot"		"0"
		"paintbackground"	"1"
		"render_texture"	"0"
		"paintbackgroundenabled" "1"
		"bgcolor_override" "255 255 255 0"
		
		"model"
		{
			"force_pos"	"1"
			"angles_x" "0"
			"angles_y" "180"
			"angles_z" "0"
			"origin_x" "320"
			"origin_y" "10"
			"origin_z" "-49"
			"frame_origin_x"	"0"
			"frame_origin_y"	"0"
			"frame_origin_z"	"0"
			"spotlight" "1"
			"modelname"		""
		}
	}
	
	"ClassTipsPanel"
	{
		"ControlName"	"CTFClassTipsPanel"
		"fieldName"		"ClassTipsPanel"
		"xpos"			"9999"
	}
	
	"localPlayerImage" [$WIN32]
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"localPlayerImage"
		"xpos"			"9999"
	}
	
	"localPlayerBG"
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"localPlayerBG"
		"xpos"			"9999"
	}
	
	"ClassHighlightPanel"
	{
		"ControlName"	"CExplanationPopup"
		"fieldName"		"ClassHighlightPanel"
		"xpos"			"c-75"
		"ypos"			"280"
		"zpos"			"100"
		"wide"			"250"
		"tall"			"170"
		"visible"		"0"
		"PaintBackgroundType"	"2"
		"paintbackground" "0"
		"border"		"MainMenuHighlightBorder"
		"start_x"		"c-238"
		"start_y"		"100"
		"start_wide"	"1"
		"start_tall"	"1"
		"end_x"			"c-325"
		"end_y"			"250"
		"end_wide"		"275"
		"end_tall"		"150"
		"callout_inparents_x"	"c-210"
		"callout_inparents_y"	"437"
		
		"TitleLabel"
		{
			"ControlName"	"CExLabel"
			"fieldName"		"TitleLabel"
			"font"			"HudFontSmallBold"
			"labelText"		"#CMenu_ClassHighlightPanel_Title"
			"textAlignment"	"north-west"
			"xpos"			"10"
			"ypos"			"10"
			"wide"			"210"
			"tall"			"20"
			"autoResize"	"0"
			"pinCorner"		"0"
			"visible"		"1"
			"enabled"		"1"
			"wrap"			"1"
			"fgcolor_override" "TanDarker"
		}
		
		"ClassHighlightText"
		{
			"ControlName"	"CExLabel"
			"fieldName"		"ClassHighlightText"
			"font"			"HudFontSmall"
			"labelText"		"%ClassHighlightText%"
			"textAlignment"	"north-west"
			"xpos"			"20"
			"ypos"			"30"
			"wide"			"210"
			"tall"			"115"
			"autoResize"	"0"
			"pinCorner"		"0"
			"visible"		"1"
			"enabled"		"1"
			"wrap"			"1"
			"fgcolor_override" "TanDarker"
		}
		
		"CloseButton"
		{
			"ControlName"	"CExImageButton"
			"fieldName"		"CloseButton"
			"xpos"			"255"
			"ypos"			"5"
			"zpos"			"10"
			"wide"			"14"
			"tall"			"14"
			"autoResize"	"0"
			"pinCorner"		"0"
			"visible"		"1"
			"enabled"		"1"
			"tabPosition"	"0"
			"labeltext"		""
			"font"			"HudFontSmallBold"
			"textAlignment"	"center"
			"dulltext"		"0"
			"brighttext"	"0"
			"default"		"1"
			"sound_depressed"	"UI/buttonclick.wav"
			"sound_released"	"UI/buttonclickrelease.wav"
			"Command"		"close"
			"paintbackground"	"0"
			
			"defaultFgColor_override" "TanDarker"
			"armedFgColor_override" "TanLight"
			"depressedFgColor_override" "TanDarker"
			
			"image_drawcolor"	"TextColor"
			"image_armedcolor"	"LightRed"
			"SubImage"
			{
				"ControlName"	"ImagePanel"
				"fieldName"		"SubImage"
				"xpos"			"0"
				"ypos"			"0"
				"zpos"			"1"
				"wide"			"14"
				"tall"			"14"
				"visible"		"1"
				"enabled"		"1"
				"image"			"replay/thumbnails/close"
				"scaleImage"	"1"
			}
		}
	}
}