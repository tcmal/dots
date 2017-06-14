"Resource/UI/HudItemEffectMeter_ParticleCannon.res"
{
	HudItemEffectMeter
	{
		"fieldName"			"HudItemEffectMeter"
		"visible"			"1"
		"enabled"			"1"
		"xpos"				"c-60"
		"ypos"				"r102"
		"ypos_minmode"		"c+79"
		"wide"				"120"
		"tall"				"6"
		"MeterFG"			"White"
		"MeterBG"			"Gray"
	}
	
	"OutlineBorder"
	{	
		"ControlName"			"EditablePanel"
		"fieldName"				"OutlineBorder"
		"font"					"Default"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"100"
		"wide"					"120"
		"tall"					"6"			
		"visible"				"1"
		"enabled"				"1"
		"paintborder"			"1"
		"border"				"G_MeterBorder"
	}
	
	"ItemEffectMeterLabel"
	{
		"ControlName"			"CExLabel"
		"fieldName"				"ItemEffectMeterLabel"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"10"
		"wide"					"120"
		"tall"					"7"
		"autoResize"			"1"
		"pinCorner"				"2"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"labelText"				"#TF_BALL"
		"textAlignment"			"center"
		"dulltext"				"0"
		"brighttext"			"0"
		"font"					"DefaultVerySmall"
		"fgcolor_override"		"155 155 155 255"
		"textinsety"			"-1"
	}
	
	"ItemEffectMeter"
	{	
		"ControlName"			"ContinuousProgressBar"
		"fieldName"				"ItemEffectMeter"
		"font"					"Default"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"2"
		"wide"					"120"
		"tall"					"6"		
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"textAlignment"			"Left"
		"dulltext"				"0"
		"brighttext"			"0"
		"bgcolor_override"		"G_ItemMeterBg"
		"paintborder"			"0"
	}
	
}