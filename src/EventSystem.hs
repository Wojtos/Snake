module EventSystem where

import Graphics.Gloss.Interface.IO.Game
import GameState 

-- | Is responsible for communication betwen program and user, performes an action for each legal input signal 
handleKeys :: Event -> GameState -> GameState
handleKeys (EventKey key Graphics.Gloss.Interface.IO.Game.Down _ _) state
 | key == (Char 'w') =  
  if canChangeTo GameState.Up state
  then state { orientation = GameState.Up, changeOfOrientation = True }
  else state
 | key == (Char 's') =
  if canChangeTo GameState.Down state
  then state { orientation = GameState.Down, changeOfOrientation = True }
  else state
 | key == (Char 'a') =
  if canChangeTo GameState.Left state
  then state { orientation = GameState.Left, changeOfOrientation = True }
  else state  
 | key == (Char 'd') =
  if canChangeTo GameState.Right state
  then state { orientation = GameState.Right, changeOfOrientation = True }
  else state
 | key == (Char 'r') = initialGameState
 
handleKeys _ state = state

-- | Chcecks if given move can be performed for current GameState or if orientation wasn't alredy changed in considered frame 
canChangeTo :: Orientation -> GameState -> Bool
canChangeTo x state = (((abs $ (orientationToInt x) - (orientationToInt $ orientation state)) `mod` 2) == 1) && (changeOfOrientation state == False)