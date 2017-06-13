"Resource/UI/HudDamageAccount.res"
{
	"CDamageAccountPanel"
	{
		"fieldName"		"CDamageAccountPanel"
		"xpos"			"0"                    //Left-right orientation, no need to mess with this
		"ypos"			"c-260"                //Up-down orientation, change as needed
		"delta_item_end_y"	"0"
		"PositiveColor"		"Heal Numbers"          //Color of heal numbers
		"NegativeColor"		"Damage Numbers On Head"        //Color of damage numbers
		"delta_lifetime"	"1.8"                  //Duration
		"delta_item_font"	"HudFontSmall"         //Font
		"delta_item_font_big"	"HudFontSmall"
		"visible"		"1"
		"visible_minmode"	"1"
	}
	
	"DamageAccountValue"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"DamageAccountValue"
		"xpos"			"c-260"		// c-230
		"ypos"			"r156"		// r77
		"zpos"			"2"
		"wide"			"100"
		"tall"			"26"
		"visible"		"1"
		"visible_minmode"	"0"
		"enabled"		"1"
		"labelText"		"%metal%"
		"textAlignment"	"center"
		"fgcolor"		"255 255 0 255" // Damage Numbers
		"font"			"HudFontMediumBold"
	}
	
	"DamageAccountValueBG"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"DamageAccountValue"
		"xpos"			"c-259"		// c-229
		"ypos"			"r154"		// r75
		"zpos"			"1"
		"wide"			"100"
		"tall"			"26"
		"visible"		"1"
		"visible_minmode"	"0"
		"enabled"		"1"
		"labelText"		"%metal%"
		"textAlignment"	"center"
		"fgcolor"		"Shadow"
		"font"			"HudFontMediumBold"
	}
}