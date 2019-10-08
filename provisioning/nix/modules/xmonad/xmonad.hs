import XMonad  
import XMonad.Actions.PhysicalScreens
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks  
import XMonad.Util.EZConfig  
import XMonad.Layout.NoBorders(smartBorders)
import XMonad.Layout.MouseResizableTile  
import XMonad.Actions.NoBorders
import qualified XMonad.StackSet as W  
import System.IO  


main = do  
  xmonad $ def { 
      manageHook = manageDocks <+> manageHook defaultConfig  
--    , layoutHook = smartBorders $ avoidStruts $ mouseResizableTile
    , layoutHook = avoidStruts $ mouseResizableTile
    , terminal = "termonad"
    , modMask = mod4Mask  
    , normalBorderColor = "#60A1AD"  
    , focusedBorderColor = "#68e862"  
    , borderWidth   = 2
    , startupHook = startupHook defaultConfig >> setWMName "LG3D" -- This fixes some issues with Java guis, uncomment if you have issues
    } `additionalKeysP` ( [ ("M-g",   withFocused toggleBorder)
        , ("M-p"  , spawn "dmenu_run") -- basic example of assigning an application to a key combination
        , ("M-a"  , onPrevNeighbour def W.view)
        , ("M-o"  , onNextNeighbour def W.view)
        , ("M-S-a", onPrevNeighbour def W.shift)
        , ("M-S-o", onNextNeighbour def W.shift) ]
        ++
        [( "M-" ++  key, screenWorkspace sc >>= flip whenJust (windows . f)) -- This sets up key bindings to shift between monitors
        | (key, sc) <- zip ["w", "e", "r"] [0,1,2] 
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]] )
