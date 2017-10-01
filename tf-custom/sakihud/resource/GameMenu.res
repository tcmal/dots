"GameMenu" 
{
	"QuickplayButton"
	{
		"label" "Play Casual"
		"command" "play_casual"
		"subimage" "glyph_practice"
		"OnlyAtMenu" "1"
	}
	"QuickplayChangeButton"
	{
		"label" "Play Casual"
		"command" "play_casual"
		"subimage" "glyph_practice"
		"OnlyInGame" "1"
	}
	"CompetitiveButton"
	{
		"label" "Competitive"
		"command" "play_competitive"
		"subimage" "glyph_practice"
		"OnlyAtMenu" "0"
	}
	"PlayPVEButton"
	{
		"label" "Co-Operative"
		"command" "play_mvm"
		"subimage" "glyph_practice"
		"OnlyAtMenu" "1"
	}
	"CreateServerButton"
	{
		"label" "Create Server"
		"command" "OpenCreateMultiplayerGameDialog"
		"subimage" "glyph_practice"
		"OnlyAtMenu" "0"
	}
	"ServerBrowserButton"
	{
		"label" "Community Servers"
		"command" "OpenServerBrowser"
		"subimage" "glyph_practice"
		"OnlyAtMenu" "1"
	} 
	"ChangeServerButton"
	{
		"label" "Change Server"
		"command" "OpenServerBrowser"
		"subimage" "glyph_practice"
		"OnlyInGame" "1"
	}
	"ReplayBrowserButton"
	{
		"label" "Replays"
		"command" "engine replay_reloadbrowser"
		"subimage" "glyph_practice"
	}
	"TrainingButton"
	{
		"label" "Training"
		"command" "offlinepractice"
		"subimage" "glyph_practice"
		"OnlyAtMenu" "0"
	}
	"SettingsButton"
	{
		"label" "Options"
		"command" "OpenOptionsDialog"
		"subimage" "glyph_practice"
		"OnlyAtMenu" "0"
	}
	"TF2SettingsButton"
	{
		"label" "Advanced Options"
		"command" "opentf2options"
		"subimage" "glyph_practice"
		"OnlyAtMenu" "0"
	}
	"CallVoteButton"
	{
		"label"			"Call Vote"
		"command"		"callvote"
		"subimage" "glyph_practice"
		"OnlyInGame" "1"
	}
	"MutePlayersButton"
	{
		"label"			"Mute"
		"command"		"OpenPlayerListDialog"
		"subimage" "glyph_practice"
		"OnlyInGame" "1"
	}
	"DemoUIButton"
	{
		"label"			"Demo UI"
		"command"		"engine demoui"
		"subimage" "glyph_practice"
		"OnlyAtMenu" "0"
	}
	"ConsoleButton"
	{
		"label"			"Console"
		"command"		"engine con_enable 1;toggleconsole"
		"subimage" "glyph_practice"
		"OnlyAtMenu" "0"
	}
	"DisconnectButton"
	{
		"label" "Disconnect"
		"command" "engine disconnect"
		"subimage" "glyph_practice"
		"OnlyInGame"	"1"
	}
	"QuitButton"
	{
		"label" "Quit"
		"command" "engine replay_confirmquit"
		"subimage" "glyph_practice"
		"OnlyAtMenu" "1"
	}
	
	// These buttons get positioned by the MainMenuOverride.res	
	"GeneralStoreButton"
	{
		"label" "Shop"
		"command" "engine open_store"
		"subimage" "glyph_practice"
	}
	"CharacterSetupButton"
	{
		"label" "Items"
		"command" "engine open_charinfo"
		"subimage" "glyph_practice"
	}

	// These buttons are only shown while in-game
	// and also are positioned by the .res file
	"ResumeGameButton"
	{
		"label"			"Resume Game"
		"command"		"ResumeGame"
		"OnlyInGame"	"1"
		"subimage" "glyph_practice"
	}
}
