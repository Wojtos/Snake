module Main where

import Graphics.Gloss
import GameState 
import UpdateGame
import Renderer
import EventSystem
import GameSettings

-- | Starting a game
main :: IO ()
main = play 
 (InWindow "Snake" (sizeOfScreen, sizeOfScreen) (100, 100)) 
 bgColor 
 16 
 initialGameState 
 render 
 handleKeys 
 update 

