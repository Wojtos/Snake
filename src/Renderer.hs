module Renderer where

import Graphics.Gloss
import GameState
import GameSettings


render :: GameState -> Picture
render state = pictures (snakeBody.map(\x -> x-> posToPixelCord snakeColor x) ++ (posToPixelCord  appleColor applePos))

posToPixelCord :: Color -> Position -> Picture
posToPixelCord color (x, y) = translate (x * sizeOfTile) (y * sizeOfTile) $ color col $ rectangleSolid (fromIntegral sizeOfTile) (fromIntegral sizeOfTile)