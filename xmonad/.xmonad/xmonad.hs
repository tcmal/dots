-- import XMonad.Config.Prime
import qualified Data.Map as M
-- import qualified Prelude as P



-- import XMonad.Hooks.EwmhDesktops as E
import XMonad
import XMonad.Util.EZConfig

import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Spacing
import qualified XMonad.StackSet as W
import XMonad.Actions.CycleWS (toggleWS)
import qualified XMonad.Layout.Fullscreen as F

import XMonad.Config.Xfce


-- force fullscreen bind
toggleFull = withFocused (\windowId -> do
    { floats <- gets (W.floating . windowset);
        if windowId `M.member` floats
        then withFocused $ windows . W.sink
        else withFocused $ windows . (flip W.float $ W.RationalRect 0 0 1 1) })

tall :: Tall a
tall = Tall 1 (3/100) (5/8)

customKeys :: [(String, X ())]
customKeys = [
                ("M-<Return>", spawn "rofi -show combi")
                , ("M-t", spawn "kitty")
                , ("M-S-r", spawn "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi")

                , ("M-0", (windows $ W.greedyView "0"))
                , ("M-S-0", (windows $ W.shift "0"))

                -- -- shutdown menu
                , ("M-g", spawn "xfce4-session-logout")

                -- window management
                , ("M-S-q", kill)
                , ("M-<Tab>", toggleWS)
                , ("M-f", windows W.swapMaster)
                ,  ("M-,", sendMessage (IncMasterN (-1))), ("M-.", sendMessage (IncMasterN 1))
                , ("M-S-f", toggleFull)
            ]
main :: IO ()
main = do
  spawn "picom & "
  spawn "xfce4-panel -d & "
  xmonad $ F.fullscreenSupport $ xfceConfig
              { modMask = mod4Mask
                , borderWidth = 0
                , terminal = "xfce4-terminal"
                , layoutHook = F.fullscreenFocus $
                               desktopLayoutModifiers $
                               spacingRaw False (Border 10 10 10 10) True (Border 10 10 10 10) True $
                               tall ||| Mirror tall ||| Full
                , manageHook = composeAll [manageHook xfceConfig
                                          , isFullscreen --> doFullFloat]
                , workspaces = map show ([1..9] ++ [0])
              }
        `additionalKeysP` customKeys
