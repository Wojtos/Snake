module GameState where 

type Position = (Int, Int)

data Orientation = Up |
                   Right |
                   Down |
                   Left
                   deriving Eq

orientationToInt :: Orientation -> Int
orientationToInt x | x == GameState.Up = 0
                   | x == GameState.Right = 1
                   | x == GameState.Down = 2
                   | x == GameState.Left = 3

orientationToPosition :: Orientation -> Position
orientationToPosition x | x == GameState.Up = (0,1)
                        | x == GameState.Right = (1,0)
                        | x == GameState.Down = (0,-1)
                        | x == GameState.Left = (-1,0)

data GameState = Game -- ^ data about state of the game
 { snakeBody :: [Position]
 , applePos :: Position 
 , orientation :: Orientation
 , tilesToBeAdded :: Int
 }

initialGameState :: GameState -- ^ GameState at the begining of the game
initialGameState = Game {
	snakeBody = [(0, 0)],
	applePos = (-1, 0),
	orientation = GameState.Left,
	tilesToBeAdded = 3
}  