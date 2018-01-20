module GameSettings where

import Graphics.Gloss

sizeOfTile :: Int 
sizeOfTile = 16

sizeOfBoard :: Int
sizeOfBoard = 17

sizeOfScreen :: Int
sizeOfScreen = sizeOfTile * (sizeOfBoard)

rewardForEatingApple :: Int
rewardForEatingApple = 3

bgColor, snakeColor ,appleColor, wallColor :: Color
bgColor = black
snakeColor = dark green
appleColor = light red
wallColor = light (light black)

