-- | This is an example Termonad configuration that shows how to use the
-- Solarized colour scheme https://ethanschoonover.com/solarized/

module Main where

import Termonad
  ( CursorBlinkMode(..), Option(Set)
  , ShowScrollbar(..), TMConfig, confirmExit, cursorBlinkMode
  , defaultConfigOptions, defaultTMConfig, options, showMenu, showScrollbar
  , start
  )
import Termonad.Config.Colour
  ( AlphaColour, ColourConfig, Palette(ExtendedPalette), addColourExtension
  , createColour, createColourExtension, defaultColourConfig
  , foregroundColour, palette, sRGB32
  )
import Termonad.Config.Vec (Vec((:*), EmptyVec), N8)

-- This is our main 'TMConfig'.  It holds all of the non-colour settings
-- for Termonad.
--
-- This shows how a few settings can be changed.
myTMConfig :: TMConfig
myTMConfig =
  defaultTMConfig
    { options =
        defaultConfigOptions
          { showScrollbar = ShowScrollbarIfNeeded
          , confirmExit = False
          , showMenu = False
          , cursorBlinkMode = CursorBlinkModeOn
          }
    }

-- This is our Solarized dark 'ColourConfig'.  It holds all of our dark-related settings.
solarizedDark :: ColourConfig (AlphaColour Double)
solarizedDark =
  defaultColourConfig
    -- Set the default foreground colour of text of the terminal.
    { foregroundColour = Set (createColour 131 148 150) -- base0
    -- Set the extended palette that has 2 Vecs of 8 Solarized palette colours
    , palette = ExtendedPalette solarizedDark1 solarizedDark2
    }
  where
    solarizedDark1 :: Vec N8 (AlphaColour Double)
    solarizedDark1 =
         createColour   0  43  54 -- base03, background
      :* createColour 220  50  47 -- red
      :* createColour 133 153   0 -- green
      :* createColour 181 137   0 -- yellow
      :* createColour  38 139 210 -- blue
      :* createColour 211  54 130 -- magenta
      :* createColour  42 161 152 -- cyan
      :* createColour 238 232 213 -- base2
      :* EmptyVec

    solarizedDark2 :: Vec N8 (AlphaColour Double)
    solarizedDark2 =
         createColour   7  54  66 -- base02, background highlights
      :* createColour 203  75  22 -- orange
      :* createColour  88 110 117 -- base01, comments / secondary text
      :* createColour 131 148 150 -- base0, body text / default code / primary content
      :* createColour 147 161 161 -- base1, optional emphasised content
      :* createColour 108 113 196 -- violet
      :* createColour 101 123 131 -- base00
      :* createColour 253 246 227 -- base3
      :* EmptyVec

-- This is our Solarized light 'ColourConfig'.  It holds all of our light-related settings.
solarizedLight :: ColourConfig (AlphaColour Double)
solarizedLight =
  defaultColourConfig
    -- Set the default foreground colour of text of the terminal.
    { foregroundColour = Set (createColour 101 123 131) -- base00
    -- Set the extended palette that has 2 Vecs of 8 Solarized palette colours
    , palette = ExtendedPalette solarizedLight1 solarizedLight2
    }
  where
    solarizedLight1 :: Vec N8 (AlphaColour Double)
    solarizedLight1 =
         sRGB32 238 232 213 1 -- base2, background highlights
      :* createColour 220  50  47 -- red
      :* createColour 133 153   0 -- green
      :* createColour 181 137   0 -- yellow
      :* createColour  38 139 210 -- blue
      :* createColour 211  54 130 -- magenta
      :* createColour  42 161 152 -- cyan
      :* createColour   7  54  66 -- base02
      :* EmptyVec

    solarizedLight2 :: Vec N8 (AlphaColour Double)
    solarizedLight2 =
         createColour 253 246 227 -- base3, background
      :* createColour 203  75  22 -- orange
      :* createColour 147 161 161 -- base1, comments / secondary text
      :* createColour 101 123 131 -- base00, body text / default code / primary content
      :* createColour  88 110 117 -- base01, optional emphasised content
      :* createColour 108 113 196 -- violet
      :* createColour 131 148 150 -- base0
      :* createColour   0  43  54 -- base03
      :* EmptyVec


--      #define Background_Color #1c1c1c
--      #define Bold_Color #ffffff
--      #define Cursor_Color #e2bbef
--      #define Cursor_Text_Color #000000
--      #define Foreground_Color #ddeedd
--      #define Selected_Text_Color #ffffff
--      #define Selection_Color #4d4d4d
arthur :: ColourConfig (AlphaColour Double)
arthur =
  defaultColourConfig
    -- Set the default foreground colour of text of the terminal.
    { foregroundColour = Set (createColour 0xdd 0xee 0xdd) -- base00
    -- Set the extended palette that has 2 Vecs of 8 Solarized palette colours
    , palette = ExtendedPalette arthur1 arthur2
    }
  where
    arthur1 :: Vec N8 (AlphaColour Double)
    arthur1 =
--      #define Ansi_0_Color #3d352a
         sRGB32 0x3d 0x35 0x2a 0xff -- base2, background highlights
--      #define Ansi_1_Color #cd5c5c
      :* createColour 0xcd 0x5c 0x5c -- red
--      #define Ansi_2_Color #86af80
      :* createColour 0x86 0xaf 0x80 -- green
--      #define Ansi_3_Color #e8ae5b
      :* createColour 0xe8 0xae 0x5b -- yellow
--      #define Ansi_4_Color #6495ed
      :* createColour  0x64 0x95 0xed -- blue
--      #define Ansi_5_Color #deb887
      :* createColour 0xde 0xb8 0x87 -- magenta
--      #define Ansi_6_Color #b0c4de
      :* createColour  0xb0 0xc4 0xde -- cyan
--      #define Ansi_7_Color #bbaa99
      :* createColour  0xbb 0xaa 0x99 -- base02
      :* EmptyVec

    arthur2 :: Vec N8 (AlphaColour Double)
    arthur2 =
--      #define Ansi_8_Color #554444
         createColour 0x55 0x44 0x44 -- base3, background
--      #define Ansi_9_Color #cc5533
      :* createColour 0xcc 0x55 0x33 -- orange
--      #define Ansi_10_Color #88aa22
      :* createColour 0x88 0xaa 0x22 -- base1, comments / secondary text
--      #define Ansi_11_Color #ffa75d
      :* createColour 0xff 0xa7 0x5d -- base00, body text / default code / primary content
--      #define Ansi_12_Color #87ceeb
      :* createColour  0x87 0xce 0xeb -- base01, optional emphasised content
--      #define Ansi_13_Color #996600
      :* createColour 0x99 0x66 0x00 -- violet
--      #define Ansi_14_Color #b0c4de
      :* createColour 0xb0 0xc4 0xde -- base0
--      #define Ansi_15_Color #ddccbb
      :* createColour 0xdd 0xcc 0xbb -- base03
      :* EmptyVec



main :: IO ()
main = do
  -- First, create the colour extension based on either Solarixed modules.
  myColourExt <- createColourExtension arthur

  -- Update 'myTMConfig' with our colour extension.
  let newTMConfig = addColourExtension myTMConfig myColourExt

  -- Start Termonad with our updated 'TMConfig'.
  start newTMConfig
