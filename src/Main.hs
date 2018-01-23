module Main where

import Graphics.Gloss
import GameState 
import UpdateGame
import Renderer
import EventSystem
import GameSettings

-- | Entry point of the program
main :: IO ()
main = play 
 (InWindow "Snake" (sizeOfScreen, sizeOfScreen) (100, 100)) 
 bgColor 
 fps
 initialGameState 
 render 
 handleKeys 
 update 

