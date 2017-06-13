"Resource/UI/HudMedicCharge.res"
{	
	"Background"
	{
		"ControlName"		"CTFImagePanel"
		"fieldName"		"Background"
		"xpos"			"32"		// 2
		"ypos"			"71"	// 71
		"zpos"			"-1"
		"wide"			"98"
		"tall"	 		"12"
		"autoResize"		"0"
		"pinCorner"		"0"
		"visible"		"0"
		"enabled"		"1"
		"image"			"../hud/color_panel_brown"
		"scaleImage"		"1"
		"teambg_1"		"../hud/color_panel_brown"
		"teambg_2"		"../hud/color_panel_red"
		"teambg_2_lodef"	"../hud/color_panel_red"
		"teambg_3"		"../hud/color_panel_blu"
		"teambg_3_lodef"	"../hud/color_panel_blu"
		
		"src_corner_height"		"40"			// pixels inside the image
		"src_corner_width"		"40"			
		"draw_corner_width"		"0"			// screen size of the corners ( and sides ), proportional
		"draw_corner_height" 		"0"
	}
	"ChargeLabel"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"ChargeLabel"
		"font"			"HudFontMediumBigBold"
		"font_minmode"			"HudFontGiantBold"
		"xpos"			"60"		// 30
		"xpos_minmode"			"2"
		"ypos"			"7"
		"ypos_minmode"			"35"
		"zpos"			"6"
		"wide"			"170" //"170"
		"wide_minmode"		"100"
		"tall"			"40"
		"autoResize"	"1"
		"pinCorner"		"2"
		"visible"		"1"
		"visible_minmode"	"1"
		"enabled"		"1"
		"tabPosition"	"5"
		"labelText"		"#TF_UberchargeMinHUD" //was #TF_Ubercharge
		"labelText_minmode"	"#TF_UberchargeMinHUD"
		"textAlignment"	"center"
		"fgcolor" 	"White"
        "fgcolor_minmode"   "White"
	}

	"ChargeMeter"
	{	
		"ControlName"	"ContinuousProgressBar"
		"fieldName"		"ChargeMeter"
		"font"			"Default"
		"xpos"			"60"		// 30
		"xpos_minmode"			"3"
		"ypos"			"40"
		"ypos_minmode"			"72"
		"zpos"			"3"
		"wide"			"170"
		"wide_minmode"			"96"
		"tall"			"20"
		"tall_minmode"			"10"				
		"autoResize"	"1"
		"pinCorner"		"1"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"	"Left"
		"dulltext"		"0"
		"brighttext"	"1"
		"fillcolor" 		"255 255 255 255"
	}		

	//VACCINATOR
	
	"IndividualChargesLabel"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"IndividualChargesLabel"
		"font"			"HudFontMediumBold"
		"font_minmode"			"HudFontMediumBold"
		"xpos"			"58"		// 28
		"xpos_minmode"			"2"
		"ypos"			"7"
		"ypos_minmode"			"10"
		"zpos"			"6"
		"wide"			"200"
		"wide_minmode"		"100"
		"tall"			"20"
		"autoResize"	"1"
		"pinCorner"		"2"
		"visible"		"0"
		"visible_minmode"	"1"
		"enabled"		"1"
		"tabPosition"	"5"
		"labelText"		"#TF_IndividualUbercharges"
		"labelText_minmode"		"#TF_IndividualUberchargesMinHUD"
		"textAlignment"	"center"
		"dulltext"		"0"
		"brighttext"	"1"
        "fgcolor" 	"White"
        "fgcolor_minmode"  "White"
	}
	
        "ChargeMeter1"
	{	
		"ControlName"	"ContinuousProgressBar"
		"fieldName"		"ChargeMeter1"
		"font"			"Default"
		"xpos"			"70"		// 40
		"xpos_minmode"			"10"
		"ypos"			"30"
		"ypos_minmode"			"30"
		"zpos"			"2"
		"wide"			"42"
		"wide_minmode"	"19"
		"tall"			"20"	
		"tall_minmode"			"8"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"	"Left"
		"dulltext"		"0"
		"brighttext"	"0"
	}

	"ChargeMeter2"
	{	
		"ControlName"	"ContinuousProgressBar"
		"fieldName"		"ChargeMeter2"
		"font"			"Default"
		"xpos"			"115"		// 85
		"xpos_minmode"			"32"
		"ypos"			"30"
		"ypos_minmode"			"30"
		"zpos"			"2"
		"wide"			"42"
		"wide_minmode"	"19"
		"tall"			"20"	
		"tall_minmode"			"8"		
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"	"Left"
		"dulltext"		"0"
		"brighttext"	"0"
	}

	"ChargeMeter3"
	{	
		"ControlName"	"ContinuousProgressBar"
		"fieldName"		"ChargeMeter3"
		"font"			"Default"
		"xpos"			"160"		// 130
		"xpos_minmode"			"54"
		"ypos"			"30"
		"ypos_minmode"			"30"
		"zpos"			"2"
		"wide"			"42"
		"wide_minmode"	"19"
		"tall"			"20"	
		"tall_minmode"			"8"		
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"	"Left"
		"dulltext"		"0"
		"brighttext"	"0"
	}

	"ChargeMeter4"
	{	
		"ControlName"	"ContinuousProgressBar"
		"fieldName"		"ChargeMeter4"
		"font"			"Default"
		"xpos"			"205"		// 175
		"xpos_minmode"			"76"
		"ypos"			"30"
		"ypos_minmode"			"30"
		"zpos"			"2"
		"wide"			"42"
		"wide_minmode"	"19"
		"tall"			"20"	
		"tall_minmode"			"8"		
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"	"Left"
		"dulltext"		"0"
		"brighttext"	"0"
	}		
	
	"HealthClusterIcon"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"HealthClusterIcon"
		"xpos"			"30"		// 0
		"ypos"			"0"
		"wide"			"20"
		"tall"			"20"
		"visible"		"0"
		"visible_minmode"		"0"
		"enabled"		"1"
		"image"			"../hud/ico_health_cluster"
		"scaleImage"	"1"
       
       }

       "ResistIcon"
       {
		"ControlName"	"ImagePanel"
		"fieldName"		"ResistIcon"
		"xpos"			"30"		// 0
		"ypos"			"-25"
        "ypos_minmode" "-10"
		"wide"			"25"
		"tall"			"25"
		"visible"		"1"
		"visible_minmode"		"1"
		"enabled"		"1"
		"image"			"../HUD/defense_buff_bullet_blue"
		"scaleImage"	"1"	
	}	
		
}
