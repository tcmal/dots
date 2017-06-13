"GameMenu" [$WIN32]
{
	"QuickplayButton"
	{
		"label" 		"QUICKPLAY" 
		"command" 		"quickplay"
		"subimage" 		"glyph_multiplayer"
		"OnlyAtMenu" 	"0"
	}
	"QuickplayChangeButton"
	{
		"label" 		"#MMenu_NewGame" 
		"command" 		"quickplay"
		"subimage" 		"glyph_server"
		"OnlyInGame" 	"1"
	}
	"PlayPVEButton"
	{
		"label" 		"#MMenu_PlayCoop" 
		"command" 		"playpve"
		"subimage" 		"glyph_coop"
		"OnlyAtMenu" 	"0"
	}
	"ServerBrowserButton"
	{
		"label" 		"#MMenu_Servers" 
		"command" 		"OpenServerBrowser"
		"subimage" 		"glyph_server_browser"
		"OnlyAtMenu" 	"0"
	} 
	"ChangeServerButton"
	{
		"label" 		"#MMenu_ChangeServer" 
		"command" 		"OpenServerBrowser"
		"subimage" 		"glyph_server_browser"
		"OnlyInGame" 	"1"
	}
	"ReplayBrowserButton"
	{
		"label" 		"DEMO UI"
		"command" 		"engine demoui"
		"subimage" 		"glyph_tv"
	}
	"SteamWorkshopButton"
	{
		"label" 		"#MMenu_SteamWorkshop"
		"command" 		"engine OpenSteamWorkshopDialog"
		"subimage" 		"glyph_steamworkshop"
	}
	"VRModeButton"
	{
		"label" 		"#MMenu_VRMode_Activate"
		"command" 		"engine vr_toggle"
		"subimage" 		"glyph_vr"
		"OnlyWhenVREnabled" "1"
	}
		"PlayCompButton"
	{
		"label" 		"Competitive" 
		"command" 		"ladder_ui_show"
		"subimage" 		"beta"
		"OnlyAtMenu" 	"0"
		//"OnlyWhenCompetitiveEnabled" "1"
	}
	//--------------------------------------------------------------
	// These buttons get positioned by the MainMenuOverride.res
	//--------------------------------------------------------------
	"CreateServerButton"
	{
		"label" 		"#GameUI_GameMenu_CreateServer"
		"command" 		"OpenCreateMultiplayerGameDialog"
		"OnlyAtMenu" 	"0"
		"tooltip" 		"#GameUI_GameMenu_CreateServer"
	}
	"GeneralStoreButton"
	{
		"label" 		"#MMenu_Shop"
		"command" 		"engine open_store"
		"subimage" 		"glyph_store"
	}	
	"CharacterSetupButton"
	{
		"label" 		"#MMenu_CharacterSetup"
		"command" 		"engine open_charinfo"
		"subimage" 		"glyph_items"
	}
	//------------------------------------------------------------
	// These buttons are only shown while in-game
	// and also are positioned by the MainMenuOverride.res
	//------------------------------------------------------------
	"CallVoteButton"
	{
		"label"			""
		"command"		"callvote"
		"OnlyInGame"	"0"
		"subimage" 		"icon_checkbox"
		"tooltip" 		"#MMenu_CallVote"
	}
	"MutePlayersButton"
	{
		"label"			""
		"command"		"OpenPlayerListDialog"
		"OnlyInGame"	"0"
		"subimage" 		"glyph_muted"
		"tooltip" 		"#MMenu_MutePlayers"
	}
	"RequestCoachButton"
	{
		"label"			""
		"command"		"engine cl_coach_find_coach"
		"OnlyInGame"	"1"
		"subimage" 		"icon_whistle"
		"tooltip" 		"#MMenu_RequestCoach"
	}
	"ServerShortcut1"
	{
		"label" 		"stabby's Server Connect"
		"command" 		"engine connect 66.150.188.38:27015"
		"tooltip" 		"Connect to stabby's Server"
		"OnlyAtMenu"	"0"
		"OnlyInGame"	"0"
	}
}
