module GameSettings where

import Graphics.Gloss

fps :: Float
fps = 16

sizeOfTile :: Int 
sizeOfTile = 16

sizeOfBoard :: Int
sizeOfBoard = 32

sizeOfScreen :: Int
sizeOfScreen = sizeOfTile * (sizeOfBoard)

rewardForEatingApple :: Int
rewardForEatingApple = 3

bgColor, snakeColor ,appleColor, wallColor, gridColor :: Color
bgColor = black
snakeColor = dark green
appleColor = light red
wallColor = light (light black)
gridColor = black

