module Main where

import Graphics.Gloss
import GameState 
import UpdateGame
import Renderer

playSnake :: Int -> Int -> IO ()
playSnake sizeOfScreen sizeOfTile = display (InWindow "Snake" (sizeOfScreen, sizeOfScreen) (0, 0)) white (render initialGameState)

main :: IO ()
main = playSnake 272 16
