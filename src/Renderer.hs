module Renderer where

import Graphics.Gloss
import GameState
import GameSettings


render :: GameState -> Picture
render state = pictures (map (\x -> posToPixelCord snakeColor x) (snakeBody state) ++ [(posToPixelCord appleColor (applePos state ))])

posToPixelCord :: Color -> Position -> Picture
posToPixelCord col (x, y) = translate (fromIntegral (x * sizeOfTile)) (fromIntegral (y * sizeOfTile)) $ color col $ rectangleSolid (fromIntegral sizeOfTile) (fromIntegral sizeOfTile)