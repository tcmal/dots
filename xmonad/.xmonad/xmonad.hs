{-# LANGUAGE RebindableSyntax #-}

import XMonad.Config.Prime
import qualified XMonad.StackSet as W
import qualified Data.Map as M

import XMonad.Layout.Spacing
import qualified XMonad.Layout.Fullscreen as F

import XMonad.Actions.CycleWS (toggleWS)

import XMonad.Hooks.EwmhDesktops as E
import XMonad.Config.Xfce

-- force fullscreen bind
toggleFull = withFocused (\windowId -> do
    { floats <- gets (W.floating . windowset);
        if windowId `M.member` floats
        then withFocused $ windows . W.sink
        else withFocused $ windows . (flip W.float $ W.RationalRect 0 0 1 1) })  

main :: IO ()
main = xmonad $ do
    startWith xfceConfig

    -- looks
    borderWidth =: 0
    modifyLayout $ spacing 10

    -- fullscreen button
    handleEventHook =+ F.fullscreenEventHook
    handleEventHook =+ E.fullscreenEventHook
    manageHook =+ F.fullscreenManageHook
    modifyLayout $ F.fullscreenFloat

    -- applications
    terminal =: "xfce4-terminal"
    
    -- keybinds
    modMask =: mod4Mask
    keys =- ["M-S-q", "M-P", "M-S-P", "M-S-C", "M-S-/", "M-<Tab>", "M-S-<Tab>", "M-b"]
    withWorkspaces (do
        wsKeys =+ ["0"])

    keys =+ [
                ("M-<Return>", spawn "rofi -show combi"),
                ("M-t", spawn "xfce4-terminal"),
                ("M-S-r", spawn "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi"),

                -- -- shutdown menu
                ("M-g", spawn "xfce4-session-logout"),

                -- window management
                ("M-S-q", kill),
                ("M-<Tab>", toggleWS),
                ("M-f", windows W.swapMaster),
                ("M-,", sendMessage (IncMasterN (-1))), ("M-.", sendMessage (IncMasterN 1)),
                ("M-S-f", toggleFull)
            ]
