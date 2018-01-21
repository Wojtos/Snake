module QuickCheck where

import Test.QuickCheck
import UpdateGame
import GameState
import GameSettings

propCollision :: [Position] -> Bool
propCollision [] = True
propCollision xys = not $ hasCollisionOccured xys == withOutCollision xys
	

withOutCollision (xy:xys) = (not $ elem xy xys) &&
	(fst xy < sizeOfHalfOfBoard && fst xy > -sizeOfHalfOfBoard) && 
    (snd xy < sizeOfHalfOfBoard && snd xy > -sizeOfHalfOfBoard) 
    where
        sizeOfHalfOfBoard = sizeOfBoard `div` 2

propPlaceOfApple :: [Position] -> Bool
propPlaceOfApple [] = True
propPlaceOfApple snakeBody = (fst placeOfApple < sizeOfHalfOfBoard && fst placeOfApple > -sizeOfHalfOfBoard) && 
    (snd placeOfApple < sizeOfHalfOfBoard && snd placeOfApple > -sizeOfHalfOfBoard)
	where 
		placeOfApple = ateApple snakeBody 
		sizeOfHalfOfBoard = sizeOfBoard `div` 2