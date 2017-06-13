"Resource/UI/HudInspectPanel.res"
{	
	"itempanel"
	{
		"ControlName"	"CItemModelPanel"
		"fieldName"		"itempanel"
		"xpos"			"9999"
		"ypos"			"9999"
		"zpos"			"9999"
		"wide"			"0"
		"tall"			"0"
		"visible"		"0"
		"bgcolor_override"		"0 0 0 0"
		
		"model_xpos"		"9999"
		"model_center_y"	"9999"
		"model_wide"		"0"
		"model_tall"		"0"
		
		"text_xpos"		"0"
		"text_wide"		"0"
		"text_center"	"0"
		
		"max_text_height"	"0"
		"padding_height"	"0"
		"resize_to_text"	"0"
		"text_forcesize"	"0"
		
		"itemmodelpanel"
		{
			"fieldName"		"itemmodelpanel"
			"use_item_rendertarget" "0"
			"useparentbg"		"0"
		}


		"ItemLabel"
		{	
			"ControlName"	"Label"
			"fieldName"		"ItemLabel"
			"font"			"DefaultSmall"
			"xpos"			"9999"
			"ypos"			"9999"
			"zpos"			"9999"
			"wide"			"0"
			"tall"			"0"
			"autoResize"	"0"
			"pinCorner"		"0"
			"visible"		"0"
			"enabled"		"0"
			"labelText"		"#FreezePanel_Item"
			"textAlignment"	"Left"
			"dulltext"		"0"
			"brighttext"	"0"
		}
		
		"attriblabel"
		{
			"ControlName"	"CExLabel"
			"fieldName"		"attriblabel"
			"font"			"ItemFontAttribLarge"
			"xpos"			"9999"
			"ypos"			"9999"
			"zpos"			"9999"
			"wide"			"0"
			"tall"			"0"
			"autoResize"	"0"
			"pinCorner"		"0"
			"visible"		"0"
			"enabled"		"0"
			"labelText"		"%attriblist%"
			"textAlignment"	"north"
			"fgcolor"		"0 0 0 0"
			"centerwrap"	"0"
		}
	}	
}
