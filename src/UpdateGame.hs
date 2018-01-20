module UpdateGame where

import Graphics.Gloss
import Graphics.Gloss.Data.ViewPort
import GameState 
import GameSettings
import Data.List
import System.Random

moveSnake :: GameState -> [Position]
moveSnake state = (xToAdd + xOld, yToAdd + yOld):(snakeBody state)
  where
  	xToAdd =  fst $ orientationToPosition (orientation state)
  	yToAdd =  snd $ orientationToPosition (orientation state)
  	xOld = fst $ head $ snakeBody state 
  	yOld = snd $ head $ snakeBody state 

ateApple :: Int -> [Position] -> Position
ateApple sizeOfBoard snakeBody = freeBoard !! randomNumber
  where
  board = [(x,y) | x <- [(-(sizeOfBoard) `div` 2)..((sizeOfBoard) `div` 2)], y <- [(-(sizeOfBoard) `div` 2)..((sizeOfBoard) `div` 2)]]
  freeBoard =  board \\ snakeBody
  g = getStdGen
  randomNumber =  fst $ randomR (0, length freeBoard - 1) g

update :: (ViewPort -> Float -> GameState -> GameState) -- ^ step
update _ _ state = Game {
	snakeBody = newSnakeBody,
	applePos = if (applePos state == (head newSnakeBody)) 
		then ateApple sizeOfBoard newSnakeBody 
		else applePos state, 
	orientation = orientation state,
	tilesToBeAdded = tilesToBeAdded state
} where
	newSnakeBody = moveSnake state 