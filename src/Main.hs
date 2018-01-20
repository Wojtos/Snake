module Main where

import Graphics.Gloss
import Graphics.Gloss.Data.ViewPort
import GameState 
import UpdateGame
import Renderer

playSnake :: Int -> Int -> IO ()
playSnake sizeOfScreen sizeOfTile = simulate (InWindow "Snake" (sizeOfScreen, sizeOfScreen) (0, 0)) white 4 initialGameState render update 


main :: IO ()
main = playSnake 272 16
