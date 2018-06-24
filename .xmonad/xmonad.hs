-- Libraries
import XMonad
import Control.Monad
import XMonad.Config.Desktop

import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook

import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce


import XMonad.Layout
import XMonad.Layout.PerWorkspace
import XMonad.Layout.SimpleFloat
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.Spacing
import XMonad.Layout.Fullscreen
import XMonad.Layout.ResizableTile
import XMonad.Layout.NoBorders(smartBorders, noBorders)

import XMonad.Actions.CycleWS
import System.IO
import Graphics.X11.ExtraTypes.XF86


-- Workspaces
myWorkspaces :: [String]
myWorkspaces = ["TERM", "NET", "DEV", "MED"]


-- Manage Hook
myManageHook = composeAll . concat $
  [ [ className =? "Chromium" --> doShift "NET" ]
  , [ className =? c --> doShift "MED" | c <- medApp]
  , [ className =? c --> doShift "DEV" | c <- devApp]
  , [ className =? c --> doFloat | c <- floatingApp]
  , [ className =? c --> doIgnore | c <- ignoreApp]
  , [ isDialog --> doCenterFloat]
  , [ isRole =? "pop-up" --> doCenterFloat]
  , [ manageDocks]
  , [ manageHook desktopConfig]
  ] where
    isRole = stringProperty "WM_WINDOW_ROLE"
    devApp = ["SecureCRT", "GNS3"]
    medApp = ["MPlayer", "smplayer"]
    floatingApp = ["SecureCRT", "TeamViewer"]
    ignoreApp = ["desktop", "desktop_window", "notify-osd", "stalonetray", "trayer"]


-- Hotkeys
myKeys =
  [ ((m, xK_b), spawn "chromium")
  , ((m, xK_p), spawn dmenu)
  , ((m .|. s, xK_h), sendMessage MirrorShrink)
  , ((m .|. s, xK_l), sendMessage MirrorExpand)
  , ((0, xF86XK_AudioLowerVolume), spawn "amixer -D pulse set Master 5%-")
  , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -D pulse set Master 5%+")
  , ((0, xF86XK_AudioMute), spawn "amixer -D pulse set Master toggle")
  , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -10")
  , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight +10")
  -- , ((0, xK_Print), spawn "flameshot gui")
  ] where m = myModMask
          s = shiftMask


-- Layout
myLayout =
  avoidStruts $ smartBorders $
  smartSpacingWithEdge 4 (tile ||| Mirror tile) ||| Full
  where tile = ResizableTall 1 (1/10) (1/2) []


-- Log Hook
myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ defaultPP
  { ppOutput = hPutStrLn h
  , ppCurrent = dzenColor (fg) (bg) . pad
  , ppVisible = pad
  , ppHidden = pad
  , ppSep = "  "
  , ppOrder = \(ws:l:t:_) -> [l,ws]
  , ppLayout  = 
      (\layout -> case layout of
        "SmartSpacingWithEdge 4 ResizableTall" -> "  þ"
        "SmartSpacingWithEdge 4 Mirror ResizableTall" -> "  ü"
        "Full" -> "  ÿ"
      )
  } where bg = brown
          fg = white


panel = "dzen2 -dock -ta l -h 26 -bg '" ++ bg ++ "' \
            \ -fg '"++ fg ++"' \
            \ -fn '"++ fn ++"'"
        where bg = gray
              fg = white
              fn = "Misc Termsyn.Icons:size=13"

leftPanel = panel

panel' = panel ++ " -w 500 -h 26 -x -500 -ta r"

rightPanel = "conky -c /home/rzwei/.xmonad/status.conf | " ++ panel'


-- Colors
blue = "#555C7C"
brown = "#B79288"
white = "#F2EBEA"
gray = "#483236"
gray2 = "#7C5F5C"
pink = "#9D3E58"


-- Xmonad
myTerminal = "urxvt"
myModMask = mod4Mask
myFocusFollowMouse = False
dmenu = "dmenu_run -fn 'Misc Termsyn' -w 400 -h 26 -x 966 \
        \ -nb '" ++ nb ++ "' \
        \ -sb '" ++ sb ++ "'"
	where nb = gray
	      sb = pink


-- Border
myBorderWidth = 5
myFocusBorder = white
myNormalBorder = gray2


-- Startup
myStartupHook :: X()
myStartupHook = do
  spawnOnce "./.fehbg"
  spawnOnce "xsetroot -cursor_name left_ptr"
  {- setWMName "LG3D" -}


-- Main
main = do
  leftBar <- spawnPipe leftPanel
  rightBar <- spawnPipe rightPanel
  xmonad $ docks defaultConfig
    { terminal = myTerminal
    , layoutHook = myLayout
    , manageHook = manageDocks <+> myManageHook
    , logHook = myLogHook leftBar
    , handleEventHook = docksEventHook <+> XMonad.Hooks.EwmhDesktops.fullscreenEventHook
    , modMask = myModMask
    , borderWidth = myBorderWidth
    , focusFollowsMouse = myFocusFollowMouse
    , startupHook = myStartupHook
    , workspaces = myWorkspaces
    , focusedBorderColor = myFocusBorder
    , normalBorderColor = myNormalBorder
    } `additionalKeys` myKeys


