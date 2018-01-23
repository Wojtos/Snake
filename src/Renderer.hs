module Renderer where

import Graphics.Gloss
import GameState
import GameSettings


-- | Renders image for each frame of the game depending on current GameState
render :: GameState -> Picture
render state = pictures $
 (map (\x -> posToTile gridColor x) $ generateGrid 0) ++
 (map (\x -> posToTile (mixColors 1 0.07 gridColor $ dark gridColor) x) $ generateGrid 1) ++
 (map (\x -> posToTile snakeColor x) $ snakeBody state) ++
 [posToTile appleColor $ applePos state ] ++
 (map (\x -> posToTile wallColor x) generateWalls)

-- | Turns given Position to square-shaped Picture and gives it certain Color  
posToTile :: Color -> Position -> Picture
posToTile col (x, y) = 
 translate (fromIntegral (x * sizeOfTile)) (fromIntegral (y * sizeOfTile)) $
 color col $
 rectangleSolid (fromIntegral sizeOfTile) (fromIntegral sizeOfTile)

-- | Generates walls on the edges of the board
generateWalls :: [Position]
generateWalls = [(i,j) | i <- [-x..x], j <- [-x..x], abs i == x || abs j == x]
 where x = quot sizeOfBoard 2

-- | Genrates checkered pattern visible in the background
generateGrid :: Int -> [Position]
generateGrid set = [(i,j) | i <- [-x..x], j <- [-x..x], (i + j) `mod` 2 == set `mod` 2]
 where x = quot sizeOfBoard 2
 