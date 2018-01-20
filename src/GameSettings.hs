module GameSettings where

import Graphics.Gloss

sizeOfTile :: Int 
sizeOfTile = 16

sizeOfScreen :: Int
sizeOfScreen = sizeOfTile * (17)

bgColor, snakeColor ,appleColor :: Color
bgColor = white
snakeColor = black
appleColor = red

