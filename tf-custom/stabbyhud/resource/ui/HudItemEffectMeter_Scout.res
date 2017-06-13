"Resource/UI/HudItemEffectMeter_Scout.res"
{
	HudItemEffectMeter
	{
		"fieldName"		"HudItemEffectMeter"
		"visible"		"1"
		"enabled"		"1"
		"xpos"			"c-78"	[$WIN32]
		"xpos_minmode"	"c-154"	[$WIN32]
		"ypos"			"r131"	[$WIN32]
		"ypos_minmode"	"r141"	[$WIN32]
		"xpos"			"r194"	[$X360]
		"ypos"			"r74"	[$X360]
		"wide"			"999"
		"tall"			"999"
		"MeterFG"		"White"
		"MeterBG"		"Gray"
	}
	"ItemEffectMeterBG"
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"ItemEffectMeterBG"
		"wide"			"0"
		"tall"	 		"0"
		"visible"		"0"
		"enabled"		"0"
	}
	
	"ItemEffectMeterLabel"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"ItemEffectMeterLabel"
		"font"			"TFFontSmall"
		"xpos"			"40"
		"xpos_minmode"			"60"
		"ypos"			"60"
		"ypos_minmode"			"21"
		"zpos"			"6"
		"wide"			"41"
		"tall"			"15"
		"autoResize"	"1"
		"pinCorner"		"2"
		"visible"		"0"
		"enabled"		"1"
		"tabPosition"	"5"
		"labelText"		"#TF_Ball"
		"labelText_minmode"	"#TF_Ball"
		"textAlignment"	"center"
		"dulltext"		"0"
		"brighttext"	"1"
		"fgcolor" 	"0 0 0 255"
	}

	"ItemEffectMeter"
	{		
		"ControlName"	"ContinuousProgressBar"
		"fieldName"		"ItemEffectMeter"
		"visible"		"1"
		"enabled"		"1"
		"zpos"			"2"
		
		"xpos"			"16"
		"ypos"			"6"
		"wide"			"130"
		"tall"			"8"				
		
		"xpos_minmode"	"110"		
		"ypos_minmode"	"25"	
		"wide_minmode"	"87"
		"tall_minmode"	"6"			

	}

	"ChargeMark_Cola"
	{
		"controlName"	"ImagePanel"
		"fieldName"		"ChargeMark_Cola"
		"xpos"			"22"
		"ypos"			"25"
		"zpos"			"4"
		"wide"			"1"
		"tall"			"8"
		"visible"		"0"
		"visible_minmode"	"0"
		"enabled"		"1"
		"fillcolor"		"0 0 0 255"
	}
}