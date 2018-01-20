module GameSettings where

import Graphics.Gloss

sizeOfTile :: Int 
sizeOfTile = 16

sizeOfBoard :: Int
sizeOfBoard = 17

sizeOfScreen :: Int
sizeOfScreen = sizeOfTile * (sizeOfBoard)

bgColor, snakeColor ,appleColor :: Color
bgColor = white
snakeColor = black
appleColor = red

