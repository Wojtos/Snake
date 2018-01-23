module GameSettings where

import Graphics.Gloss

-- | Frames generated per secound - sets pace of the game (Can be modified)
fps :: Int
fps = 12

-- | Given in pixels (Can be modified)
sizeOfTile :: Int 
sizeOfTile = 16

-- | Given in tiles (Can be modified)
sizeOfBoard :: Int
sizeOfBoard = 24

-- | Computes size of the window in pixels
sizeOfScreen :: Int
sizeOfScreen = sizeOfTile * (sizeOfBoard)

-- | Sets an amount of tiles the snake grows each time it eats an apple (Can be modified)
rewardForEatingApple :: Int
rewardForEatingApple = 3


bgColor, snakeColor ,appleColor, wallColor, gridColor :: Color
-- | Color of background outside of the map (Visible only in fullscreen-mode) (Can be modified)
bgColor = black
-- | Color of snake's body (Can be modified)
snakeColor = dark green
-- | Color of apples (Can be modified)
appleColor = red
-- | Color of walls (Can be modified)
wallColor = light (light black)
-- | Color of grid in the background of the map, half of the tiles will be a little bit lighter (Can be modified)
gridColor = black

