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
ateApple sizeOfBoard newSnakeBody = freeBoard !! ((5*p1 + (5^2)*p2 + (5^3)*p3 + (5^4)*p4) `mod` length freeBoard)
  where
  board = [(x,y) | x <- [(-(sizeOfBoard) `div` 2)..((sizeOfBoard) `div` 2)], y <- [(-(sizeOfBoard) `div` 2)..((sizeOfBoard) `div` 2)]]
  freeBoard =  board \\ newSnakeBody
  p1 = sizeOfBoard +  fst (last newSnakeBody)
  p2 = sizeOfBoard + snd (last newSnakeBody)
  p3 = sizeOfBoard + fst (head newSnakeBody)
  p4 = sizeOfBoard + snd (head newSnakeBody)


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