module EventSystem where

import Graphics.Gloss.Interface.IO.Game
import GameState 


handleKeys :: Event -> GameState -> GameState
handleKeys (EventKey key Graphics.Gloss.Interface.IO.Game.Down _ _) state
 | key == (Char 'w') =  
  if canChangeTo GameState.Up state && changeOfOrientation state == False
  then state { orientation = GameState.Up, changeOfOrientation = True }
  else state
 | key == (Char 's') =
  if canChangeTo GameState.Down state && changeOfOrientation state == False
  then state { orientation = GameState.Down, changeOfOrientation = True }
  else state
 | key == (Char 'a') =
  if canChangeTo GameState.Left state && changeOfOrientation state == False
  then state { orientation = GameState.Left, changeOfOrientation = True }
  else state  
 | key == (Char 'd') =
  if canChangeTo GameState.Right state && changeOfOrientation state == False
  then state { orientation = GameState.Right, changeOfOrientation = True }
  else state
 | key == (Char 'r') = initialGameState
 
handleKeys _ state = state

canChangeTo :: Orientation -> GameState -> Bool
canChangeTo x state = ((abs $ (orientationToInt x) - (orientationToInt $ orientation state)) `mod` 2) == 1