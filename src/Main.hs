module Main where

import Graphics.Gloss
import Graphics.Gloss.Data.ViewPort
import GameState 
import UpdateGame
import Renderer
import EventSystem
import GameSettings

playSnake :: IO ()
playSnake = play (InWindow "Snake" (sizeOfScreen, sizeOfScreen) (100, 100)) bgColor 32 initialGameState render handleKeys update 


main :: IO ()
main = playSnake
