module UpdateGame where

import Graphics.Gloss
import Graphics.Gloss.Data.ViewPort
import GameState 
import GameSettings
import Data.List

moveSnake :: GameState -> ([Position], Int)
moveSnake state | isEnded state = (snakeBody state, tilesToBeAdded state)
                | tilesToBeAdded state > 0 = ((xToAdd + xOld, yToAdd + yOld):(snakeBody state), tilesToBeAdded state - 1)
                | otherwise = ((xToAdd + xOld, yToAdd + yOld):(init $ snakeBody state), tilesToBeAdded state)
  where
  	xToAdd = fst $ orientationToPosition (orientation state)
  	yToAdd = snd $ orientationToPosition (orientation state)
  	xOld = fst $ head $ snakeBody state 
  	yOld = snd $ head $ snakeBody state 

ateApple :: [Position] -> Position
ateApple newSnakeBody = freeBoard !! ((5*p1 + (5^2)*p2 + (5^3)*p3 + (5^4)*p4) `mod` length freeBoard)
  where
  board = [(x,y) | x <- [(-(sizeOfBoard-3) `div` 2)..((sizeOfBoard-3) `div` 2)], y <- [(-(sizeOfBoard-3) `div` 2)..((sizeOfBoard-3) `div` 2)]]
  freeBoard =  board \\ newSnakeBody
  p1 = sizeOfBoard +  fst (last newSnakeBody)
  p2 = sizeOfBoard + snd (last newSnakeBody)
  p3 = sizeOfBoard + fst (head newSnakeBody)
  p4 = sizeOfBoard + snd (head newSnakeBody)

hasCollisionOccured :: [Position] -> Bool
hasCollisionOccured [] = False
hasCollisionOccured body = (fst headOfSnake >= sizeOfHalfOfBoard || fst headOfSnake <= -sizeOfHalfOfBoard) || 
                            (snd headOfSnake >= sizeOfHalfOfBoard || snd headOfSnake <= -sizeOfHalfOfBoard) ||
                            (any (==headOfSnake) $ tail body)
                            where
                            	headOfSnake = head body
                            	sizeOfHalfOfBoard = sizeOfBoard `div` 2

update :: (Float -> GameState -> GameState) -- ^ step
update _ state = Game {
	snakeBody = newSnakeBody,
	applePos = if isAppleEaten 
		then ateApple newSnakeBody 
		else applePos state, 
	orientation = orientation state,
	tilesToBeAdded = if isAppleEaten 
		then newTilesToBeAdded + rewardForEatingApple
		else newTilesToBeAdded,
	isEnded = gameEnded,
	changeOfOrientation = False
} where
	(newSnakeBody, newTilesToBeAdded) = moveSnake state
	isAppleEaten = applePos state == head newSnakeBody
	gameEnded = hasCollisionOccured newSnakeBody
