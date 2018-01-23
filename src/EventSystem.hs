module EventSystem where

import Graphics.Gloss.Interface.IO.Game
import GameState 


handleKeys :: Event -> GameState -> GameState

handleKeys (EventKey (Char 'w') Graphics.Gloss.Interface.IO.Game.Down _ _) state =
 if 1 == ((abs $ 0 - (orientationToInt $ orientation state)) `mod` 2) && changeOfOrientation state == False
 then state { orientation = GameState.Up, changeOfOrientation = True }
 else state
handleKeys (EventKey (Char 's') Graphics.Gloss.Interface.IO.Game.Down _ _) state =
 if 1 == ((abs $ 2 - (orientationToInt $ orientation state)) `mod` 2) && changeOfOrientation state == False
 then state { orientation = GameState.Down, changeOfOrientation = True }
 else state
handleKeys (EventKey (Char 'a') Graphics.Gloss.Interface.IO.Game.Down _ _) state =
 if 1 == ((abs $ 3 - (orientationToInt $ orientation state)) `mod` 2) && changeOfOrientation state == False
 then state { orientation = GameState.Left, changeOfOrientation = True }
 else state
handleKeys (EventKey (Char 'd') Graphics.Gloss.Interface.IO.Game.Down _ _) state =
 if 1 == ((abs $ 1 - (orientationToInt $ orientation state)) `mod` 2) && changeOfOrientation state == False
 then state { orientation = GameState.Right, changeOfOrientation = True }
 else state
handleKeys (EventKey (Char 'r') Graphics.Gloss.Interface.IO.Game.Down _ _) state = initialGameState
handleKeys _ state = state
