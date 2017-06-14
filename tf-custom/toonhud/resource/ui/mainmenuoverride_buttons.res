"Resource/UI/MainMenuOverride.res"
{
	"PlayListContainer"
	{
		"ControlName"	"EditablePanel"
		"fieldName"		"PlayListContainer"
		"xpos"			"0"
		"ypos"			"0"
		"zpos"			"-52"
		"wide"			"0"
		"tall"			"180"
		"visible"		"1"
		"pin_to_sibling"			"FindAGameButton"
		"pin_corner_to_sibling"		"0"
		"pin_to_sibling_corner"		"1"
		
		"BubbleArrow"
		{
			"ControlName"			"ImagePanel"
			"fieldName"				"InfoImage"
			"xpos"					"0"
			"ypos"					"8"
			"zpos"					"100"
			"wide"					"16"
			"tall"					"16"
			"visible"				"1"
			"enabled"				"1"
			"image"					"replay/thumbnails/larrow"
			"scaleImage"			"0"
			"proportionaltoparent"	"1"
			"mouseinputenabled"		"0"
			"drawcolor"				"G_MainMenuButtonHover"
		}

		"PlaylistBGPanel"
		{
			"ControlName"	"EditablePanel"
			"fieldName"		"PlaylistBGPanel"
			"xpos"			"8"
			"ypos"			"0"
			"zpos"			"-1"
			"wide"			"160"
			"tall"			"180"
			"visible"		"1"
			"PaintBackgroundType"	"0"
			"border"		"NoBorder"
			"bgcolor_override"	"0 0 0 0"
			"proportionaltoparent"	"1"
			"pinCorner"		"2"
			"autoResize"	"1"

			"PlayListDropShadow"
			{
				"ControlName"	"EditablePanel"
				"fieldName"		"PlaylistBGPanel"
				"xpos"			"cs-0.5"
				"ypos"			"0"
				"zpos"			"100"
				"wide"			"p1"
				"tall"			"p1"
				"visible"		"0"
				"PaintBackgroundType"	"2"
				"border"		"InnerShadowBorder"
				"proportionaltoparent"	"1"
				"mouseinputenabled"	"0"
			}

			"PlayListContainer"
			{
				"ControlName"	"CExScrollingEditablePanel"
				"fieldName"		"PlayListContainer"
				"xpos"			"0"
				"ypos"			"0"
				"wide"			"171"
				"tall"			"180"
				"visible"		"1"
				"proportionaltoparent"	"1"
				"restrict_width" "0"

				"CasualEntry"
				{
					"ControlName"	"CMainMenuPlayListEntry"
					"fieldName"		"CasualEntry"
					"xpos"			"0"
					"ypos"			"0"
					"tall"			"30"
					"wide"			"p1"
					"proportionaltoparent"	"1"
					"image_name"		"replay/thumbnails/glyphs/glyph_tf2"
					"button_token"		"#MMenu_PlayList_Casual_Button"
					"button_command"	"play_casual"
					"desc_token"		"#MMenu_PlayList_Casual_Desc"
				}

				"CompetitiveEntry"
				{
					"ControlName"	"CMainMenuPlayListEntry"
					"fieldName"		"CompetitiveEntry"
					"xpos"			"0"
					"ypos"			"0"
					"tall"			"30"
					"wide"			"p1"
					"proportionaltoparent"	"1"
					"pin_to_sibling"			"CasualEntry"
					"pin_corner_to_sibling"		"0"
					"pin_to_sibling_corner"		"2"
					"image_name"		"replay/thumbnails/glyphs/glyph_competitive"
					"button_token"		"#MMenu_PlayList_Competitive_Button"
					"button_command"	"play_competitive"
					"desc_token"		"#MMenu_PlayList_Competitive_Desc"
				}

				"MvMEntry"
				{
					"ControlName"	"CMainMenuPlayListEntry"
					"fieldName"		"MvMEntry"
					"xpos"			"0"
					"ypos"			"0"
					"tall"			"30"
					"wide"			"p1"
					"proportionaltoparent"	"1"
					"pin_to_sibling"			"CompetitiveEntry"
					"pin_corner_to_sibling"		"0"
					"pin_to_sibling_corner"		"2"
					"image_name"		"replay/thumbnails/glyphs/glyph_coop"
					"button_token"		"#MMenu_PlayList_MvM_Button"
					"button_command"	"play_mvm"
					"desc_token"		"#MMenu_PlayList_MvM_Desc"
				}

				"ServerBrowserEntry"
				{
					"ControlName"	"CMainMenuPlayListEntry"
					"fieldName"		"ServerBrowserEntry"
					"xpos"			"0"
					"ypos"			"0"
					"tall"			"30"
					"wide"			"p1"
					"proportionaltoparent"	"1"
					"pin_to_sibling"			"MvMEntry"
					"pin_corner_to_sibling"		"0"
					"pin_to_sibling_corner"		"2"
					"image_name"		"replay/thumbnails/glyphs/glyph_server_browser"
					"button_token"		"#MMenu_PlayList_ServerBrowser_Button"
					"button_command"	"OpenServerBrowser"
					"desc_token"		"#MMenu_PlayList_ServerBrowser_Desc"
				}
				
				"CreateServerEntry"
				{
					"ControlName"	"CMainMenuPlayListEntry"
					"fieldName"		"CreateServerEntry"
					"xpos"			"0"
					"ypos"			"0"
					"tall"			"30"
					"wide"			"p1"
					"proportionaltoparent"	"1"
					"pin_to_sibling"			"ServerBrowserEntry"
					"pin_corner_to_sibling"		"0"
					"pin_to_sibling_corner"		"2"
					"image_name"		"replay/thumbnails/glyphs/glyph_create"
					"button_token"		"#MMenu_PlayList_CreateServer_Button"
					"button_command"	"OpenCreateMultiplayerGameDialog"
					"desc_token"		"#MMenu_PlayList_CreateServer_Desc"
				}
				
				"CreateServerButton"
				{
					"ControlName"	"EditablePanel"
					"fieldname"		"CreateServerButton"
					"xpos"			"-9999"
					"ypos"			"-9999"
					"zpos"			"0"
					"wide"			"0"
					"tall"			"0"
					"visible"		"0"		
				}

				"TrainingEntry"
				{
					"ControlName"	"CMainMenuPlayListEntry"
					"fieldName"		"TrainingEntry"
					"xpos"			"0"
					"ypos"			"0"
					"tall"			"30"
					"wide"			"p1"
					"proportionaltoparent"	"1"
					"pin_to_sibling"			"CreateServerEntry"
					"pin_corner_to_sibling"		"0"
					"pin_to_sibling_corner"		"2"
					"image_name"		"replay/thumbnails/glyphs/glyph_practice"
					"button_token"		"#MMenu_PlayList_Training_Button"
					"button_command"	"play_training"
					"desc_token"		"#MMenu_PlayList_Training_Desc"
				}

				"ScrollBar"
				{
					"ControlName"	"ScrollBar"
					"FieldName"		"ScrollBar"
					"xpos"			"rs1-1"
					"ypos"			"0"
					"tall"			"f0"
					"wide"			"5" // This gets slammed from client schme.  GG.
					"zpos"			"1000"
					"nobuttons"		"1"
					"proportionaltoparent"	"1"

					"Slider"
					{
						"fgcolor_override"	"TanDark"
					}
		
					"UpButton"
					{
						"ControlName"	"Button"
						"FieldName"		"UpButton"
						"visible"		"0"
					}
		
					"DownButton"
					{
						"ControlName"	"Button"
						"FieldName"		"DownButton"
						"visible"		"0"
					}
				}
			}
		}
	}
}