module Renderer where

import Graphics.Gloss
import GameState
import GameSettings


render :: GameState -> Picture
render state = pictures $
 (map (\x -> posToTile (mixColors 1 0.01 gridColor white) x) $ generateGrid 0) ++
 (map (\x -> posToTile (mixColors 1 0.005 gridColor white) x) $ generateGrid 1) ++
 (map (\x -> posToTile snakeColor x) $ snakeBody state) ++
 [posToTile appleColor $ applePos state ] ++
 (map (\x -> posToTile wallColor x) generateWalls)

posToTile :: Color -> Position -> Picture
posToTile col (x, y) = 
 translate (fromIntegral (x * sizeOfTile)) (fromIntegral (y * sizeOfTile)) $
 color col $
 rectangleSolid (fromIntegral sizeOfTile) (fromIntegral sizeOfTile)

generateWalls :: [Position]
generateWalls = [(i,j) | i <- [-x..x], j <- [-x..x], abs i == x || abs j == x]
 where x = quot sizeOfBoard 2

generateGrid :: Int -> [Position]
generateGrid x = [(i,j) | i <- [-x..x], j <- [-x..x], (i + j) `mod` 2 == x `mod` 2]
 where x = quot sizeOfBoard 2
 