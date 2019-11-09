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
    } `additionalKeysP` keybindings

layouts = avoidStruts (noBorders (tall ||| Full))
            where gaps = spacingRaw True (Border 20 20 20 20) True (Border 10 10 10 10) True 
                  tall = gaps $ Tall 1 (3/100) (1/2)

keybindings = [ ("M-p"  , spawn "rofi -show run") , ("M-o"  , spawn "rofi -show window") ]