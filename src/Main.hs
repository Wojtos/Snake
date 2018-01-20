module Main where

import Graphics.Gloss
import GameState 
import UpdateGame

playSnake :: Int -> Int -> IO ()
playSnake sizeOfScreen sizeOfTile = display (InWindow "Snake" (sizeOfScreen, sizeOfScreen) (0, 0)) white (rectangleSolid (fromIntegral sizeOfTile) (fromIntegral sizeOfTile))

main :: IO ()
main = playSnake 272 16
