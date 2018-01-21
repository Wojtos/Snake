module Main where

import Graphics.Gloss
import Graphics.Gloss.Data.ViewPort
import GameState 
import UpdateGame
import Renderer
import EventSystem
import GameSettings

playSnake :: Int -> Int -> IO ()
playSnake sizeOfScreen sizeOfTile = play FullScreen bgColor 4 initialGameState render handleKeys update 


main :: IO ()
main = playSnake 272 16
