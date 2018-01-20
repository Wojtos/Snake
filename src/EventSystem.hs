module EventSystem where

import Graphics.Gloss.Interface.IO.Game
import GameState 


handleKeys :: Event -> GameState -> GameState

handleKeys (EventKey (Char 'w') _ _ _) state =
 if 1 == (abs $ 0 - (orientationToInt $ orientation state))
 then state { orientation = GameState.Up }
 else state
handleKeys (EventKey (Char 's') _ _ _) state =
 if 1 == (abs $ 2 - (orientationToInt $ orientation state))
 then state { orientation = GameState.Down }
 else state
handleKeys (EventKey (Char 'a') _ _ _) state =
 if 1 == (abs $ 3 - (orientationToInt $ orientation state))
 then state { orientation = GameState.Left }
 else state
handleKeys (EventKey (Char 'd') _ _ _) state =
 if 1 == (abs $ 1 - (orientationToInt $ orientation state))
 then state { orientation = GameState.Right }
 else state
handleKeys (EventKey (Char 'r') _ _ _) state = initialGameState
handleKeys _ state = state
