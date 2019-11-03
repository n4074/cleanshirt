import XMonad  
import XMonad.Actions.PhysicalScreens
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks  
import XMonad.Util.EZConfig  
import XMonad.Layout.NoBorders(smartBorders, noBorders)
import XMonad.Layout.Spacing(spacingRaw, Border(..), spacing)
import XMonad.Layout.MouseResizableTile  
import XMonad.Actions.NoBorders
import XMonad.Hooks.EwmhDesktops
import qualified XMonad.StackSet as W  
import System.IO  

layouts = avoidStruts (noBorders (tall ||| Full))
            where gaps = spacingRaw True (Border 20 20 20 20) True (Border 10 10 10 10) True 
                  tall = gaps $ Tall 1 (3/100) (1/2)
  

main = do  
  xmonad $ 
    ewmh $ 
    docks $
    def { 
      --manageHook = manageDocks <+> manageHook defaultConfig  
     layoutHook = layouts
    , terminal = "termonad"
    , modMask = mod4Mask  
    --, startupHook = startupHook defaultConfig >> setWMName "LG3D" -- This fixes some issues with Java guis, uncomment if you have issues
    } `additionalKeysP` ( [ ("M-g",   withFocused toggleBorder)
        , ("M-S-p"  , spawn "rofi -modi combi,window,run -show combi -combi window,run") -- basic example of assigning an application to a key combination
        , ("M-a"  , onPrevNeighbour def W.view)
        , ("M-o"  , onNextNeighbour def W.view)
        , ("M-S-a", onPrevNeighbour def W.shift)
        , ("M-S-o", onNextNeighbour def W.shift) ]
        ++
        [( "M-" ++  key, screenWorkspace sc >>= flip whenJust (windows . f)) -- This sets up key bindings to shift between monitors
        | (key, sc) <- zip ["w", "e", "r"] [0,1,2] 
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]] )
