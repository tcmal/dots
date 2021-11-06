{-# LANGUAGE RebindableSyntax #-}

import XMonad.Config.Prime
import qualified XMonad.StackSet as W
import qualified Data.Map as M

import XMonad.Layout.Spacing
import qualified XMonad.Layout.Fullscreen as F

import XMonad.Actions.CycleWS (toggleWS)

import XMonad.Hooks.Script
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops

-- force fullscreen bind
toggleFull = withFocused (\windowId -> do
    { floats <- gets (W.floating . windowset);
        if windowId `M.member` floats
        then withFocused $ windows . W.sink
        else withFocused $ windows . (flip W.float $ W.RationalRect 0 0 1 1) })  


volUp = spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%"
volDown = spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%"
volMute = spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle"

main :: IO ()
main = xmonad $ do
    apply ewmh
    applyIO xmobar

    startupHook =+ spawn "dex -a"
    startupHook =+ spawn "feh --bg-scale ~/.background-image"

    -- looks
    logHook =+ fadeInactiveLogHook 0.6
    borderWidth =: 0
    handleEventHook =+ F.fullscreenEventHook
    manageHook =+ F.fullscreenManageHook
    modifyLayout $ F.fullscreenFull
    modifyLayout $ spacing 10

    -- applications
    terminal =: "alacritty"
    
    -- keybinds
    modMask =: mod4Mask
    keys =- ["M-S-q", "M-P", "M-S-P", "M-S-C", "M-S-/", "M-<Tab>", "M-S-<Tab>", "M-b"]

    keys =+ [
                ("M-<Return>", spawn "rofi -show drun"),
                ("M-t", spawn "alacritty"),
                ("M-S-r", spawn "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi"),

                -- volume management
                ("<XF86AudioRaiseVolume>", volUp),
                ("<XF86AudioLowerVolume>", volDown),
                ("<XF86AudioMute>", volMute),
                ("M-v", volUp),
                ("M-c", volDown),
                ("M-b", volMute),

                -- brightness management
                ("M-x", spawn "light -A 10; BRIGHTNESS=`light | cut -d '.' -f 1`; notify-send -i \"preferences-system-brightness-lock\" \"Brightness: ${BRIGHTNESS}%\""),
                ("M-z", spawn "light -U 10; BRIGHTNESS=`light | cut -d '.' -f 1`; notify-send -i \"preferences-system-brightness-lock\" \"Brightness: ${BRIGHTNESS}%\""),
                
                -- -- shutdown menu
                ("M-g", spawn "shutdown-menu"),

                -- window management
                ("M-S-q", kill),
                ("M-<Tab>", toggleWS),
                ("M-f", windows W.swapMaster),
                ("M-,", sendMessage (IncMasterN (-1))), ("M-.", sendMessage (IncMasterN 1)),
                ("M-S-f", toggleFull)
            ]